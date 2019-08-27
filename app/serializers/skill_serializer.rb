class SkillSerializer < ActiveModel::Serializer
  attributes :id, :name, :yrs_exp, :desired_yrs_exp 
  has_many :user_jobs 
  has_many :users, through: :user_jobs 
end
