# == Schema Information
#
# Table name: program_offerings
#
#  id         :integer          not null, primary key
#  program_id :integer          not null
#  campus_id  :integer          not null
#  start_date :date
#  end_date   :date
#  created_at :datetime
#  updated_at :datetime
#

class ProgramOffering < ActiveRecord::Base
	validates :program_id, :campus_id, presence: true

	belongs_to :campus
	belongs_to :program	
end
