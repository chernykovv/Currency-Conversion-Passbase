require 'sinatra/base'
require "sinatra/reloader"
require_relative './routes/project_routes'
require_relative './routes/currency_conversion_routes'
require_relative './models/project'

class CurrencyConversion < Sinatra::Base
  register Sinatra::Reloader
  get '/' do
    'Welcome to the currency conversion application'
  end

  extend ProjectRoutes
  extend CurrencyConversionRoutes
end
