Scbt.Models.Campus = Backbone.Model.extend({
  urlRoot: "api/campuses",
	parse: function(res){
		if (res["manager"]){
		  this.manager = new Scbt.Models.User(res["manager"], {parse: true})
		}
		if (res['admins']){
			this.admins = new Scbt.Collections.Users(res["admins"], {parse: true})
		}
		delete res["manager"]
		return res
	}
})