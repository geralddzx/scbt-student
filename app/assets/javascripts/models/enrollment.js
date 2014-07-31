Scbt.Models.Enrollment = Backbone.Model.extend({
  parse: function(attributes){
    if (attributes.approver){
      this.approver = new Scbt.Models.User(attributes.approver)
    }
    delete attributes["approver"]
    return attributes
  },
  urlRoot: "api/enrollments"
})