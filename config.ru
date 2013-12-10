require 'rubygems'
require 'bundler'
require 'pry'
Bundler.require(:default)
require "./abandoned_carts_endpoint"
run AbandonedCartsEndpoint
binding.pry
