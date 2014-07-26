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

class StudentEnrollments < ActiveRecord::Base
  validates :student_id, :course_id, presence: true
  validates [:student_id, :course_id], pressence: true
end
