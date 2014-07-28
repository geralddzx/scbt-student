# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(:first_name => "Gerald", :last_name => "Ding", :password => "turtle", :email => "geralddzx@gmail.com", permission: "ADMIN")
User.first.enrolled_courses.create(:name => "Math")
User.first.enrolled_courses.create(:name => "English")
User.create(:first_name => "Gerald", :last_name => "Ding", :password => "turtle", :email => "geralddzx@hotmail.com")
User.create(:first_name => "Kayle", :last_name => "Sux", :password => "turtle", :email => "zixiongding@gmail.com", permission: "INSTRUCTOR")
User.last.taught_courses.create(name: "Science")
Course.last.students.create(:first_name => "Joe", :last_name => "Smash", :password => "turtle", :email => "joe@gmail.com")

Course.last.students.create(:first_name => "Moe", :last_name => "Smash", :password => "turtle", :email => "moe@gmail.com")
Course.last.approved_students.create(:first_name => "Teem", :last_name => "Mo", :password => "turtle", :email => "step@on.mushroom")