Scbt.Views.Password = Backbone.View.extend({
  events: {
    "submit form": "submit"
  },

  initialize: function(){
    this.render()
  },

  model: Scbt.Models.Password,
  
  template: JST["user/password"],
  
  render: function(){
    renderedContent = this.template()
    this.$el.html(renderedContent)
    return this
  },

  submit: function(event){
    event.preventDefault()
    var view = this
    params = $(event.currentTarget).serializeJSON();

    (new this.model).saveWithError(params["user"], function(){
      alert("Your password has been changed")
      Backbone.history.navigate("profile", {trigger: true})
    }) 
  }
})