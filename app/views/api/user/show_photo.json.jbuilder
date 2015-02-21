if current_user.photo_url
	json.photo_url(current_user.photo_url)
else
	json.photo_url(nil)
end