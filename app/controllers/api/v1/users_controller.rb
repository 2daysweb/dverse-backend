require "byebug"

class Api::V1::UsersController < ApplicationController

 def index 
  
    @Users = User.all 
    render json: @Users, status: 200
  end

  def show
    # byebug 
    token = request.headers["Authentication"].split(" ")[1]
    payload = decode(token)
    user = User.find(payload["user_id"])
    if user
      render json: user, status: :accepted
    else
      render json: {message: "Error", authenticated: false}
    end
  end

  def create 
    
    @user = User.new(email: params[:email], password: params[:password])
    
    if @user.valid?
      @user.save!
      payload = {"user_id": @user.id}
      token = encode(payload)
     
      render json: {
        user: @user,
        token: token,
        authenticated: true
      }
    else
      # byebug
      #where user doesn't exist OR the password isn't correct
      render json: {
        message: "INCORRECT! YOU ARE A FRAUD!",
        authenticated: false
      }
    end
  end 
end