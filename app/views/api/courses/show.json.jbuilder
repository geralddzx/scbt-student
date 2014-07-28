json.(@course, :name, :code, :start_date, :end_date, :hours)
json.partial!("api/courses/show_student") if current_user.permission == "STUDENT"
json.partial!("api/courses/show_instructor") if @course.instructor == current_user
json.partial!("api/courses/show_admin") if current_user.permission == "ADMIN"