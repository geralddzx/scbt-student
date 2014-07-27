json.(@course, :name, :code, :start_date, :end_date, :hours)
json.current_user_enrollment do
  json.(@current_user_enrollment, :id, :student_id, :course_id, :status)
end
