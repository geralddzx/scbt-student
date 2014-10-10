# == Schema Information
#
# Table name: campuses
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  manager_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#  street      :string(255)      not null
#  city        :string(255)      not null
#  country     :string(255)
#  postal_code :string(255)      not null
#

class Campus < ActiveRecord::Base
	validates :name, uniqueness: true
	validates :name, :street, :city, :postal_code, presence: true
	validate :valid_manager

	belongs_to :manager, class_name: "User"
	has_many :program_offerings
	has_many :announcements, as: :source, dependent: :destroy
	
	has_many :programs, through: :program_offerings, source: :program
	has_many :students, through: :programs, source: :students
	

	def valid_manager
		if self.manager && !self.manager.admin?
			errors.add(:manager_id, "must be an admin")
		end
	end
end
