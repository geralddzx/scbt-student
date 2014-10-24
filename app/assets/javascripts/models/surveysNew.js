Scbt.Models.SurveysNew = Backbone.Model.extend({
	url: "api/surveys/new",
	parse: function(res){
  	if (res["programs"]){
    	this.programs = new Scbt.Collections.Programs(res["programs"])
  	}

  	if (res["campuses"]){
    	this.campuses = new Scbt.Collections.Campuses(res["campuses"])
    }

    if (res["instructors"]){
    	this.instructors = new Scbt.Collections.Users(res["instructors"])
	  }
	
    delete res["programs"]
    delete res["campuses"]
    delete res["instructors"]
    return res
  }
})