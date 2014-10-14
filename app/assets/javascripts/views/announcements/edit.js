Scbt.Views.AnnouncementEdit = Backbone.View.extend({
  events: {
    "submit form": "submit"
  },
  initialize: function(){
    this.listenTo(this.model, "sync", this.render)
    this.model.fetch()
  }, 
  template: JST["announcements/edit"],
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
        alert("This announcement has been updated")
        Backbone.history.navigate("/announcements/" + view.model.get("id"), {trigger: true})
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
      }     
   }) 
  }  
})