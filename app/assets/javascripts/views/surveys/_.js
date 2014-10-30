Scbt.Views.Survey = Backbone.CompositeView.extend({
  initialize: function(){
    this.listenTo(this.model, "sync", this.render)
    this.model.fetch()
    
    this.addSubview("#show", new Scbt.Views.SurveyShow({
      model: this.model
    }))

    this.addQuestionViews()

    this.addProgramView()
    this.addCampusView()
    this.addInstructorView()
  },
  
  template: JST["surveys/_"],
  
  render: function(){
    renderedContent = this.template({
      survey: this.model
    })
    
    this.$el.html(renderedContent)
    this.attachSubviews()
    return this
  },

  addProgramView: function(){
    var programCollection = new Scbt.Models.SurveyHosts({}, {
      survey: this.model, hostType: "program", modelClass: "program"
    })
    this.addSubview("#program-hosts", new Scbt.Views.HostShow({model: programCollection}))
  },

  addCampusView: function(){
    var campusCollection = new Scbt.Models.SurveyHosts({}, {
      survey: this.model, hostType: "campus", modelClass: "campus"
    })
    this.addSubview("#campus-hosts", new Scbt.Views.HostShow({model: campusCollection}))
  },

  addInstructorView: function(){
    var instructorCollection = new Scbt.Models.SurveyHosts({}, {
      survey: this.model, hostType: "instructor", modelClass: "user"
    })
    this.addSubview("#instructor-hosts", new Scbt.Views.HostShow({model: instructorCollection}))
  },

  addQuestionViews: function(){
    var collection = new Scbt.Collections.SurveyQuestions([], {survey: this.model})
    if (Scbt.Models.user.admin()){
      this.addSubview("#questions-new", new Scbt.Views.SurveyQuestionsNew({collection: collection}))
    }
    this.addSubview("#questions-index", new Scbt.Views.SurveyQuestionsIndex({collection: collection}))
  }
})