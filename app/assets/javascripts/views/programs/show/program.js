Scbt.Views.Program = Backbone.CompositeView.extend({
  initialize: function(options){
    // this.content = options.content
    this.listenTo(this.model, "sync", this.render)
    this.model.fetch()
  },

  programView: true,
  
  template: JST["programs/show/program"],
  
  render: function(){
    renderedContent = this.template({
      program: this.model,
    })
    this.$el.html(renderedContent)
    this.attachSubviews()
    return this
  },

  swapContent: function(newContentView){
    this.swapSubview("#content", newContentView)
  }
})

  
