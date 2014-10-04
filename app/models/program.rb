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
#

class Program < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validate :valid_instructor
  
  belongs_to :instructor, -> {where permission: "INSTRUCTOR"}, class_name: "User"
  
  has_many :enrollments, dependent: :destroy
  has_many :approved_enrollments, -> {where status: "APPROVED"}, class_name: "Enrollment"
  
  has_many :program_files, dependent: :destroy
  has_many :program_offerings

  has_many :students, through: :enrollments, source: :student
  has_many :approved_students, through: :approved_enrollments, source: :student 

  def valid_instructor
  	if self.instructor_id && !self.instructor
  		errors.add(:instructor_id, "must point to an instructor")
  	end
  end
end
