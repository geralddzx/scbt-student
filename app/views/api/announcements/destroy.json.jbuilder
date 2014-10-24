json.total_pages Announcement.total_pages

json.announcements (@announcements) do |announcement|
	json.id announcement.id
	json.title announcement.title

	time = announcement.updated_at.to_time
	json.updated_at time.to_date_clock

	author = announcement.author
	json.author_name author.name
	if author == current_user
		json.author true
	end
end

json.page @page