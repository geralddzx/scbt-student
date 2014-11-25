json.programs(Program.all, :id, :name, :code)
json.campuses(Campus.all, :id, :name)
json.instructors(User.where(permission: "INSTRUCTOR"), :id, :name)