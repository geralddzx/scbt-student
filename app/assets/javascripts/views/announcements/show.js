Scbt.Views.AnnouncementShow = Backbone.View.extend({
	initialize: function(){
  	this.listenTo(this.model, "sync", this.render)
 		this.model.fetch()
 	},
	
  template: JST["announcements/show"],
  
  render: function(){
    renderedContent = this.template({announcement: this.model})
    this.$el.html(renderedContent)
    return this
	}
})