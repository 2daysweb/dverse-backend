class User < ApplicationRecord
    
    validates :email, :presence => true, :uniqueness => true
     validates :password, :presence => true, :confirmation => true, 
     :length => {:within => 6..40}, :on => :create 
     has_secure_password             
     has_many :user_jobs
     has_many :jobs, through: :user_jobs 
     
end
