Scbt.Routers.Router = Backbone.Router.extend({
  routes: {
    "": "coursesIndex",
    "profile/show": "userShow",
    "profile/edit": "userEdit",
    // "my/courses": "userCourses",
    "courses/new": "coursesNew",
    "courses/:id/edit": "courseEdit",
    "courses/:id": "courseShow"
  },
  coursesIndex: function(){
    var view = new Scbt.Views.CoursesIndex({
      collection: Scbt.Collections.courses
    })
    this.swapView(view)
  },
  userShow: function(){
    var view = new Scbt.Views.UserShow({model: Scbt.Models.user})
    this.swapView(view)
  },
  userEdit: function(){
    var view = new Scbt.Views.UserEdit({model: Scbt.Models.user})
    this.swapView(view)
  },
  coursesNew: function(){
    var view = new Scbt.Views.CoursesNew({
      collection: Scbt.Collections.courses
    })
    this.swapView(view)
  },
  courseEdit: function(id){
    var course = Scbt.Collections.courses.getOrFetch(id)
    var view = new Scbt.Views.CourseEdit({model: course})
    this.swapView(view)
  },
  courseShow: function(id){
    var course = Scbt.Collections.courses.getOrFetch(id)
    var view = new Scbt.Views.CourseShow({model: course})
    this.swapView(view)
  },
  swapView: function(newView){
    if (this._currentView){
      this._currentView.remove()
    }
    this._currentView = newView
    $('#container').html(newView.$el)
  }
})