Scbt.Views.UserShow = Backbone.CompositeView.extend({
  initialize: function(){
    this.listenTo(this.model, "sync", this.render)
    this.model.fetch()
    this.addSubview("#profile-uploader", new Scbt.Views.UserShowPhoto())
  },
  
  template: JST["user/show"],
  
  render: function(){
    renderedContent = this.template({user: this.model})
    this.$el.html(renderedContent)
    this.attachSubviews()
    return this
  }
})