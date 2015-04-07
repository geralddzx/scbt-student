Scbt.Views.ProgramFiles = Backbone.CompositeView.extend({
  initialize: function(){
    this.listenTo(this.collection, "sync", this.render)
    this.addSubview("#new", new Scbt.Views.ProgramFilesNew({collection: this.collection}))
    this.addSubview("#index", new Scbt.Views.ProgramFilesIndex({collection: this.collection}))
    this.collection.fetch()
  },

  template: JST["programs/show/files"],
  
  render: function(){
    renderedContent = this.template()
    this.$el.html(renderedContent)
    this.attachSubviews()
    return this
  }
})