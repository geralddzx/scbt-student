# == Schema Information
#
# Table name: program_files
#
#  id                :integer          not null, primary key
#  program_id        :string(255)      not null
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime
#  updated_at        :datetime
#

class ProgramFile < ActiveRecord::Base
	has_attached_file :file

	validates :program, :file, presence: true
	validates_attachment_size :file, less_than: 1000.kilobytes
	do_not_validate_attachment_file_type :file

	belongs_to :program
end
