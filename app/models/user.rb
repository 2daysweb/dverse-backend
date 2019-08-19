class User < ApplicationRecord
    has_secure_password  
    has_one_attached :resume
    has_one_attached :avatar
    has_many :user_jobs
    has_many :jobs, through: :user_jobs 


    # self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'nan.jpg')), filename: 'nan.jpg', content_type: 'image/jpg')


end
