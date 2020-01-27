User.destroy_all
UserJob.destroy_all
Job.destroy_all 
UserSkill.destroy_all 
Skill.destroy_all 

admin = User.create(email: "sahnunhm@gmail.com", password:"pw1pw1", user_type:'admin')
test_candidate  = User.create(email: "c1@test.com", password:"pw1pw1", user_type:"candidate", bio:"", can_invite:true, resume:"")
test_employer = User.create(email: "e1@test.com", password:"pw1pw1", user_type:"employer")






