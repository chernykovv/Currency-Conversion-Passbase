require 'bundler'
Bundler.require
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

configure :development do
  enable :reloader
end
require_relative './app/currency_conversion'

run CurrencyConversion.new
