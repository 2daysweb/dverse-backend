# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.destroy_all
UserJob.destroy_all
Job.destroy_all 
UserSkill.destroy_all 
Skill.destroy_all 

user_1 = User.create(email: "sahnunhm@gmail.com", password:"pw1", user_type:'admin')
user_2 = User.create(email: "c1@test.com", password:"pw1", user_type:"candidate", bio:"", can_invite:true, resume:"")
user_3 = User.create(email: "e1@test.com", password:"pw1", user_type:"employer")






