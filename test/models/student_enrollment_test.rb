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

require 'test_helper'

class StudentEnrollmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
