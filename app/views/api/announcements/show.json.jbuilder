json.id @announcement.id
json.title @announcement.title
json.updated_at @announcement.updated_at.to_time.to_date_clock
json.created_at @announcement.created_at.to_time.to_date_clock
json.content @announcement.content

author = @announcement.author
json.author_name author.name
if author == current_user
	json.author true
end