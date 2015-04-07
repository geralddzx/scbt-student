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

Number.prototype.toClock = function(){
	return ("0" + String(this)).slice(String(this).length - 1, String(this).length + 1)
}

var dayTimes = []
for (var i = 8; i < 21; i++){
	var time = {}
	time[i] = 0
	dayTimes.push(time)
	var time = {}
	time[i] = 30
	dayTimes.push(time)
}

Array.prototype.each = function(func){
	for(var i = 0; i<this.length; i++){
		func(this[i])
	}
}

