Backbone.Model.prototype.fetchWithError = function(successCallback){
	this.fetch({
		success: successCallback,
		error: function(req, res){
		  alert(res.responseJSON || res.responseText)
		}
	})
}

Backbone.Model.prototype.saveWithError = function(attributes, successCallback){
	this.save(attributes, {
		success: successCallback,
		error: function(req, res){
		  alert(res.responseJSON || res.responseText)
		}
	})
}

Backbone.Collection.prototype.fetchWithError = function(successCallback){
	this.fetch({
		success: successCallback,
		error: function(req, res){
		  alert(res.responseJSON || res.responseText)
		}
	})
}

Backbone.Model.prototype.destroyWithError = function(successCallback){
	this.destroy({
		success: successCallback,
		error: function(req, res){
		  alert(res.responseJSON || res.responseText)
		}
	})
}

// Backbone.Collection.prototype.saveWithError = function(attr, successCallback){
// 	this.save({
// 		success: successCallback,
// 		error: function(req, res){
// 		  alert(res.responseJSON || res.responseText)
// 		}
// 	})
// }