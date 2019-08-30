class JobSerializer < ActiveModel::Serializer
  attributes :id, :status, :title, :body, :industry, :job_type
  has_many :user_jobs
  has_many :users, through: :user_jobs
end
