Scbt.Models.EnrollmentSearch = Backbone.Model.extend({
  parse: function(res){
  	this.students = new Scbt.Collections.Users(res.students)
  	this.programs = new Scbt.Collections.Programs(res.programs)
  	this.campuses = new Scbt.Collections.Campuses(res.campuses)
  	this.sections = new Scbt.Collections.Sections(res.sections)
  	this.admins = new Scbt.Collections.Users(res.admins)
  },
  
  url: "api/enrollments/search"
})