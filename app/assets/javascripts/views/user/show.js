Scbt.Views.UserShow = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.model, "sync", this.render)
    this.model.fetch()
  },
  
  template: JST["user/show"],
  
  render: function(){
    renderedContent = this.template({user: this.model})
    this.$el.html(renderedContent)
    return this
  }
  
})