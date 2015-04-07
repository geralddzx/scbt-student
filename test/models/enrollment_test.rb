# == Schema Information
#
# Table name: enrollments
#
#  id          :integer          not null, primary key
#  student_id  :integer          not null
#  section_id  :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  status      :string(255)      not null
#  grade       :integer
#  approver_id :integer
#

require 'test_helper'

class EnrollmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
