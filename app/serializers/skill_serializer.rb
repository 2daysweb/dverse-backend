class SkillSerializer < ActiveModel::Serializer
  attributes :id, :name, :yrsExperience, :desiredYrsExperience 

  has_many :user_jobs 
  has_many :users, through: :user_jobs 
end
