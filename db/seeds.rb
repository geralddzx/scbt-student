# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(:first_name => "Gerald", :last_name => "Ding", :password => "turtle", :email => "geralddzx@gmail.com", permission: "ADMIN")
User.create(:first_name => "David", :last_name => "Ding", :password => "turtle", :email => "davidd@scbt.ca", permission: "ADMIN")

User.create(:first_name => "Jack", :last_name => "Smith", :password => "turtle", :email => "jack@hotmail.com", permission: "STUDENT")
User.last.enrolled_courses.create(:name => "Math")
User.last.enrolled_courses.create(:name => "English")
User.create(:first_name => "Johnny", :last_name => "Depp", :password => "turtle", :email => "johnny@hotmail.com")
User.create(:first_name => "Kayle", :last_name => "Sux", :password => "turtle", :email => "kayle@gmail.com", permission: "INSTRUCTOR")
User.last.taught_courses.create(name: "Science")
Course.last.students.create(:first_name => "Joe", :last_name => "Smash", :password => "turtle", :email => "joe@gmail.com")

Course.last.students.create(:first_name => "Moe", :last_name => "Smash", :password => "turtle", :email => "moe@gmail.com")
enrollment = Enrollment.last
enrollment.approver_id = 1
enrollment.status = "APPROVED"
enrollment.save

User.last.enrolled_courses.create({name: "Modern Arts"})