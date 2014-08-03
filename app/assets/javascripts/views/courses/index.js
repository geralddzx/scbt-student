Scbt.Views.CoursesIndex = Backbone.View.extend({
  events: {
    "click button.remove-course": "courseDestroy",
    "click button.edit-course": "courseEdit"
  },
  initialize: function(){
    this.listenTo(this.collection, "sync", this.render)
    this.collection.fetch()
  },
  template: function(){
    if (this.collection.url.indexOf("user") === -1){
      return JST["courses/index"]
    } else {
      return JST["courses/user_index"]
    }      
  },
  render: function(){
    renderedContent = this.template()({courses: this.collection})
    this.$el.html(renderedContent)
    return this
  },
  courseDestroy: function(event){
    event.preventDefault()
    view = this
    
    var id = $(event.target).attr("id")
    var course = this.collection.get(id)
    course.destroy({
      success: function(req, res){
        alert("This course has been deleted")
        view.render()
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
        // view.collection.fetch()
      }
    })
  }  
})