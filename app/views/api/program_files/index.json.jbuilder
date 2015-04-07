json.program_files do 
	json.(@program_files) do |program_file|
		json.id(program_file.id)
		json.url(program_file.url)

		date = program_file.updated_at.to_time
		json.date(date.to_date.to_s)
		json.time(date.to_clock)
	end
end

json.change_permission @change_permission
