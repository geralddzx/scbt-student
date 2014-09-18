Scbt.Views.CampusesIndex = Backbone.View.extend({
	events: {
	  "click button.remove-campus": "campusDestroy",
	},
  	initialize: function(){
    	this.listenTo(this.collection, "sync", this.render)
   		this.collection.fetch()
 	},
	template: JST["campuses/index"],
    render: function(){
	    renderedContent = this.template({campuses: this.collection})
	    this.$el.html(renderedContent)
	    return this
  	},

	campusDestroy: function(event){
    event.preventDefault()
    view = this
    
    var id = $(event.target).attr("id")
    var campus = this.collection.get(id)
    campus.destroy({
      success: function(req, res){
        alert("This campus has been deleted")
        view.render()
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
        // view.collection.fetch()
      }
    })
  }  
})