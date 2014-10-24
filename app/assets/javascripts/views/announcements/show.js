Scbt.Views.AnnouncementShow = Backbone.View.extend({
	events: {
		"click .remove-announcement": "announcementDestroy"
	},
	
	initialize: function(){
  	this.listenTo(this.model, "sync", this.render)
 		this.model.fetch()
 	},
	
  template: JST["announcements/show"],
  
  render: function(){
    renderedContent = this.template({announcement: this.model})
    this.$el.html(renderedContent)
    return this
	},

	announcementDestroy: function(){
		view = this
		this.model.destroy({
      success: function(req, res){
        alert("This announcement has been deleted")
        Backbone.history.navigate("/announcements/index", {trigger: true})
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
        // view.collection.fetch()
      }
    })
	}
})