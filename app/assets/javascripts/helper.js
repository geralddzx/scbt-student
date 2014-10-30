var capitalize = function(string){
	return string[0].toUpperCase() + string.slice(1).toLowerCase()
}

var pluralize = {
	"campus": "campuses",
	"program": "programs",
	"user": "users",
	"instructor": "instructors"
}