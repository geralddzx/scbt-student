Scbt.Views.ProgramShowStudent = Backbone.View.extend({
  events: {
    "click .enroll-program": "enroll",
    "click .cancel-enrollment": "cancel",
  },
  initialize: function(){
    this.render()
  },
  
  template: JST["programs/show/home/student"],
  
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

  cancel: function(event){
    view = this
    event.preventDefault()
    this.model.enrollment.destroy({
      success: function(req, res){
        alert("You have cancelled this enrollment request")
        delete view.model.enrollment
        view.render()
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
      }
    })
  }
})