Scbt.Views.ProgramShowAdmin = Backbone.View.extend({
  events: {
    "click .approve-enrollment": "approveEnrollment",
    "click .reject-enrollment": "rejectEnrollment"
  },
  initialize: function(){
    this.render()
  },
  
  template: JST["programs/show/home/admin"],
  
  render: function(){
    renderedContent = this.template({
      program: this.model,
    })
    this.$el.html(renderedContent)
    return this
  },

  rejectEnrollment: function(event){
    view = this
    event.preventDefault()
    var id = $(event.target).attr("id")
    var enrollment = this.model.enrollments.get(id)
    enrollment.destroy({
      success: function(req, res){
        alert("You have rejected this enrollment")
        view.render()
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
      }
    })
  },
  
  approveEnrollment: function(event){
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