Scbt.Routers.Router = Backbone.Router.extend({
  routes: {
    "": "coursesIndex",
    "courses/new": "coursesNew",
    "course/:id/edit": "courseEdit"
  },
  coursesIndex: function(){
    var view = new Scbt.Views.CoursesIndex({
      collection: Scbt.Collections.courses
    })
    this.swapView(view)
  },
  coursesNew: function(){
    var view = new Scbt.Views.CoursesNew({
      collection: Scbt.Collections.courses
    })
    this.swapView(view)
  },
  courseEdit: function(id){
    course = Scbt.Collections.courses.getOrFetch(id)
    var view = new Scbt.Views.CourseEdit({
      model: course
    })
    this.swapView(view)
  },
  swapView: function(newView){
    if (this._currentView){
      this._currentView.remove()
    }
    this._currentView = newView
    $('#container').html(newView.render().$el)
  }
})