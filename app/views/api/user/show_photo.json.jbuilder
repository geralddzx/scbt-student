if current_user.photo.exists?
	json.photo_url(current_user.photo.url)
else
	json.photo_url(nil)
end