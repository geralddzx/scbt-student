Scbt.Views.CourseShow = Backbone.View.extend({
  events: {
    "click .enroll-course": "enroll"
  },
  initialize: function(){
    this.listenTo(this.model, "sync", this.render)
  },
  template: JST["courses/show"],
  render: function(){
    renderedContent = this.template({course: this.model})
    this.$el.html(renderedContent)
    return this
  },
  enroll: function(event){
    view = this
    event.preventDefault()
    view.model.enrollment.save(
      {course_id: view.model.id}, {
        success: function(req, res){
        alert("You have applied for this course. our staff will contact you within 24 hours")
        view.render()
        },
        error: function(req, res){
          alert(res.responseJSON || res.responseText)
        }
      }
    )
  }
})