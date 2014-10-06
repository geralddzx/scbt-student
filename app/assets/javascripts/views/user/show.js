Scbt.Views.UserShow = Backbone.CompositeView.extend({
  initialize: function(){
    this.addSubview("#profile-uploader", new Scbt.Views.UserShowPhoto({model: this.model}))
    this.listenTo(this.model, "sync", this.render)
    this.model.fetch()
  },
  
  template: JST["user/show"],
  
  render: function(){
    renderedContent = this.template({user: this.model})
    this.$el.html(renderedContent)
    this.attachSubviews()
    return this
  }
})