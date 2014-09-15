# == Schema Information
#
# Table name: program_offerings
#
#  id         :integer          not null, primary key
#  program_id :integer          not null
#  campus_id  :integer          not null
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ProgramOfferingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
