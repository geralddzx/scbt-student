Scbt.Routers.Router = Backbone.Router.extend({
  routes: {
    "": "programsIndex",
    "my/profile/show": "userShow",
    "my/profile/edit": "userEdit",
    // "my/programs": "userPrograms",
    "my/programs/index": "userProgramsIndex",
    "programs/new": "programsNew",
    "programs/:id/edit": "programEdit",
    "programs/:id": "programShow",
    "campuses/index": "campusesIndex",
    "campuses/:id/edit": "campusEdit",
    "campuses/:id": "campusShow"
  },
  programsIndex: function(){
    var view = new Scbt.Views.ProgramsIndex({
      collection: Scbt.Collections.programs
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
  userProgramsIndex: function(){
    var view = new Scbt.Views.ProgramsIndex({
      collection: new Scbt.Collections.Programs([], {url: "api/user/programs"})
    })
    this.swapView(view)
  },  
  programsNew: function(){
    var view = new Scbt.Views.ProgramsNew({
      model: new Scbt.Models.Program()
      // collection: Scbt.Collections.programs
    })
    this.swapView(view)
  },
  programEdit: function(id){
    var program = new Scbt.Models.Program({id: id})
    var view = new Scbt.Views.ProgramEdit({model: program})
    this.swapView(view)
  },
  programShow: function(id){
    var program = new Scbt.Models.Program({id: id})
    var view = new Scbt.Views.ProgramShow({model: program})
    this.swapView(view)
  },
  campusesIndex: function(){
    var view = new Scbt.Views.CampusesIndex({
      collection: Scbt.Collections.campuses
    })
    this.swapView(view)
  },
  campusEdit: function(id){
    var campus = new Scbt.Models.Campus({id: id})
    var view = new Scbt.Views.CampusEdit({model: campus})
    this.swapView(view)
  },
  campusShow: function(id){
    var campus = new Scbt.Models.Campus({id: id})
    var view = new Scbt.Views.CampusShow({model: campus})
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