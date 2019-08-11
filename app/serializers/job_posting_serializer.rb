class JobPostingSerializer < ActiveModel::Serializer
  attributes :id, :is_approved, :is_active, :title, :body, :industry, :job_type
  has_many :user_job_postings
  has_many :users, through: :user_job_postings 
end
