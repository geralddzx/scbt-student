Scbt.Models.Enrollment = Backbone.Model.extend({
  initialize: function(attributes, options){
    if (options && options.section){
      this.section = options.section
    }
  },

  parse: function(res){  	
    res.approver && (this.approver = new Scbt.Models.User(res.approver))
    this.section = new Scbt.Models.Section(res.section)
    delete res["approver"]
    delete res["section"]
    return res
  },
  
  urlRoot: "api/enrollments",

  enrollUrl: function(){
    return this.section.url() + "/enroll"
  },

  pending: function(){
    return this.get("status") == "PENDING"
  }, 

  approved: function(){
    return this.get("status") == "APPROVED"
  }, 
})