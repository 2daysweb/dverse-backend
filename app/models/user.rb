class User < ApplicationRecord
    has_secure_password  
    has_many :user_job_postings
    has_many :job_postings, through: :user_job_postings 
end
