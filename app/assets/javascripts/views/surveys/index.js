Scbt.Views.SurveysIndex = Backbone.View.extend({
	events: {
	  // "click button.remove-campus": "campusDestroy",
	  "click #create-survey": "surveyCreate",
	  "click .remove-survey": "surveyDestroy"
	},

	initialize: function(){
  	this.listenTo(this.collection, "sync add remove", this.render)
 		this.collection.fetch()
 	},

	template: JST["surveys/index"],
  
  render: function(){
    renderedContent = this.template({surveys: this.collection})
    this.$el.html(renderedContent)
    return this
	},

	surveyCreate: function(){
    var view = this
    var model = new Scbt.Models.Survey
    model.saveWithError({title: $('#title-field').val()}, function(){
    	alert("This survey has been created")
    	view.collection.add(model)
    }) 
  },

	surveyDestroy: function(event){
    event.preventDefault()
    view = this
    
    var id = $(event.target).attr("id")
    var survey = this.collection.get(id)
    survey.destroyWithError(function(){
      alert("This campus has been deleted")
  	})
  }  
})