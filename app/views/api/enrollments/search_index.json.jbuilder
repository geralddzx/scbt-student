json.campuses(Campus.all, :id, :name)
json.programs(Program.all, :id, :name)
json.students(User.students, :id, :name)
json.sections(Section.all, :id, :code, :program_id, :campus_id)
json.admins(User.admins, :id, :name)