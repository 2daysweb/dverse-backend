class User < ApplicationRecord
    has_secure_password  
    # validates :email, :presence => true, :uniqueness => true
                    
    # has_one_attached :resume
    has_many :user_jobs
    has_many :jobs, through: :user_jobs 

end
