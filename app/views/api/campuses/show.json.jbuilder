json.(@campus, :id, :name, :street, :city, :postal_code, :country, :survey_id)

@manager = @campus.manager
if @manager
	json.manager(@manager, :id, :first_name, :last_name, :email)
end

json.taken_survey current_user.taken_survey?(@campus)

if current_user.master_admin? && params[:admins]
	@admins = User.where(permission: ["ADMIN", "MASTER_ADMIN"])
	json.admins(@admins, :id, :first_name, :last_name, :email)
end