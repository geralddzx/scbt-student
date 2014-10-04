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
    this.max_file_num = res["max_file_num"]
    this.max_file_word = res["max_file_word"]

    delete res["change_permission"]
    delete res["max_file_num"]
    delete res["max_file_word"]

  	return res["program_files"]
  }
})