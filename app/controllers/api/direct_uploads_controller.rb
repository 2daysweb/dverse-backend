class DirectUploadsController < ActiveStorage::DirectUploadsController  
  protect_from_forgery with: :exception  
  before_action :verify_authenticity_token
  end