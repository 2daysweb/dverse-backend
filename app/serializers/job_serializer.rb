class JobSerializer < ActiveModel::Serializer
  attributes :id, :is_draft, :is_submitted, :is_approved, :is_active, :title, :body, :industry, :job_type
  has_many :user_jobs
  has_many :users, through: :user_jobs
end
