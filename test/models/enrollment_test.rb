# == Schema Information
#
# Table name: enrollments
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  status      :string(255)      not null
#  student_id  :integer          not null
#  program_id  :integer          not null
#  grade       :integer
#  approver_id :integer
#

require 'test_helper'

class EnrollmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
