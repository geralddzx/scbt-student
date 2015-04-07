Scbt.Views.CampusesNew = Backbone.View.extend({
  events: {
    "submit form": "submit"
  },
  initialize: function(){
    if (Scbt.Models.user.master_admin()){
      this.model.admins = Scbt.Collections.admins
      this.listenTo(this.model.admins, "sync", this.render)
      this.model.admins.fetch()
    } else {
      this.render()
    }
  },

  template: JST["campuses/new"],

  render: function(){              
    renderedContent = this.template({campus: this.model})
    this.$el.html(renderedContent)
    return this
  },
  submit: function(event){
    event.preventDefault()
    var view = this
    params = $(event.currentTarget).serializeJSON()
    this.model.save(params["campus"],{
      success: function(req, res){
        alert("This Campus has been created")
        Backbone.history.navigate("/campuses/" + view.model.get("id"), {trigger: true})
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
      }     
   }) 
  }  
})