require 'rubygems'
require 'bundler'

Bundler.require(:default)
require "./abandoned_carts_endpoint"
run AbandonedCartsEndpoint
