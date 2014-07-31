json.(@enrollment, :id, :status, :student_id, :course_id, :grade)
json.approver(@enrollment.approver, :first_name, :last_name, :email)
