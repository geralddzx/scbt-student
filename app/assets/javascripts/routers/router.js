Scbt.Routers.Router = Backbone.Router.extend({
  routes: {
    "": "Home",
    "profile": "userShow",
    "profile/edit": "userEdit",
    // "my/programs": "userPrograms",
    
    "my/programs/index": "userProgramsIndex",
    "programs/new": "programsNew",
    "programs/:id/edit": "programEdit",
    "programs/:id/files": "programShowFiles",
    "programs/:id": "programShow",
    
    "campuses/index": "campusesIndex",
    "campuses/new": "campusesNew",
    "campuses/:id/edit": "campusEdit",
    "campuses/:id": "campusShow",

    "surveys/index": "surveysIndex",
    // "surveys/new": "surveysNew",
    // "surveys/:id/edit": "surveyEdit",
    "surveys/:id": "survey",

    "announcements/new": "announcementsNew",
    "announcements/index": "announcementsIndex",
    "announcements/:id/edit": "announcementEdit",
    "announcements/:id": "announcementShow"
  },

  Home: function(){
    var view = new Scbt.Views.Home()
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
      collection: new Scbt.Collections.Programs([], {user: true})
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

    var homeView = new Scbt.Views.ProgramShowHome({model: program})
    view.swapContent(homeView)
  },

  programShowFiles: function(id){
    if (!this._currentView || !this._currentView.swapContent){
      this.programShow(id)
    }
    var view = new Scbt.Views.ProgramShowFiles({
        collection: new Scbt.Collections.ProgramFiles([],{
        program: this._currentView.model 
      })
    })
    this._currentView.swapContent(view)
  },

  campusesIndex: function(){
    var view = new Scbt.Views.CampusesIndex({
      collection: Scbt.Collections.campuses
    })
    this.swapView(view)
  },
  campusesNew: function(){
    var view = new Scbt.Views.CampusesNew({
      model: new Scbt.Models.Campus
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

  surveysIndex: function(){
    var view = new Scbt.Views.SurveysIndex({
      collection: Scbt.Collections.surveys
    })
    this.swapView(view)
  },

  survey: function(id){
    var survey = new Scbt.Models.Survey({id: id})
    var view = new Scbt.Views.Survey({model: survey})
    this.swapView(view)
  },

  // surveyEdit: function(id){
  //   var survey = new Scbt.Models.survey({id: id})
  //   var view = new Scbt.Views.surveyEdit({model: survey})
  //   this.swapView(view)
  // },
 

  announcementsIndex: function(){
    var view = new Scbt.Views.AnnouncementsIndex()
    this.swapView(view)
  },
  announcementsNew: function(){
    var view = new Scbt.Views.AnnouncementsNew({
      model: new Scbt.Models.Announcement
    })
    this.swapView(view)
  },
  announcementEdit: function(id){
    var announcement = new Scbt.Models.Announcement({id: id})
    var view = new Scbt.Views.AnnouncementEdit({model: announcement})
    this.swapView(view)
  },
  announcementShow: function(id){
    var announcement = new Scbt.Models.Announcement({id: id})
    var view = new Scbt.Views.AnnouncementShow({model: announcement})
    this.swapView(view)
  },

  swapView: function(newView){
    if (this._currentView){
      this._currentView.remove()
    }
    this._currentView = newView
    $('#view').html(newView.$el)
  }
})