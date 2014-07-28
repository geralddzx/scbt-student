Scbt.Models.Course = Backbone.Model.extend({
  urlRoot: "api/courses",
  parse: function(res){
    this.enrollment = new Scbt.Models.StudentEnrollment(res["enrollment"])
    delete res["enrollment"]
    return res
  }
})