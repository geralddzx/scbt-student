Scbt.Models.Campus = Backbone.Model.extend({
  urlRoot: "api/campuses",
	parse: function(res){
		if (res["manager"]){
		  this.manager = new Scbt.Models.User(res["manager"], {parse: true})
		}
		if (res['admins']){
			this.admins = new Scbt.Collections.Users(res["admins"], {parse: true})
		}
		this.takenSurvey = res["taken_survey"]
		delete res["manager"]
		delete res["taken_survey"]
		return res
	},
	surveyInstruction: function(){
		if (this.takenSurvey){
			return "Retake Campus Survey"
		} else {
			return "Take Campus Survey"
		}
	},
	address: function(){
		return this.get("street") + "," + this.get('city') + "," + this.get('postal_code')
	}
})