Scbt.Models.Enrollment = Backbone.Model.extend({
  parse: function(res){
  	Scbt.check_session(res)
    if (res.approver){
      this.approver = new Scbt.Models.User(res.approver)
    }
    delete res["approver"]
    return res
  },
  
  urlRoot: "api/enrollments"
})