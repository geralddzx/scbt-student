# == Schema Information
#
# Table name: programs
#
#  id            :integer          not null, primary key
#  name          :string(255)      not null
#  code          :string(255)
#  hours         :integer
#  created_at    :datetime
#  updated_at    :datetime
#  instructor_id :integer
#  survey_id     :integer
#

class Program < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validate :valid_instructor
  validate :valid_survey
  
  belongs_to :instructor, -> {where permission: "INSTRUCTOR"}, class_name: "User"
  belongs_to :survey

  has_many :announcements, as: :source, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :approved_enrollments, -> {where status: "APPROVED"}, class_name: "Enrollment"
  
  has_many :program_files, dependent: :destroy
  has_many :program_offerings
  has_many :survey_answers, as: :subject, dependent: :destroy

  has_many :survey_questions, through: :survey, source: :questions
  has_many :students, through: :enrollments, source: :student
  has_many :approved_students, through: :approved_enrollments, source: :student 

  def valid_instructor
  	if self.instructor_id && !self.instructor
  		errors.add(:instructor_id, "must point to an instructor")
  	end
  end

  def valid_survey
    if self.survey_id && !self.survey
      errors.add(:survey_id, "must point to a survey")
    end
  end
end
