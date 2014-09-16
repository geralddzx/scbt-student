json.(@campus, :id, :name, :street, :city, :postal_code, :country)

@manager = @campus.manager
if @manager
	json.manager(@manager, :id, :first_name, :last_name, :email)
end

if current_user.master_admin? && params[:admins]
	@admins = User.where(permission: ["ADMIN", "MASTER_ADMIN"])
	json.admins(@admins, :id, :first_name, :last_name, :email)
end