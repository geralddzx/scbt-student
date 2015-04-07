Scbt.Views.ProgramShow = Backbone.CompositeView.extend({
  events: {
    "submit form.new-section-form": "submit"
  },
  initialize: function(options){
    this.listenTo(this.model, "sync", this.render)
    this.addSectionsView()
    this.render()
  },
  
  template: JST["programs/show/show"],
  
  render: function(){
    renderedContent = this.template({
      program: this.model,
    })
    this.$el.html(renderedContent)
    this.attachSubviews()
    // this.addUserView()
    return this
  },

  addSectionsView: function(){
    var collection = new Scbt.Collections.Sections([], {program: this.model})
    var view = new Scbt.Views.ProgramSections({collection: collection})
    collection.fetch()
    this.addSubview("#sections", view)
  },

  submit: function(event){
    event.preventDefault()
    var view = this
    var params = $(event.currentTarget).serializeJSON()
    var message = "You are not adding a section to the current program. Are you sure you want to do this?"
    if (params.section.program_id != this.model.get("id") && !confirm(message)){
      return false
    }

    var model = new Scbt.Models.Section
    model.saveWithError(params["section"], function(req, res){
      alert("This Section has been created")
      Backbone.history.loadUrl("programs/" + model.get("program_id"))
    }) 
  }  

  // rejectEnrollment: function(event){
  //   view = this
  //   event.preventDefault()
  //   var id = $(event.target).attr("id")
  //   var enrollment = this.model.enrollments.get(id)
  //   enrollment.destroy({
  //     success: function(req, res){
  //       alert("You have rejected this enrollment")
  //       view.render()
  //     },
  //     error: function(req, res){
  //       alert(res.responseJSON || res.responseText)
  //     }
  //   })
  // },
  
  // approveEnrollment: function(event){
  //   view = this
  //   event.preventDefault()
  //   var id = $(event.target).attr("id")
  //   this.model.enrollments.get(id).save({status: "APPROVED"}, {
  //     success: function(){
  //       alert("This enrollment has been approved")
  //       view.render()
  //     },
  //     error: function(req, res){
  //       alert(res.responseJSON || res.responseText)
  //     }
  //   })    
  // }
})

  