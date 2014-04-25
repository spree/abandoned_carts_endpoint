Dir['./lib/**/*.rb'].each(&method(:require))

class AbandonedCartsEndpoint < EndpointBase::Sinatra::Base 
  set :logging, true

  Honeybadger.configure do |config|
    config.api_key = ENV['HONEYBADGER_KEY']
    config.environment_name = ENV['RACK_ENV']
  end

  Mongoid.load!("./config/mongoid.yml")

  post '/add_cart' do
    cart = Cart.find_or_initialize_by(number: cart_hash['number'])

    cart.attributes = {
      payload:          payload_without_parameters,
      last_activity_at: cart_hash['updated_at'],
      # Even though a cart might have been abandoned,
      # if there's any activity on it - make it active again
      abandoned_at:     nil
    }

    if cart.save
      result 200, "Successfully created a cart with the order number #{cart.number}"
    else
      result 500, cart.error_notification
    end
  end

  post '/update_cart' do
    cart = Cart.find_or_initialize_by(number: cart_hash['number'])
    cart.attributes = { 
      payload:          payload_without_parameters,
      last_activity_at: cart_hash['updated_at'],
      # Even though a cart might have been abandoned,
      # if there's any activity on it - make it active again
      abandoned_at:     nil
    }

    if cart.save
      result 200, "Successfully updated a cart with the order number #{cart.number}"
    else
      result 500, cart.error_notification
    end
  end

  post '/match_cart' do
    ## Would we still destroy a cart that has already been abandoned?
    ## Or we should add :abandoned_at => nil to the .where clause to keep them?
    if Cart.where(number: order_hash['number']).destroy > 0
      result 200, "Successfully matched the new order to the cart"
    else
      result 500, "Error: Unable to match the new order to a cart"
    end
  end

  post '/poll' do
    messages = []
    abandoned_carts = Cart.abandoned(abandonment_period_hours).each do |cart|
      messages << cart.create_abandoned_message
    end
    abandoned_carts.update_all(abandoned_at: Time.now.utc)

    msg = { :messages => messages }
    result 200, msg
  end

  private

  def payload_without_parameters
    @payload.tap {|x| x.delete(:parameters)}
  end

  def cart_hash
    @payload['cart'] or raise InvalidParameters, "'cart' hash must be present in the payload"
  end

  def order_hash
    @payload['order'] or raise InvalidParameters, "'order' hash must be present in the payload"
  end

  def abandonment_period_hours
    @config['abandoned_carts_abandonment_period_hours'] or raise InvalidParameters, "'abandonment_period_hours' parameter must be passed in"
  end
end
