# == Schema Information
#
# Table name: surveys
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  created_at  :datetime
#  updated_at  :datetime
#  description :string(255)
#

require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
