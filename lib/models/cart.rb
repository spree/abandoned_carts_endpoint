class Cart
  include Mongoid::Document
  include Mongoid::Timestamps

  field :number, type: String
  field :payload, type: Hash
  field :last_activity, type: Date
  field :abandoned_at, type: Date, :default => nil

  # TODO Add validations
end