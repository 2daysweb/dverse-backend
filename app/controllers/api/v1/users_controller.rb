require "byebug"

class Api::V1::UsersController < ApplicationController

  before_action :set_curr_user, only: [:show, :update, :destroy]
  # after_action :set_curr_user, only: :verify_curr_user
  # after_action :verify_curr_user, only: [:create]
 
  #After creating a new user, ensure all 

 def index 
    @users = User.all 
    render json: @Users, status: 200
  end

  def show
    # byebug 
    token = request.headers["Authentication"].split(" ")[1]
    payload = decode(token)
    @user = User.find(payload["user_id"])
    if @user
      render json: user, status: :accepted
    else
      render json: {message: "Error", authenticated: false}
    end
  end

  def create 
  
    @user = User.new(email: params[:email], password: params[:password])

    
    #If user params validated
    if @user.valid?
  
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
  
  def set_curr_user
    @user = User.find(@user.id)
  end 

  def update 
    @user = User.find(user_params[:id])
    @user.update(email: user_params[:email], password: user_params[:password])
    if user_params[:profile]
      blob = ActiveStorage::Blob.find_by(filename: user_params[:profile])
      @user.profile.attach(blob)
    end 
    @user.save 
    render json: user
  end 

  private def user_params
     params.require(:user).permit(:email, :password)
  end 
end


  # def verify_curr_user
  #   id, time = @verifier.verify(cookies[:remember_me])
  #   #If it's earlier than 99 year exp date ---- exp date set in verify_curr_user method
  #   if Time.now < time
  #  @user = User.find(id)
  #   else 
  #     @user = {}
  #   end
  # end 
