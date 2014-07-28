json.(@course, :name, :code, :start_date, :end_date, :hours)
if current_user.permission == "STUDENT"
json.current_user_enrollment do
  json.(@current_user_enrollment, :id, :student_id, :course_id, :status)
end
