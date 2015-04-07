section = @section if @section


json.id(section.id)
json.code(section.code)

json.program_id section.program_id
json.program section.program.name

json.instructor_id section.instructor_id
json.instructor(section.instructor, :id, :name)

json.campus_id section.campus_id
json.campus(section.campus, :id, :name)

json.monday section.monday      
json.tuesday section.tuesday     
json.wednesday section.wednesday   
json.thursday section.thursday    
json.friday section.friday      
json.saturday section.saturday   
json.sunday section.sunday      
json.start_hour section.start_hour  
json.start_minute section.start_minute
json.end_hour section.end_hour 
json.end_minute section.end_minute

if current_user.student?
	enrollment = Enrollment.find_by({section_id: section.id, student_id: current_user.id})
	json.enrollment(enrollment, :id, :status) if enrollment
end