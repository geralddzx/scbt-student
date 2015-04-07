json.approver(@enrollment.approver, :id, :name) if @enrollment.approver
json.id @enrollment.id 
json.student_id @enrollment.student_id
json.section_id @enrollment.section_id
json.status @enrollment.status
json.section(@enrollment.section, :id, :code, :instructor_id, :program_id, :campus_id)
json.program_id @enrollment.section.program_id
json.campus_id @enrollment.section.campus_id