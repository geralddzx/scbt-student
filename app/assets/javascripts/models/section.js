Scbt.Models.Section = Backbone.Model.extend({
  urlRoot: "api/sections",
  weekdays: function(){
  	var result = []
  	var section = this
  	Object.keys(weekdays).forEach(function(day){
  		if (section.get(day)){
  			result.push(weekdays[day])
  		}
  	})
  	return result.join(", ")
  },

  time: function(){
    if (!(this.get("start_hour") && this.get("end_hour") && this.get("start_minute") && this.get("end_minute"))){
      return null
    }
  	var startTime = this.get("start_hour").toClock() + ":" + this.get("start_minute").toClock()
 		var endTime = this.get("end_hour").toClock() + ":" + this.get("end_minute").toClock()
    return startTime + "-" + endTime
  },

  parse: function(res){
  	this.campus = new Scbt.Models.Campus(res.campus)
  	this.instructor = new Scbt.Models.User(res.instructor)
  	
    delete res["campus"]
  	delete res["instructor"]
    return res
  }
})