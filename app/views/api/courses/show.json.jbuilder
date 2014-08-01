json.(@course, :id, :name, :code, :start_date, :end_date, :hours)

if @course.instructor
  json.instructor(@course.instructor, :id, :first_name, :last_name)
else
  json.instructor nil
end

if params[:instructors] && current_user.master_admin?
  json.instructors User.where(permission: "INSTRUCTOR") 
end

json.partial!("api/courses/show_student") if current_user.student?
json.partial!("api/courses/show_instructor") if @course.instructor == current_user
json.partial!("api/courses/show_admin") if current_user.admin?

