Scbt.Views.ProgramSections = Backbone.CompositeView.extend({
  events: {
    "click .new-section": "newSection",
    "click .cancel-new-section": "cancelNew",
    "click .remove-section": "sectionDestroy",
  },

  initialize: function(){
    this.render()
    this.listenTo(this.collection, "sync add remove", this.render)
  },

  template: JST["sections/program_index"],

  render: function(){
    renderedContent = this.template({sections: this.collection})
    this.$el.html(renderedContent)
    return this
  },

  newSection: function(event){
  	$(event.target).hide()
  	var newModel = new Scbt.Models.SectionNew({},{
        program: this.collection.program
    })
  	var newView = new Scbt.Views.SectionsNew({
      model: newModel
    })
    this.swapSubview("#new-section-view", newView)
  },

  cancelNew: function(){
  	this.removeSubviews("#new-section-view")
  	this.$(".new-section").show()
  },

  newSubview: function(){
  	return this.subviews("#new-section-view")[0]
  },

  sectionDestroy: function(event){
    event.preventDefault()
    var view = this
    var id = $(event.target).attr("id")
    var section = this.collection.get(id)
    section.destroyWithError(function(){
	    alert("This section has been deleted")
	  })
	},
})