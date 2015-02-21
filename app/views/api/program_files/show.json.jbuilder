json.id(@program_file.id)
json.url(@program_file.url)
json.program_id(@program_file.program_id)

date = @program_file.updated_at.to_time
json.date(date.to_date.to_s)
json.time("#{to_digit(date.hour, 2)}:#{to_digit(date.min, 2)}:#{to_digit(date.sec,2)}")