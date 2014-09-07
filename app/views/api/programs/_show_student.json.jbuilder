@enrollment = @program.enrollments.find_by(student_id: current_user.id)

if @enrollment
  json.enrollment(@enrollment, :id, :student_id, :program_id, :status) 
  json.enrollment { json.approver @enrollment.approver }
else
  json.enrollment nil
end