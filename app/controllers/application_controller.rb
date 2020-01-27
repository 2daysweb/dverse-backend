class ApplicationController < ActionController::API
require 'jwt'
require 'byebug'
    def secret_key
        @secret = 'bigCkr1t'
    end 
    def encode(payload)
        JWT.encode(payload, secret_key, 'HS256')
    end 
    def decode(token)
        JWT.decode(token, secret_key, true, {algorithm: 'HS256'})[0]
    end
end 
