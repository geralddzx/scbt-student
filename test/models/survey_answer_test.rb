# == Schema Information
#
# Table name: survey_answers
#
#  id          :integer          not null, primary key
#  comment     :string(255)
#  rating      :integer
#  question_id :integer
#  student_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class SurveyAnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
