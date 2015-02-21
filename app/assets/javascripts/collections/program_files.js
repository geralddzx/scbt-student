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
    this.maxFileSize = res["maxFileSize"]
    this.maxFileDes = res["maxFileDes"]

    delete res["change_permission"]
    delete res["maxFileSize"]
    delete res["maxFileDes"]

  	return res["program_files"]
  }
})