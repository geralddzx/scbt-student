Scbt.Models.SectionEdit = Backbone.Model.extend({
	// initialize: function(attributes, options){
 //    if (options){
 //      this.section = options.section
 //    }
 //  },

  url: function(){
    return "api/sections/" + this.get("section_id") + "/edit"
  },

  parse: function(res){
    Backbone.Model.prototype.parse(res)
    
    this.campuses = new Scbt.Collections.Campuses(res.campuses)
    this.instructors = new Scbt.Collections.Users(res.instructors)
    this.programs = new Scbt.Collections.Programs(res.programs)
    
    this.section = new Scbt.Models.Section(res.section)
  }
})