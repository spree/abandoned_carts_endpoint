class Cart
  include Mongoid::Document
  include Mongoid::Timestamps

  field :number, type: String
  field :payload, type: Hash
  field :last_activity_at, type: DateTime
  field :abandoned_at, type: DateTime, :default => nil

  index({ created_at: 1 }, { expire_after_seconds: 7889230 }) # 3 months in seconds
  index({ number: 1 })

  validates_uniqueness_of :number
  validates_presence_of :number, :payload, :last_activity_at

  # Create indexes after document is saved
  after_save do
    Cart.create_indexes
  end

  def create_abandoned_message
    {
      message: 'cart:abandoned',
      payload: self.payload
    }
  end

  def create_error_notification
    { notifications:
      [
        { 
          level: 'error',
          subject: "Error: Unable to save a cart",
          description: "Error(s): #{errors.messages.to_s}"
        }
      ]
    }
  end

  class << self
    def abandoned(number_of_hours)
      abandonment_time = Time.now.utc - (number_of_hours.to_i * 60 * 60)

      where(:last_activity_at.lt => abandonment_time, :abandoned_at => nil)
    end
  end  
end
