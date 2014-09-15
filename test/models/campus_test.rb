# == Schema Information
#
# Table name: campuses
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  manager_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class CampusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
