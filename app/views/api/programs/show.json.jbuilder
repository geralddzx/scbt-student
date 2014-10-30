json.(@program, :id, :name, :code, :hours, :survey_id)

if @program.instructor
  json.instructor(@program.instructor, :id, :first_name, :last_name, :survey_id)
else
  json.instructor nil
end

if params[:instructors] && current_user.master_admin?
  json.instructors User.where(permission: "INSTRUCTOR")
end

json.partial!("api/programs/show_student") if current_user.student?
json.partial!("api/programs/show_instructor") if @program.instructor == current_user
json.partial!("api/programs/show_admin") if current_user.admin?

