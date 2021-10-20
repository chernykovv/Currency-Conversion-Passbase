require 'sinatra'
require 'sinatra/reloader'
configure :development do
  enable :reloader
end

require_relative './routes/base'
