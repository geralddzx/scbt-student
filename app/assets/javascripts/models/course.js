Scbt.Models.Course = Backbone.Model.extend({
  urlRoot: "api/courses",
  parse: function(res){
    this.enrollment = new Scbt.Models.StudentEnrollment(res["current_user_enrollment"])
    delete res["current_user_enrollment"]
    return res
  }
})