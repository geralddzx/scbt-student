json.(current_user.enrollments) do |enrollment|
  json.id enrollment.course.id
  json.name enrollment.course.name
  json.code enrollment.course.code
  json.start_date enrollment.course.start_date
  json.end_date enrollment.course.end_date
  json.hours enrollment.course.hours
  json.status enrollment.status
  json.grade enrollment.grade
end
  