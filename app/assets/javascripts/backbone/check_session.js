Backbone.Model.prototype.parse = function(res){
	Scbt.check_session(res)
	return res
}

Backbone.Collection.prototype.parse = function(res){
	Scbt.check_session(res)
	return res
}

Scbt.check_session = function(res){
	if(res["require_auth"]){
		alert("You have logged out of the session")
		window.location = "session/new"
		throw new Error('')
	}
}

