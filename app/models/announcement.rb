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

class Announcement < ActiveRecord::Base
	belongs_to :author, class_name: "User"
	belongs_to :source, polymorphic: true
	
	validates :title, :content, :author_id, presence: true
end
