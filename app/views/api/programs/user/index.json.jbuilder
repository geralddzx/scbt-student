json.(current_user.enrollments) do |enrollment|
  json.id enrollment.program.id
  json.name enrollment.program.name
  json.code enrollment.program.code
  json.hours enrollment.program.hours
  json.status enrollment.status
  json.grade enrollment.grade
end
  