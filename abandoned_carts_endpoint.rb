Dir['./lib/**/*.rb'].each(&method(:require))

class AbandonedCartsEndpoint < EndpointBase
  set :logging, true
  
  Mongoid.load!("./config/mongoid.yml")

  post '/save_cart' do
    begin
  	  cart = Cart.find_or_initialize_by(number: @message[:payload]['cart']['number'])
      cart.attributes = { 
        payload:          @message[:payload],
        last_activity_at: @message[:payload]['cart']['updated_at']
      }
      
      if cart.save
        code = 200
        msg = save_cart_success_notification(cart.number)
      else
        code = 500        
        errors = cart.errors.messages.to_s
        msg = save_cart_fail_notification(errors)
      end      
    rescue => e
      code = 500
      msg = standard_error_notifications_hash(e)
    end

    process_result code, base_msg.merge(msg)
  end

  post '/match_cart' do
    begin
      if Cart.where(number: @message[:payload]['order']['number']).destroy > 0
        code = 200
        msg = match_cart_success_notification
      else
        code = 500
        msg = match_cart_fail_notification
      end      
    rescue => e
      code = 500
      msg = standard_error_notifications_hash(e)
    end

    process_result code, base_msg.merge(msg)    
  end

  # post '/abandon_carts' do
  # end  

  private
  def base_msg
  	{ 'message_id' => @message[:message_id] }
  end

  ## TODO Refactor notifications
  def save_cart_success_notification(number)
    { notifications:
      [
        { 
          level: 'info',
          subject: "Successfully saved a cart with number #{number}",
          description: "Successfully saved a cart with number #{number}"
        }
      ]
    }
  end

  def save_cart_fail_notification(errors)
    { notifications:
      [
      	{ 
          level: 'error',
          subject: "Error: Unable to save a cart",
          description: "Error(s): #{errors}",
          backtrace: e.backtrace.to_a.join('\n\t')
        }
      ]
    }
  end

  def standard_error_notifications_hash(e)
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

  def match_cart_success_notification
    { notifications:
      [
        { 
          level: 'info',
          subject: "Successfully matched the new order to the cart",
          description: "Successfully matched the new order to the cart",
        }
      ]
    }
  end

  def match_cart_fail_notification
    { notifications:
      [
        { 
          level: 'error',
          subject: "Error: Unable to match the new order to a cart",
          description: "Error: Unable to match the new order to a cart"
        }
      ]
    }
  end  
end
