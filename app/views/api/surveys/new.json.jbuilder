json.programs(Program.all, :id, :name)
json.campuses(Campus.all, :id, :name)
json.instructors(User.where(permission: "INSTRUCTOR"), :id, :name)