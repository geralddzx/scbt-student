Scbt.Views.CampusEdit = Backbone.View.extend({
  events: {
    "submit form": "submit"
  },
  initialize: function(){
    this.listenTo(this.model, "sync", this.render)
    this.model.fetch({data: {admins: true}})
  }, 
  template: JST["campuses/edit"],
  render: function(){              
    renderedContent = this.template({campus: this.model})
    this.$el.html(renderedContent)
    return this
  },
  submit: function(event){
    event.preventDefault()
    var view = this
    params = $(event.currentTarget).serializeJSON()
    console.log(event.currentTarget)
    this.model.save(params["campus"],{
      success: function(req, res){
        alert("This Campus has been updated")
        Backbone.history.navigate("/campuses/" + view.model.get("id"), {trigger: true})
        view.render()
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
      }     
   }) 
  }  
})