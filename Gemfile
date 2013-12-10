ruby '2.0.0'

source 'https://rubygems.org'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'capistrano'

gem 'json'
gem 'nokogiri'
gem 'mongoid', '3.1.6'

group :development do
  gem 'shotgun'
  gem 'pry'
  gem 'awesome_print'
end

group :test do
  gem 'rspec'
  gem 'webmock'
  gem 'guard-rspec'
  gem 'terminal-notifier-guard'
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'rack-test'
  gem 'debugger'
end

group :production do
  gem 'foreman'
  gem 'unicorn'
end

gem 'endpoint_base', :git => 'https://github.com/spree/endpoint_base.git'
