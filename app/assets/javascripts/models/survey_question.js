Scbt.Models.SurveyQuestion = Backbone.Model.extend({
  urlRoot: "api/survey_questions",
  typeComment: function(){
  	return this.question.get("answer_type") == "COMMENT"
  },

  typeRating: function(){
  	return this.question.get("answer_type") == "RATING"
  },
})