Scbt.Views.ProgramShow = Backbone.View.extend({
  events: {
    "click .enroll-program": "enroll",
    "click .approve-enrollment": "approve"
  },
  
  initialize: function(){
    this.listenTo(this.model, "sync", this.render)
    this.model.fetch()
  },
  
  template: JST["programs/show"],
  
  render: function(){
    renderedContent = this.template({
      program: this.model,
    })
    this.$el.html(renderedContent)
    return this
  },
  
  enroll: function(event){
    view = this
    event.preventDefault()
    view.model.enrollment = new Scbt.Models.Enrollment
    view.model.enrollment.save({ program_id: view.model.id }, {
      success: function(req, res){
        alert("You have applied for this program. our staff will contact you within 24 hours")
        view.render()
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
      }
    })
  },
  
  approve: function(event){
    view = this
    event.preventDefault()
    var id = $(event.target).attr("id")
    this.model.enrollments.get(id).save({status: "APPROVED"}, {
      success: function(){
        alert("This enrollment has been approved")
        view.render()
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
      }
    })    
  }
})