# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)User.destroy_all
User.destroy_all
UserJob.destroy_all
Job.destroy_all 
UserSkill.destroy_all 
Skill.destroy_all 

# u = User.create(email: ENV['USER'])

user_1 = User.create(email: "sahnunhm@gmail.com", password:"pw1", user_type:'admin')
user_2 = User.create(email: "c1@test.com", password:"pw1", user_type:"candidate", bio:"", can_invite:true, resume:"")
user_3 = User.create(email: "e1@test.com", password:"pw1", user_type:"employer")

# job_1 = Job.create(is_approved:true, is_active:true, body:"This is a job description", title:"Senior NET Developer", industry:"Software Engineering", job_type:"full time")
# user_job_1 = UserJob.create(user_id:user_1.id, job_id:job_1.id)

# skill_1 = Skill.create( name: "Javascript", yrsExp:3, desiredYrsExp: 5)
# # skill_2 = Skill.create(user_id:user_1.id name: "Javascript", yrsExperience:3, desiredYrsExperience: 5)
# # skill_3 = Skill.create(user_id:user_1.id name: "Javascript", yrsExperience:3, desiredYrsExperience: 5)

# user_skill_1 = UserSkill.create(skill_id: skill_1.id, user_id:user_1.id)




