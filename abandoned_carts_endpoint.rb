Dir['./lib/**/*.rb'].each(&method(:require))

class AbandonedCartsEndpoint < EndpointBase
  set :logging, true
  
  Mongoid.load!("./config/mongoid.yml")

  post '/save_cart' do
    begin
  	  cart = Cart.find_or_initialize_by(number: cart_hash['number'])
      cart.attributes = { 
        payload:          payload_without_parameters,
        last_activity_at: cart_hash['updated_at'],
        # Even though a cart might have been abandoned,
        # if there's any activity on it - make it active again
        abandoned_at:     nil
      }

      if cart.save
        code = 200
        msg = save_cart_success_notification(cart.number)
      else
        code = 500        
        msg = cart.create_error_notification
      end      
    rescue => e
      code = 500
      msg = standard_error_notification(e)
    end

    process_result code, base_msg.merge(msg)
  end

  post '/match_cart' do
    begin
      ## Would we still destroy a cart that has already been abandoned?
      ## Or we should add :abandoned_at => nil to the .where clause to keep them?
      if Cart.where(number: order_hash['number']).destroy > 0
        code = 200
        msg = match_cart_notification('info')
      else
        code = 500
        msg = match_cart_notification('error')
      end      
    rescue => e
      code = 500
      msg = standard_error_notification(e)
    end

    process_result code, base_msg.merge(msg)    
  end

  post '/poll' do
    begin
      messages = []

      abandoned_carts = Cart.abandoned(abandonment_period_hours).each do |cart|
        messages << cart.create_abandoned_message
      end
      abandoned_carts.update_all(abandoned_at: Time.now.utc)

      msg = { :messages => messages}
      code = 200
    rescue => e
      code = 500
      msg = standard_error_notification(e)
    end

    process_result code, base_msg.merge(msg)
  end  

  private
  def payload_without_parameters
    @message[:payload].tap {|x| x.delete(:parameters)}
  end

  def cart_hash
    @message[:payload]['cart'] or raise InvalidParameters, "'cart' hash must be present in the payload"
  end

  def order_hash
    @message[:payload]['order'] or raise InvalidParameters, "'order' hash must be present in the payload"
  end

  def abandonment_period_hours
    @config['abandoned_carts.abandonment_period_hours'] or raise InvalidParameters, "'abandonment_period_hours' parameter must be passed in"
  end

  def base_msg
  	{ 'message_id' => @message[:message_id] }
  end

  def message_name
    @message['message']
  end

  def cart_action
    message_name == 'cart:new' ? 'saved' : 'updated'
  end

  def save_cart_success_notification(number)
    { notifications:
      [
        { 
          level: 'info',
          subject: "Successfully #{cart_action} a cart with the order number #{number}",
          description: "Successfully #{cart_action} a cart with the order number #{number}"
        }
      ]
    }
  end

  def match_cart_notification(level)
    msg = (level == 'info') ? "Successfully matched the new order to the cart" : "Error: Unable to match the new order to a cart"
    { notifications:
      [
        { level: level, subject: msg, description: msg }
      ]
    }
  end 

  def standard_error_notification(e)
    { notifications:
      [
        { 
          level: 'error',
          subject: "#{e.class}: #{e.message.strip}",
          description: "#{e.class}: #{e.message.strip}",
          backtrace: e.backtrace.to_a.join('\n\t')
        }
      ]
    }
  end
end
