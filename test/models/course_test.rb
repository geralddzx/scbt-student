# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  code       :string(255)
#  start_date :date
#  end_date   :date
#  hours      :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
