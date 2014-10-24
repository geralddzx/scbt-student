Scbt.Views.SurveysNew = Backbone.View.extend({
  events: {
    "submit form": "submit",

    "click #select-all-programs": "allPrograms",
    "click #select-all-campuses": "allCampuses",
    "click #select-all-instructors": "allInstructors",

    "click #deselect-all-programs": "noPrograms",
    "click #deselect-all-campuses": "noCampuses",
    "click #deselect-all-instructors": "noInstructors"
  },

  initialize: function(){
    this.newModel = new Scbt.Models.SurveysNew
    this.model = new Scbt.Models.Survey
    this.listenTo(this.newModel, "sync", this.render)
    this.newModel.fetch()
  },

  template: JST["surveys/new"],

  render: function(){              
    renderedContent = this.template({survey: this.newModel})
    this.$el.html(renderedContent)
    return this
  },

  allPrograms: function(event){
    $("#programs input").prop("checked", true)
  },

  allCampuses: function(event){
    $("#campuses input").prop("checked", true)
  },

  allInstructors: function(event){
    $("#instructors input").prop("checked", true)
  },

  noPrograms: function(event){
    $("#programs input").prop("checked", false)
  },

  noCampuses: function(event){
    $("#campuses input").prop("checked", false)
  },

  noInstructors: function(event){
    $("#instructors input").prop("checked", false)
  },

  submit: function(event){
    event.preventDefault()
    var view = this

    params = $(event.currentTarget).serializeJSON()
    this.model.saveWithError(params["survey"], function(req, res){
        alert("This Campus has been created")
        Backbone.history.navigate("/surveys/" + view.model.get("id"), {trigger: true})
      }
    ) 
  }  
})