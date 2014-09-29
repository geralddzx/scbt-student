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

class Announcement < ActiveRecord::Base
	belongs_to :author, class_name: "User"
	validates :title, :content, :author_id, presence: true
end
