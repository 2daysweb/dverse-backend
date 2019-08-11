require "byebug"

class Api::V1::UsersController < ApplicationController

 def index 
    byebug
    @Users = User.all 
    render json: @Users, status: 200
  end

  def show
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
    byebug
    @User = User.create
    
    puts @User
  end 
end