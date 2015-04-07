Scbt.DayTimes = function(hour, min){
	this.hour = hour
	this.min = min
}

Scbt.DayTimes.initialize = function(){
	Scbt.DayTimes.collection = []
	for (var i = 8; i < 21; i++){
		Scbt.DayTimes.collection.push(new Scbt.DayTimes(i, 0))
		Scbt.DayTimes.collection.push(new Scbt.DayTimes(i, 30))
	}
}

Scbt.DayTimes.prototype.to_s = function(){
	return String(this.hour).toClock() + ":" + String(this.min).toClock()
}

Scbt.DayTimes.initialize()
// Scbt.DayTimes.collection.each(function(time){
// 	console.log(time.to_s())
// })
