json.(@users) do |user|
	json.user(user, :id, :name)
	json.sections(user.sections) do |section|
		json.id(section.id)
		json.code(section.code)
    	json.instructor(section.instructor, :id, :name)       
		json.campus(section.campus, :id, :name)
		json.monday section.monday      
		json.tuesday section.tuesday     
		json.wednesday section.wednesday   
		json.thursday section.thursday    
		json.friday section.friday      
		json.saturday section.saturday   
		json.sunday section.sunday      
		json.start_hour section.start_hour  
		json.start_minute section.start_minute
		json.end_hour section.end_hour 
		json.end_minute section.end_minute
   end
end