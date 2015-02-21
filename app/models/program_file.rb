# == Schema Information
#
# Table name: program_files
#
#  id         :integer          not null, primary key
#  program_id :string(255)      not null
#  url        :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class ProgramFile < ActiveRecord::Base
	belongs_to :program
	validates :program, :url, presence: true
	# do_not_validate_attachment_file_type :file
 #    validates_attachment_size :file, less_than: ProgramFile::MAX_FILE_NUM

   
    

	# validates :program, :file_name, :file_size, presence: true
	# validate :file_within_size 
	# # validates_attachment_size :file, less_than: 1000.kilobytes
	# belongs_to :program

	# def set_content(content)
	# 	this.file_file_size = content.length/(1+1.0/3).to_i
	# 	@content = content
	# end

	# def file_within_size
	# 	if this.file_size > ProgramFile.MAX_FILE_SIZE
	# 		errors.add(:file_size, "Must be smaller than " + ProgramFile.MAX_FILE_DES) 
	# 	end	
	# end
end
