# == Schema Information
#
# Table name: campuses
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  manager_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#  street      :string(255)      not null
#  city        :string(255)      not null
#  country     :string(255)
#  postal_code :string(255)      not null
#  survey_id   :integer
#

require 'test_helper'

class CampusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
