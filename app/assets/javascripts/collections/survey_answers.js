Scbt.Collections.SurveyAnswers = Backbone.Collection.extend({
  initialize: function(models, options){
    this.subjectClass = options.subjectClass
    this.subjectID = options.subjectID
  },

  model: Scbt.Models.SurveyAnswer,

  url: function(){
    return "api/" + this.subjectURL() + "/survey_answers"
  }, 

  subjectURL: function(){
  	return this.subjectClass +"/" + this.subjectID
  },

  parse: function(res){
  	this.survey = new Scbt.Models.Survey(res.survey)
  	this.subject = new Scbt.Models[capitalize(singularize[this.subjectClass])](res.subject)
  	return res.answers
  }
})