Scbt.Views.UserEdit = Backbone.View.extend({
  events: {
    "submit form": "submit"
  },
  
  initialize: function(){
    this.listenTo(this.model, "sync", this.render)
    this.model.fetch()
  },
  
  template: JST["user/edit"],
  
  render: function(){
    renderedContent = this.template({user: this.model})
    this.$el.html(renderedContent)
    return this
  },
  
  submit: function(event){
    event.preventDefault()
    params = $(event.currentTarget).serializeJSON()
    this.model.save(params["user"], {
      success: function(req, res){
        alert("Your profile has been updated!")
        Backbone.history.navigate("my/profile/show", {trigger: true})
      },
      error: function(req, res){
        alert(res.responseText || res.responseJSON)
      }
    })
  }
})