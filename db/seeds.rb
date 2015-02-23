# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or create!d alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)
Survey.create!(title: "Test survey")
Survey.first.questions.create!(question: "What is your fav color", answer_type: "RATING", min_rating: 1, max_rating: 5)
Survey.first.questions.create!(question: "Why is that your fav color", answer_type: "COMMENT") 

User.create!(:first_name => "Guest", :last_name => "Master", :password => "guest1", :password_confirm => "guest1", :email => "guest@gmail.com", permission: "ADMIN")
User.create!(:first_name => "Gerald", :last_name => "Ding", :password => "turtle", :password_confirm => "turtle", :email => "geralddzx@gmail.com", permission: "ADMIN")
User.create!(:first_name => "David", :last_name => "Ding", :password => "turtle", :password_confirm => "turtle", :email => "davidd@scbt.ca", permission: "ADMIN")
User.create!(:first_name => "Johnny", :last_name => "Depp", :password => "turtle", :password_confirm => "turtle", :email => "johnny@hotmail.com")
User.create(:first_name => "Dababa", :last_name => "Lalaala", :password => "turtle", :password_confirm => "turtle", :email => "haha@gmail.com", permission: "INSTRUCTOR", survey_id: 1)
User.create!(:first_name => "Kayle", :last_name => "Sux", :password => "turtle", :password_confirm => "turtle", :email => "kayle@gmail.com", permission: "INSTRUCTOR")
User.create!(:first_name => "Master", :last_name => "Admin", :password => "turtle", :password_confirm => "turtle", :email => "master@gmail.com", permission: "MASTER_ADMIN")
User.create!(:first_name => "Jack", :last_name => "Smith", :password => "turtle", :password_confirm => "turtle", :email => "jack@hotmail.com", permission: "STUDENT")
User.create!(:first_name => "Joe", :last_name => "Smash", :password => "turtle", :password_confirm => "turtle", :email => "joe@gmail.com")
User.create!(:first_name => "Moe", :last_name => "Smash", :password => "turtle", :password_confirm => "turtle", :email => "moe@gmail.com")

Program.create!(name: "Science", survey_id: 1)
Program.create!(name: "Math")
Program.create!(name: "English")
Program.create!(name: "History")
Program.create!(name: "Geography")

Campus.create!(name: "North York", street: "150 Consumers Rd.", city: "North York", postal_code: "M2J 1P9")
Campus.create!(name: "Scarborough", street: "930 Progress Ave.", city: "Scarborough", postal_code: "M2J 1P9")

Section.create!(campus_id: 1, program_id: 3, instructor_id: 4, code: "001")
Section.create!(campus_id: 1, program_id: 3, instructor_id: 4, code: "002")
Section.create!(campus_id: 2, program_id: 2, instructor_id: 4, code: "002")
Section.create!(campus_id: 2, program_id: 4, instructor_id: 5, code: "002")

Enrollment.create!(student_id: 7, section_id: 1, status: "PENDING")
Enrollment.create!(student_id: 8, section_id: 2, status: "APPROVED", approver_id: 1)
Enrollment.create!(student_id: 7, section_id: 2, status: "PENDING")
Enrollment.create!(student_id: 9, section_id: 3, status: "APPROVED", approver_id: 1)
Enrollment.create!(student_id: 9, section_id: 1, status: "PENDING")
Enrollment.create!(student_id: 9, section_id: 2, status: "PENDING")

Announcement.create!(title: "Web App on Development", author_id: 1, content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")

SurveyQuestion.first.answers.create!(student_id: 7, rating: 1, subject_id: 1, subject_type: "Program")
SurveyQuestion.second.answers.create!(student_id: 7, comment: 123, subject_id: 1, subject_type: "Program")
