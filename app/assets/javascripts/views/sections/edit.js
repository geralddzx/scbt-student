Scbt.Views.SectionEdit = Backbone.View.extend({
  events: {
    "submit form": "submit"
  },

  initialize: function(){
    this.listenTo(this.model, "sync", this.render)
    this.model.fetch()
  }, 

  template: JST["sections/edit"], 

  render: function(){              
    renderedContent = this.template({sectionEdit: this.model, section: this.model.section})
    this.$el.html(renderedContent)
    return this
  },

  submit: function(event){
    event.preventDefault()
    var view = this
    params = $(event.currentTarget).serializeJSON()
    var section = this.model.section
    var id = section.get("id")
    var startTime = $("#start-time").val()
    var endTime = $("#end-time").val()
    section.resetWeekdays()
    section.setTimes(startTime, endTime)

    section.saveWithError(params["section"], function(req, res){
      alert("This section has been updated")
      Backbone.history.history.back()
    })
  }  
})