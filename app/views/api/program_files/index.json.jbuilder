json.program_files do 
	json.(@program_files) do |program_file|
		json.id(program_file.id)
		json.file_name(program_file.file_file_name)
		json.url(program_file.file.url)

		size = program_file.file_file_size
		json.file_size(to_unit(size))

		date = program_file.file_updated_at.to_time
		json.date(date.to_date.to_s)
		json.time("#{to_digit(date.hour, 2)}:#{to_digit(date.min, 2)}:#{to_digit(date.sec,2)}")
	end
end
json.change_permission @change_permission
json.max_file_num ProgramFile::MAX_FILE_NUM
json.max_file_word ProgramFile::MAX_FILE_WORD