Scbt.Views.ProgramShow = Backbone.CompositeView.extend({
  initialize: function(options){
    // this.content = options.content
    this.listenTo(this.model, "sync", this.render)
    this.model.fetch()
  },
  
  template: JST["programs/show/_"],
  
  render: function(){
    renderedContent = this.template({
      program: this.model,
    })
    this.$el.html(renderedContent)
    this.attachSubviews()
    return this
  },

  swapContent: function(newContentView){
    var contentView = this.subviews("#content")[0]
    if (contentView){
      this.removeSubview("#content", contentView)
    }
    this.$("#content").empty()
    this.addSubview("#content", newContentView)
  }
})

  