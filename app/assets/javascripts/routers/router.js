Scbt.Routers.Router = Backbone.Router.extend({
  routes: {
    "": "home",
    "profile": "userShow",
    "profile/edit": "userEdit",
    "profile/password": "passwordEdit",
    // "my/programs": "userPrograms",

    ":subject_class/:subject_id/survey": "surveyAnswersIndex", 
    
    "programs/index": "programsIndex",
    "programs/new": "programsNew",
    "programs/:id/edit": "programEdit",
    "programs/:id/files": "programShowFiles",
    "programs/:id": "programShowProgram",

    "sections/index": "allSections",
    "sections/:id/edit": "sectionEdit",
    "my/sections/index": "userSectionsIndex",
    
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
    "announcements/:id": "announcementShow",

    "enrollments/index": "enrollments",
  },

  home: function(){
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
  passwordEdit: function(){
    var view = new Scbt.Views.Password
    this.swapView(view)
  },

  programsIndex: function(){
    var view = new Scbt.Views.ProgramsIndex({
      collection: Scbt.Collections.programs
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
    if(!(this.currentView && this._currentView.programView && this.currentView.model.get("id") == parseInt(id))){
      var program = new Scbt.Models.Program({id: id})
      var view = new Scbt.Views.Program({model: program})
      this.swapView(view)  
      return view
    }
    return this._currentView
  },
  programShowProgram: function(id){
    var view = this.programShow(id)  
    var showView = new Scbt.Views.ProgramShow({model: view.model})
    view.swapContent(showView)
  },
  programShowFiles: function(id){
    var view = this.programShow(id) 
    var collection = new Scbt.Collections.ProgramFiles([],{program: view.model})

    var fileView = new Scbt.Views.ProgramFiles({collection: collection})
    view.swapContent(fileView)
  },

  sectionEdit: function(id){
    var model = new Scbt.Models.SectionEdit({section_id: id})
    var view = new Scbt.Views.SectionEdit({model: model})
    this.swapView(view)
  },
  allSections: function(){
    var view = new Scbt.Views.AllSections({
      collection: new Scbt.Collections.SectionPrograms
    })
    this.swapView(view)
  },
  userSectionsIndex: function(){
    var view = new Scbt.Views.UserSectionsIndex
    this.swapView(view)
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

  surveyAnswersIndex: function(subjectClass, subjectID){
    var collection = new Scbt.Collections.SurveyAnswers([],{
      subjectClass: subjectClass,
      subjectID: subjectID
    })
    var view = new Scbt.Views.SurveyAnswersIndex({collection: collection})
    this.swapView(view)
  },

  enrollments: function(){
    var view = new Scbt.Views.Enrollments
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