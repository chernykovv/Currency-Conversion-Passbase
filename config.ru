require 'bundler'
Bundler.require
require 'sinatra'
require 'sinatra/activerecord'

require_relative './app/currency_conversion'

run CurrencyConversion.new
