@enrollment = @course.enrollments.find_by(student_id: current_user.id) || Enrollment.new
json.enrollment(@enrollment, :id, :student_id, :course_id, :status)
