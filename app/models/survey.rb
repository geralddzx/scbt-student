# == Schema Information
#
# Table name: surveys
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  created_at  :datetime
#  updated_at  :datetime
#  description :string(255)
#

class Survey < ActiveRecord::Base
	has_many :questions, class_name: "SurveyQuestion"
	has_many :answers, through: :questions, source: :answers

	has_many :instructor_hosts, class_name: "User", dependent: :nullify
	has_many :campus_hosts, class_name: "Campus", dependent: :nullify
	has_many :program_hosts, class_name: "Program", dependent: :nullify
	
	validates :title, presence: true
end
