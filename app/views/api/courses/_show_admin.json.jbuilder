if @instructor
  json.instructor(@instructor, :id, :first_name, :last_name)
else
  json.instructor nil
end

json.enrollments(@course.enrollments) do |enrollment|
  json.id enrollment.student.id
  json.first_name enrollment.student.first_name
  json.last_name enrollment.student.last_name
  json.status enrollment.status
end