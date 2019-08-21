class ApplicationController < ActionController::API

require 'jwt'

    def secret_key
        @secret = 'bigCkr1t'
    end 

    def encode(payload)
        JWT.encode(payload, secret_key, 'HS256')
    end 

    def decode(token)
        JWT.decode(token, secret_key, true, {algorithm: 'HS256'})[0]
    end 

    def self.verify_curr_message
      
    @verifier = MessageVerifier.new(secret_key, digest:'SHA256',  serializer: JSON)
    #Make verified message
    
    @signed_message = @verifier.generate(token)
    #Consider limit exp date ---- more secure? --- & rotating--- 
    cookies[:remember_me] = @verifier.generate([@user.id, 100.years.from_now])
    #create verfier 
    token = @verifier.generate(token)
    @verifier.verify(token)
    end
    end 
