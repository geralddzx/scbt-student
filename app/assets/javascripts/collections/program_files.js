Scbt.Collections.ProgramFiles = Backbone.Collection.extend({
	model: Scbt.Models.ProgramFile,
	url: function(){
		return "api/programs/" + this.program.get("id") + "/program_files"
	},

	initialize: function(models, options){
    if (options && options.program){
      this.program = options.program
    }
  },

  parse: function(res){
  	this.change_permission = res["change_permission"]
  	return res["program_files"]
  }
})