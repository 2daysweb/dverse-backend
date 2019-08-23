class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password_digest, :bio, :can_invite, :resume, :user_type, :first_name, :last_name 
  has_many :user_jobs
  has_many :jobs, through: :user_jobs 
  # has_one_attached :avatar
end
