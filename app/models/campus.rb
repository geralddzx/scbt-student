# == Schema Information
#
# Table name: campuses
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  manager_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Campus < ActiveRecord::Base
	validates :name, presence:true, uniqueness: true
	validate :valid_manager

	belongs_to :manager, class_name: "User"
	has_many :program_offerings
	has_many :programs, through: :program_offerings, source: :program
	has_many :students, through: :programs, source: :students
		
	def valid_manager
		if self.manager && !self.manager.admin?
			errors.add(:manager_id, "must be an admin")
		end
	end
end
