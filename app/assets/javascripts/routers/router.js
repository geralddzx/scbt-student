Scbt.Routers.Router = Backbone.Router.extend({
  routes: {
    "": "coursesIndex",
    "courses/new": "coursesNew"
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
  swapView: function(newView){
    if (this._currentView){
      this._currentView.remove()
      $("#notices").html("")
    }
    this._currentView = newView
    $('#container').html(newView.render().$el)
  }
})