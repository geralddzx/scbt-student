# == Schema Information
#
# Table name: announcements
#
#  id          :integer          not null, primary key
#  author_id   :integer          not null
#  title       :string(255)      not null
#  content     :text
#  created_at  :datetime
#  updated_at  :datetime
#  source_id   :integer
#  source_type :string(255)
#

require 'test_helper'

class AnnouncementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
