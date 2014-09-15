json.(@campus, :id, :name)
json.manager(@campus.manager, :id, :first_name, :last_name, :email)

if current_user.master_admin?
	@admins = User.where(permission: ["ADMIN", "MASTER_ADMIN"])
	json.admins(@admins, :id, :first_name, :last_name, :email)
end