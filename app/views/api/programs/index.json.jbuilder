json.(current_user.enrollments) do |enrollment|
  json.id enrollment.program.id
  json.name enrollment.program.name
  json.code enrollment.program.code
  json.start_date enrollment.program.start_date
  json.end_date enrollment.program.end_date
  json.hours enrollment.program.hours
  json.status enrollment.status
  json.grade enrollment.grade
end
  