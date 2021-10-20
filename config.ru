require 'sinatra'
require 'sinatra/reloader'
configure :development do
  enable :reloader
end
require_relative './app/currency_conversion'

run CurrencyConversion.new
