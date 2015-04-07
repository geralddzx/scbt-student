Scbt.Views.CampusShow = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.model, "sync", this.render)
    this.model.fetch()
  },
  
  template: JST["campuses/show"],
  
  render: function(){
    renderedContent = this.template({
      campus: this.model,
    })
    this.$el.html(renderedContent)
    return this
  },
})