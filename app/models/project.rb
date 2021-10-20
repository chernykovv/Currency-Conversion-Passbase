require "sinatra/activerecord"

class Project < ActiveRecord::Base
  before_create :generate_api_key

  def generate_api_key
    self.api_key = SecureRandom.hex(15)
  end
end
