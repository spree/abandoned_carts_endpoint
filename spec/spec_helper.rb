require 'rubygems'
require 'bundler'

Bundler.require(:default, :test)

require File.join(File.dirname(__FILE__), '..', 'abandoned_carts_endpoint.rb')
Dir["./spec/support/**/*.rb"].each(&method(:require))

Sinatra::Base.environment = 'test'

def app
  AbandonedCartsEndpoint
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.before :each do
    Mongoid.purge!
  end
end

ENV['ENDPOINT_KEY'] = 'x123'
