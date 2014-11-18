var capitalize = function(string){
	return string[0].toUpperCase() + string.slice(1).toLowerCase()
}

var pluralize = {
	"campus": "campuses",
	"program": "programs",
	"user": "users",
	"instructor": "instructors",
	"student": "students",
}

var singularize = {
	"campuses": "campus",
	"programs": "program",
	"users": "user",
}

var weekdays = {
	monday: "Mon",
	tuesday: "Tue",
	wednesday: "Wed",
	thursday: "Thu",
	friday: "Fri",
	saturday: "Sat",
	sunday: "Sun",
}

String.prototype.toClock = function(){
	return ("0" + this).slice(this.length - 1, this.length + 1)
}