json.instructors User.where(permission: "INSTRUCTOR"), :id, :name
json.instructor_hosts @instructor_hosts, :id, :name