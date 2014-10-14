Scbt.Views.AnnouncementsNew = Backbone.View.extend({
  events: {
    "submit form": "submit"
  },
  initialize: function(){
    this.render()
  },

  template: JST["announcements/new"],

  render: function(){
    renderedContent = this.template({announcement: this.model})
    this.$el.html(renderedContent)
    return this
  },
  submit: function(event){
    event.preventDefault()
    var view = this
    params = $(event.currentTarget).serializeJSON()
    this.model.save(params["announcement"],{
      success: function(req, res){
        alert("This announcement has been created")
        Backbone.history.navigate("/announcements/" + view.model.get("id"), {trigger: true})
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
      }     
   }) 
  }  
})