json.(@program, :id, :name, :code, :hours, :survey_id)

current_user.student? && current_user.taken_survey?(@program) && json.taken_program_survey 

