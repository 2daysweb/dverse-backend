class UserJobPostingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :job_posting_id 
  belongs_to :user 
  belongs_to :job_posting 
end
