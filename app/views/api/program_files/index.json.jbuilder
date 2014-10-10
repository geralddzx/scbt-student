json.program_files do 
	json.(@program_files) do |program_file|
		json.id(program_file.id)
		json.file_name(program_file.file_file_name)
		json.url(program_file.file.url)

		size = program_file.file_file_size
		json.file_size(to_unit(size))

		date = program_file.file_updated_at.to_time
		json.date(date.to_date.to_s)
		json.time(date.to_clock)
	end
end
json.change_permission @change_permission
json.maxFileSize ProgramFile::MAX_FILE_NUM
json.maxFileDes ProgramFile::MAX_FILE_WORD