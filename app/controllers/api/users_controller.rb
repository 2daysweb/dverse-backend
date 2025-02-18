class Api::UsersController < ApplicationController

 def index 
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
  def update
    user = User.find(user_params[:id])
    user.update(email: user_params[:email], password: user_params[:password])
    if user_params[:resume]
      blob = ActiveStorage::Blob.find_by(filename: user_params[:resume])
      user.resume.attach(blob)
    end
   user.save
   render json: user
  end
  def create 
    @user = User.new(email: params[:email], password: params[:password], user_type: params[:user_type], first_name: params[:first_name], last_name: params[:last_name])
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
      render json: {
        message: "Invalid Credentials. Login Failed.",
        authenticated: false
      }
    end
  end 
  
private 
def user_params
  params.permit(:email, :password, :user_type, :first_name, :last_name)
end 

end
 

