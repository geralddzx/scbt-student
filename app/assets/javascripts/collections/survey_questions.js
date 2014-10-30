Scbt.Collections.SurveyQuestions = Backbone.Collection.extend({
	initialize: function(models, options){
    this.survey = options.survey
  },

  model: Scbt.Models.SurveyQuestion,

  url: function(){
    if (this.survey){
      return this.survey.url() + "/questions"
    } else {
      return "api/survey_questions"
    }
  }
})