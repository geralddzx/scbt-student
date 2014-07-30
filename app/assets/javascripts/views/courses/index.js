Scbt.Views.CoursesIndex = Backbone.View.extend({
  events: {
    "click button.remove-course": "courseDestroy",
    "click button.edit-course": "courseEdit"
  },
  initialize: function(){
    this.listenTo(this.collection, "sync remove", this.render)

  },
  template: JST["courses/index"],
  render: function(){
    renderedContent = this.template({courses: this.collection})
    this.$el.html(renderedContent)
    return this
  },
  courseDestroy: function(event){
    event.preventDefault()
    view = this
    
    var id = $(event.target).attr("id")
    var course = this.collection.getOrFetch(id)
    course.destroy({
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
        view.collection.fetch()
      }
    })
  }  
})