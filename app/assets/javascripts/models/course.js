Scbt.Models.Program = Backbone.Model.extend({
  urlRoot: "api/programs",
  parse: function(res){
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

// parse: function(res){
//   // this.instructor = new Scbt.Models.User(res["instructor"])
//
//   if(res.instructor) {
//     this.instructor().set(res.instructor);
//   }
//   this.enrollment = new Scbt.Models.Enrollment(res["enrollment"])
//   this.enrollments = new Scbt.Collections.Enrollments(res["enrollments"])
//
//   delete res["current_user"]
//   delete res["instructor"]
//   delete res["enrollment"]
//   delete res["enrollments"]
//   return res
// },
//
//
//
// instructor: function() {
//   if(!this._instructor) {
//     this._instructor = new Scbt.Models.User()
//   }
//   return this._instructor;
// },
//
// enrollments: function() {
//   if(!this._enrollments) {
//     this._enrollments = new Scbt.Collections.Enrollments([], { program: this })
//   }
//   return this._enrollments;
// },
//
// enrollment: function() {
//
// }