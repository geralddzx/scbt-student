Scbt.Views.ProgramSections = Backbone.CompositeView.extend({
  events: {
    "click .new-section": "newSection",
    "click .cancel-new-section": "cancelNew",
    "click .remove-section": "sectionDestroy",
    "click .enroll-section": "enroll",
    "click .cancel-enrollment": "cancel",
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

  enroll: function(event){
    var view = this
    var id = $(event.currentTarget).attr("id")
    var section = this.collection.get(id)
    var enrollment = new Scbt.Models.Enrollment({}, {section: section})
    enrollment.save({}, {
      url: enrollment.enrollUrl(),
      success: function(req, res){
        alert("You have applied for this section. our staff will contact you within 24 hours")
        section.enrollment = enrollment
        view.render()
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
      }
    })
  },

  cancel: function(event){
    view = this
    var id = $(event.currentTarget).attr("id")
    var section = this.collection.get(id)
    section.enrollment.destroyWithError(function(req, res){
      alert("You have cancelled this enrollment request")
    })
    section.enrollment = null
    view.render()
  },
})