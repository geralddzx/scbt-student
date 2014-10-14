Scbt.Collections.Announcements = Backbone.Collection.extend({
  model: Scbt.Models.Announcement,

  initialize: function(){
  	this.page = 1
  },

  url: function(){
  	return "api/announcements/page/" + this.page
  },

  parse: function(res){
  	this.total_pages = res.total_pages
  	return res.announcements
  }
})

// Scbt.Collections.announcements = new Scbt.Collections.Announcements