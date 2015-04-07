json.campuses(Campus.all, :id, :name)
json.programs(Program.all, :id, :name)
json.students(User.students, :id, :name)
json.sections(Section.all, :id, :code, :program_id, :campus_id)
json.admins(User.admins, :id, :name)

json.enrollments(Enrollment.all) do |enrollment|
	json.approver(enrollment.approver, :id, :name) if enrollment.approver
	json.id enrollment.id 
	json.student_id enrollment.student_id
	json.section_id enrollment.section_id
	json.status enrollment.status
	json.section(enrollment.section, :id, :code, :instructor_id, :program_id, :campus_id)
	json.program_id enrollment.section.program_id
	json.campus_id enrollment.section.campus_id
end

