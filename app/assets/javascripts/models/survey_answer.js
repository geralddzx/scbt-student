Scbt.Models.SurveyAnswer = Backbone.Model.extend({
  urlRoot: "api/survey_answers",

  parse: function(res){
  	this.question = new Scbt.Models.SurveyQuestion(res.survey_answer.question)
  	return res.survey_answer.answer
  },

  inputType: function(){
  	var typeHash = {COMMENT: "text", RATING: "number"}
  	return typeHash[this.question.get("answer_type")]
  },

  minRating: function(){
  	return this.question.get("min_rating")
  },

  maxRating: function(){
  	return this.question.get("max_rating")
  },

  answer: function(){
  	return (this.escape("comment") || this.escape("rating"))
  },

  description: function(){
  	var minRating = this.question.escape("min_rating")
  	var maxRating = this.question.escape("max_rating")
  	if (minRating && maxRating){
  		return "Enter a number between " + minRating + " and " + maxRating
  	} else {
  		return "Enter an answer"
  	}
  }
})