# == Schema Information
#
# Table name: sections
#
#  id            :integer          not null, primary key
#  program_id    :integer          not null
#  campus_id     :integer          not null
#  instructor_id :integer          not null
#  code          :string(255)      not null
#  monday        :boolean
#  tuesday       :boolean
#  wednesday     :boolean
#  thursday      :boolean
#  friday        :boolean
#  saturday      :boolean
#  sunday        :boolean
#  start_hour    :integer
#  start_minute  :integer
#  end_hour      :integer
#  end_minute    :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
