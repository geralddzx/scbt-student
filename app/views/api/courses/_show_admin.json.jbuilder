if @instructor
  json.instructor(@instructor, :id, :first_name, :last_name)
else
  json.instructor nil
end