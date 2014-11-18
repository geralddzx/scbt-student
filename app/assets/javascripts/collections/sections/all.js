Scbt.Collections.SectionPrograms = Backbone.Collection.extend({
  initialize: function(models, options){
    if (options){
      this.program = options.program
    }
  },

  model: Scbt.Models.Section,

  url: function(){
    if (this.program){
      return this.program.url() + "/sections"
    } else {
      return "api/sections"
    }
  },

  parse: function(res){
  	var collection = this
  	this.programsSections = {}

  	res.forEach(function(program){
      var currentProgram = new Scbt.Models.Program(program.program) 
  		var programSections = new Scbt.Collections.Sections(program.sections, {program: currentProgram, parse: true})
      if (program.sections.length > 0){
        collection.programsSections[currentProgram.get("id")] = programSections
      }
  	})
  }
})