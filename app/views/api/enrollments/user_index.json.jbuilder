json.(current_user.enrollments) do |enrollment|
  json.id enrollment.program.id
  json.name enrollment.program.name
  json.section enrollment.section.code
  json.status enrollment.status
  json.grade enrollment.grade
end
  