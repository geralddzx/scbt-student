json.enrollments(@course.enrollments) do |enrollment|
  json.id enrollment.id
  json.first_name enrollment.student.first_name
  json.last_name enrollment.student.last_name
  json.status enrollment.status
  
  if enrollment.approver
    json.approver(enrollment.approver, :email, :first_name, :last_name)
  else
    json.approver nil
  end
end