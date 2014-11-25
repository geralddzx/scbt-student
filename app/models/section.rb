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

class Section < ActiveRecord::Base
	validates :program, :campus, :instructor, :code, presence: true
	validates :code, uniqueness: {scope: :program_id}
	validate :complete_schedule

	belongs_to :campus
	belongs_to :program
	belongs_to :instructor, -> {where permission: "INSTRUCTOR"}, class_name: "User" 

	has_many :enrollments, dependent: :destroy
	has_many :enrolled_students, through: :enrollments, source: :student
	
	def complete_schedule
		filled_fields = 0
		filled_fields += 1 if start_hour
		filled_fields += 1 if start_minute
		filled_fields += 1 if end_hour
		filled_fields += 1 if end_minute
		
		return if filled_fields == 0
		return valid_schedule if filled_fields == 4
		errors.add(:schedule, "must be complete if filled")
	end

	def valid_schedule
		errors.add(:start_hour, "is not valid, choose between 0 to 23") unless start_hour.between?(8, 20)
		errors.add(:end_hour, "is not valid, choose between 0 to 23") unless end_hour.between?(8, 20)
		errors.add(:start_minute, "is not valid, choose between 0 to 59") unless [0, 30].include?(start_minute)
		errors.add(:end_minute, "is not valid, choose between 0 to 59") unless [0, 30].include?(end_minute)
	end
end
