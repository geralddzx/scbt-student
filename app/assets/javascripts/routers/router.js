Scbt.Routers.Router = Backbone.Router.extend({
  routes: {
    "": "coursesIndex",
    "my/profile/show": "userShow",
    "my/profile/edit": "userEdit",
    // "my/courses": "userCourses",
    "my/courses/index": "userCoursesIndex",
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
  userCoursesIndex: function(){
    var view = new Scbt.Views.CoursesIndex({
      collection: new Scbt.Collections.Courses([], {url: "api/user/courses"})
    })
    this.swapView(view)
  },  
  coursesNew: function(){
    var view = new Scbt.Views.CoursesNew({
      model: new Scbt.Models.Course()
      // collection: Scbt.Collections.courses
    })
    this.swapView(view)
  },
  courseEdit: function(id){
    var course = new Scbt.Models.Course({id: id})
    var view = new Scbt.Views.CourseEdit({model: course})
    this.swapView(view)
  },
  courseShow: function(id){
    var course = new Scbt.Models.Course({id: id})
    var view = new Scbt.Views.CourseShow({model: course})
    this.swapView(view)
  },
  swapView: function(newView){
    if (this._currentView){
      this._currentView.remove()
    }
    this._currentView = newView
    $('#content').html(newView.$el)
  }
})