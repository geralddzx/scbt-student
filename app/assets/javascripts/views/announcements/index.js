Scbt.Views.AnnouncementsIndex = Backbone.View.extend({
	events: {
	  "click .pagination li": "pageNav",
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
	}

	// campusDestroy: function(event){
 //    event.preventDefault()
 //    view = this
    
 //    var id = $(event.target).attr("id")
 //    var campus = this.collection.get(id)
 //    campus.destroy({
 //      success: function(req, res){
 //        alert("This campus has been deleted")
 //        view.render()
 //      },
 //      error: function(req, res){
 //        alert(res.responseJSON || res.responseText)
 //        // view.collection.fetch()
 //      }
 //    })
 //  }  
})