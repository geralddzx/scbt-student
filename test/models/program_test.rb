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

require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
