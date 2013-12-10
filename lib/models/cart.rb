class Cart
  include Mongoid::Document
  include Mongoid::Timestamps

  field :number, type: String
  field :payload, type: Hash
  field :last_activity_at, type: Date
  field :abandoned_at, type: Date, :default => nil

  validates_uniqueness_of :number
  validates_presence_of :number, :payload, :last_activity_at
end