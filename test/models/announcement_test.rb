# == Schema Information
#
# Table name: announcements
#
#  id         :integer          not null, primary key
#  author_id  :integer
#  title      :string(255)
#  content    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class AnnouncementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
