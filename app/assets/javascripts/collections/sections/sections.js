Scbt.Collections.Sections = Backbone.Collection.extend({
  initialize: function(models, options){
    if(options){
      this.program = options.program
      this.user = options.user
    }
  },

  comparator: function(model){
  	return model.get("code")
  },

  model: Scbt.Models.Section,

  subviewId: function(){
  	return "program_id-" + this.program.get("id")
  },

  url: function(){
    if(this.program){
      return "api/programs/" + this.program.get("id") + "/sections"
    } else if (this.user){
      return "api/user/sections"
    } else {
      return "api/sections"
    }
  }  
})