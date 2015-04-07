Scbt.Views.AnnouncementsIndex = Backbone.View.extend({
	events: {
	  "click .pagination li": "pageNav",
	  "click .remove-announcement": "announcementDestroy"
	},

	initialize: function(){
		this.collection = new Scbt.Collections.Announcements()
  	this.listenTo(this.collection, "sync", this.render)
 		this.collection.fetch()
 	},
	
  template: JST["announcements/index"],
  
  render: function(){
    renderedContent = this.template({announcements: this.collection})
    this.$el.html(renderedContent)
    return this
	},

	pageNav: function(event){
		if ($(event.currentTarget).attr("class") == "disabled"){
			return
		}
		var view = this
		var page = parseInt($(event.currentTarget).attr("page"))
		this.collection.page = page
		this.disablePageNav()
		this.collection.fetch()
	},

	announcementDestroy: function(event){
    view = this
    
    var id = $(event.currentTarget).attr("id")
    var announcement = this.collection.get(id)
    announcement.destroy({
      success: function(req, res){
        alert("This announcement has been deleted")
        view.collection.set(res.announcements)
        view.collection.total_pages = res.total_pages
        view.collection.page = res.page
        view.render()
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
        // view.collection.fetch()
      }
    })
  }  
})