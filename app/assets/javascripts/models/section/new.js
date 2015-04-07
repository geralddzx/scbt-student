Scbt.Models.SectionNew = Backbone.Model.extend({
	initialize: function(attributes, options){
    if (options){
      this.program = options.program
      this.campus = options.campus
      this.instructor = options.instructor
    }
  },

  url: "api/sections/new",

  parse: function(res){
    this.campuses = new Scbt.Collections.Campuses(res.campuses)
    this.instructors = new Scbt.Collections.Users(res.instructors)
    this.programs = new Scbt.Collections.Programs(res.programs)
  }
})