Scbt.Views.ProgramShowFiles = Backbone.View.extend({
  initialize: function(){
    this.render()
  },
  
  template: JST["programs/show/files"],
  
  render: function(){
    renderedContent = this.template({
    })
    this.$el.html(renderedContent)
    return this
  },
})