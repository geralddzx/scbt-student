Scbt.Views.SurveyShow = Backbone.View.extend({
  events: {
    "click #edit-survey": "editMode",
    "click #cancel-edit": "showMode",
    "submit form": "submit"
  },

  initialize: function(){
    this.listenTo(this.model, "sync", this.showMode)
  },
  
  showTemplate: JST["surveys/show"],
  editTemplate: JST["surveys/edit"],
  
  render: function(template){
    renderedContent = template({survey: this.model})
    this.$el.html(renderedContent)
    return this
  },

  showMode: function(){
    this.render(this.showTemplate)
  },

  editMode: function(){
    this.render(this.editTemplate)
  },

  submit: function(event){
    event.preventDefault()
    var view = this
    params = $(event.currentTarget).serializeJSON()

    this.model.saveWithError(params["survey"], function(){
      alert("This survey has been updated")
      view.showMode()
    })
  }
})