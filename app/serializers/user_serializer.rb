class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password_digest, :avatar, :bio, :can_invite, :resume, :user_type 
  has_many :user_jobs
  has_many :jobs, through: :user_jobs 
end
