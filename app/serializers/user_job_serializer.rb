class UserJobSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :job_id 
  belongs_to :user 
  belongs_to :job
end
