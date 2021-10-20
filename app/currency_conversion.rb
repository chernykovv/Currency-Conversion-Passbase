require 'sinatra/base'
require_relative './routes/base'
require_relative './models/project'

class CurrencyConversion < Sinatra::Base
  get '/' do
    'Welcome to the currency conversion application'
  end
  extend ProjectRoutes
  extend CurrencyConversionRoutes
end
