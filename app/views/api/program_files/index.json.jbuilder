json.(@program_files) do |program_file|
	json.id(program_file.id)
	json.file_name(program_file.file_name)
	json.url(program_file.file.url)

	size = program_file.file_file_size
	json.file_size(to_unit(size))
end