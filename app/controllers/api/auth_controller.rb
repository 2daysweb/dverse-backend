class Api::AuthController < ApplicationController

  def create 
    @user = User.find_by(email: login_params[:email])
    if @user && @user.authenticate(login_params[:password])
      payload = {"user_id": @user.id}
      token = encode(payload)
      render json: {
        user: @user,
        token: token,
        authenticated: true
    }
    else
      render json: {
        message: "Invalid Credentials. Access Denied.",
        authenticated: false
      }
    end
  end
  private 
  def login_params 
    params.permit(:email, :password)
  end 
end