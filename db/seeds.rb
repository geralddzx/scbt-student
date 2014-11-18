# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(:first_name => "Gerald", :last_name => "Ding", :password => "turtle", :email => "geralddzx@gmail.com", permission: "ADMIN")
User.create(:first_name => "David", :last_name => "Ding", :password => "turtle", :email => "davidd@scbt.ca", permission: "ADMIN")
User.create(:first_name => "Johnny", :last_name => "Depp", :password => "turtle", :email => "johnny@hotmail.com")
User.create(:first_name => "Dababa", :last_name => "Lalaala", :password => "turtle", :email => "haha@gmail.com", permission: "INSTRUCTOR", survey_id: 1)
User.create(:first_name => "Kayle", :last_name => "Sux", :password => "turtle", :email => "kayle@gmail.com", permission: "INSTRUCTOR")
User.create(:first_name => "Master", :last_name => "Admin", :password => "turtle", :email => "master@gmail.com", permission: "MASTER_ADMIN")
User.create(:first_name => "Jack", :last_name => "Smith", :password => "turtle", :email => "jack@hotmail.com", permission: "STUDENT")
User.create(:first_name => "Joe", :last_name => "Smash", :password => "turtle", :email => "joe@gmail.com")
User.create(:first_name => "Moe", :last_name => "Smash", :password => "turtle", :email => "moe@gmail.com")

Program.create(name: "Science")
Program.create(name: "Math")
Program.create(name: "English")
Program.create(name: "History")
Program.create(name: "Geography")

Campus.create(name: "North York", street: "150 Consumers Rd.", city: "North York", postal_code: "M2J 1P9")
Campus.first.sections.create(program_id: 1, instructor_id: 4, code: "001")
Campus.first.sections.create(program_id: 2, instructor_id: 4, code: "001")

User.last.enrolled_sections.create(campus_id: 1, program_id: 3, instructor_id: 4, code: "001")
User.third.enrolled_sections.create(campus_id: 1, program_id: 3, instructor_id: 4, code: "002")


enrollment = Enrollment.last
enrollment.approver_id = 1
enrollment.status = "APPROVED"
enrollment.save

Announcement.create(title: "Web App on Development", author_id: 1, content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")

Survey.create(title: "Test survey")
Survey.first.questions.create(question: "What is your fav color", answer_type: "RATING", min_rating: 1, max_rating: 5)
Survey.first.questions.create(question: "Why is that your fav color", answer_type: "COMMENT") 

SurveyQuestion.first.answers.create(student_id: 4, rating: 1)
SurveyQuestion.second.answers.create(student_id: 4, comment: 123)
