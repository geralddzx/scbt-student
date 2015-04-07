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

  resetWeekdays: function(){
    var section = this
    Object.keys(weekdays).forEach(function(day){
      section.set(day, false)
    })
  },

  setTimes: function(startTime, endTime){
    this.set("start_hour", startTime.slice(0, 2))
    this.set("start_minute", startTime.slice(3))
    this.set("end_hour", endTime.slice(0, 2))
    this.set("end_minute", endTime.slice(3))
  },

  time: function(){
    if (this.get("start_hour") === parseInt(this.get("start_hour"))){
      var startTime = this.get("start_hour").toClock() + ":" + this.get("start_minute").toClock()
      var endTime = this.get("end_hour").toClock() + ":" + this.get("end_minute").toClock()
      return startTime + "-" + endTime
    }
  },

  isStartTime: function(timeObj){
    return this.get("start_hour") == String(timeObj.hour) && this.get("start_minute") == String(timeObj.min)
  },

  isEndTime: function(timeObj){
    return this.get("end_hour") == String(timeObj.hour) && this.get("end_minute") == String(timeObj.min)
  },

  parse: function(res){
    this.campus = new Scbt.Models.Campus(res.campus)
    this.instructor = new Scbt.Models.User(res.instructor)
    if (res.enrollment){
      this.enrollment = new Scbt.Models.Enrollment(res.enrollment)
    }

    delete res["campus"]
    delete res["instructor"]
    delete res["enrollment"]
    return res
  }
})