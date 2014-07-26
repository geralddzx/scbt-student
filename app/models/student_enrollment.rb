# == Schema Information
#
# Table name: student_enrollments
#
#  id         :integer          not null, primary key
#  student_id :string(255)      not null
#  course_id  :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class StudentEnrollment < ActiveRecord::Base
  validates :student_id, :course_id, presence: true
  validates :course_id, uniqueness: {scope: :student_id}
  
  belongs_to :student, class_name: "User", foreign_key: :student_id
  belongs_to :course
end
