class JobPosting < ApplicationRecord
    has_many :user_job_postings 
    has_many :users, through: :user_job_postings
end
