# == Schema Information
#
# Table name: student_enrollments
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  status     :string(255)      not null
#  student_id :integer          not null
#  course_id  :integer          not null
#

require 'test_helper'

class StudentEnrollmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
