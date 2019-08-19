class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password_digest, :bio, :can_invite, :user_type 
  has_one_attached :avatar
  has_one_attached :resume
  has_many :user_jobs
  has_many :jobs, through: :user_jobs 

  def file
    begin
      FOR RUNNING W JUST ACTIVE RECORD
      short_url = Rails.application.routes.url_helpers.rails_blob_path(object.file, only_path: true)
      url = "http://6b0fba3a.ngrok.io" + short_url
    rescue
    return ''
    end
end

end
