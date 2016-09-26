require "securerandom"

class User < ActiveRecord::Base
  
  class << self
    def create_user!(param_hash)
      param_hash[:session_token] = SecureRandom.base64
      create!(param_hash)
    end
  end
end