json.id(current_user.id)
json.first_name(current_user.first_name)
json.last_name(current_user.last_name)
json.email(current_user.email)
json.street(current_user.street)
json.city(current_user.city)
json.country(current_user.country)
json.postal_code(current_user.postal_code)
json.phone(current_user.phone)

if current_user.photo.exists?
	json.photo_url(current_user.photo.url)
else
	json.photo_url(nil)
end
	
json.maxPhotoSize User::MAX_PHOTO_SIZE
json.maxPhotoDes User::MAX_PHOTO_DES