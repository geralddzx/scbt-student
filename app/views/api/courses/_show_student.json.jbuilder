@enrollment = @course.enrollments.find_by(student_id: current_user.id)
json.enrollment(@enrollment, :id, :student_id, :course_id, :status) if @enrollment
