# == Schema Information
#
# Table name: program_files
#
#  id             :integer          not null, primary key
#  program_id     :string(255)      not null
#  file_file_name :string(255)      not null
#  file_file_size :string(255)      not null
#  created_at     :datetime
#

class ProgramFile < ActiveRecord::Base
	# has_attached_file :file
	validates :program, :file_file_name, :file_file_size, presence: true
	validate :file_within_size 
	# validates_attachment_size :file, less_than: 1000.kilobytes
	belongs_to :program

	def set_content(content)
		@content = content
		self.file_file_size = content.length/(1+1.0/3).to_i
	end

	def file_within_size
		if self.file_file_size > 1.megabytes
			errors.add(:file_file_size, "Must be smaller than 1 megabyte") 
		end	
	end
end


