Scbt.Collections.Programs = Backbone.Collection.extend({
  initialize: function(models, options){
    if (options && options.user){
      this.user = options.user
    }
  },
  model: Scbt.Models.Program,
  url: function(){
  	if (!this.user){
  		return "api/programs"
  	} else {
  		return "api/user/programs"
  	}
  }
})

Scbt.Collections.programs = new Scbt.Collections.Programs;