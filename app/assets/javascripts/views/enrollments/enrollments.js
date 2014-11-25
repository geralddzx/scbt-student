Scbt.Views.Enrollments = Backbone.CompositeView.extend({
  events: {
    "click .approve-enrollment": "approveEnrollment",
    "click .reject-enrollment": "rejectEnrollment"
  },

  initialize: function(){
    this.render()
    this.addSearchView()
  },
  
  template: JST["enrollments/enrollments"],
  
  render: function(){
    renderedContent = this.template()
    this.$el.html(renderedContent)
    return this
  },

  addSearchView: function(){
    var view = new Scbt.Views.EnrollmentSearch
    this.addSubview("#search", view)
    this.searchView = view
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
    var id = $(event.target).attr("id")
    var model = this.searchView.model.enrollments.get(id)
    model.save({}, {
      url: model.url() + "/approve",
      success: function(){
        alert("This enrollment has been approved")
        console.log(model)
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
      }
    })    
  }
})