Scbt.Collections.Sections = Backbone.Collection.extend({
  initialize: function(models, options){
    if(options && options.program){
       this.program = options.program
    }
  },

  comparator: function(model){
  	return model.get("code")
  },

  model: Scbt.Models.Section,

  subviewId: function(){
  	return "program_id-" + this.program.get("id")
  }
})