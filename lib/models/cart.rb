class Cart
  include Mongoid::Document
  include Mongoid::Timestamps

  field :number, type: String
  field :payload, type: Hash
  field :last_activity_at, type: DateTime
  field :abandoned_at, type: DateTime, :default => nil

  validates_uniqueness_of :number
  validates_presence_of :number, :payload, :last_activity_at

  class << self
    def abandoned(number_of_hours)
      abandonment_time = Time.now.utc - (number_of_hours.to_i * 60 * 60)

      where(:last_activity_at.gt => abandonment_time, :abandoned_at => nil)
    end
  end

  def create_abandoned_message
    {
      message: 'cart:abandoned',
      payload: self.payload
    }
  end
end