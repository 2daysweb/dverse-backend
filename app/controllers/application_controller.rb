class ApplicationController < ActionController::API

require 'jwt'

    def secret_key
        'shukry'
    end 

    def encode(payload)
        JWT.encode(payload, secret_key, 'HS256')
    end 

    def decode(token)
        JWT.decode(token, secret_key, true, {algorithm: 'HS256'})[0]
    end 

end 
