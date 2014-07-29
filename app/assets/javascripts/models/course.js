Scbt.Models.Course = Backbone.Model.extend({
  urlRoot: "api/courses",
  parse: function(res){
    this.instructor = new Scbt.Models.User(res["instructor"])
    this.enrollment = new Scbt.Models.Enrollment(res["enrollment"])
    this.enrollments = new Scbt.Collections.Enrollments(res["enrollments"])

    delete res["current_user"]
    delete res["instructor"]
    delete res["enrollment"]
    delete res["enrollments"]
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
//     this._enrollments = new Scbt.Collections.Enrollments([], { course: this })
//   }
//   return this._enrollments;
// },
//
// enrollment: function() {
//
// }