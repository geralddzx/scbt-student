Scbt.Models.Program = Backbone.Model.extend({
  urlRoot: "api/programs",
  parse: function(res){
    Scbt.check_session(res)
    if (res["enrollments"]){
      this.enrollments = new Scbt.Collections.Enrollments(res["enrollments"], {parse: true})
    }
    if (res["enrollment"]){
      this.enrollment = new Scbt.Models.Enrollment(res["enrollment"], {parse: true})
    }
    if (res["instructor"]){
      this.instructor = new Scbt.Models.User(res["instructor"])
    }
    if (res["instructors"]){
      this.instructors = new Scbt.Collections.Users(res["instructors"])
    }
    // if (res["instructors"]){
    //   this.instructors = new Scbt.Collections.Users(res["instructors"])
    // }
    delete res["enrollment"]
    delete res["instructor"]
    delete res["enrollments"]
    delete res["instructors"]
    
    return res
  }
})