# == Schema Information
#
# Table name: survey_questions
#
#  id          :integer          not null, primary key
#  question    :string(255)      not null
#  answer_type :string(255)      not null
#  survey_id   :integer
#  min_rating  :integer
#  max_rating  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class SurveyQuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
