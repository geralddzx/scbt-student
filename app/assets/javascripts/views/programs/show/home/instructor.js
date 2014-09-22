Scbt.Views.ProgramShowInstructor = Backbone.View.extend({
  initialize: function(){
    this.render()
  },
  
  template: JST["programs/show/home/instructor"],
  
  render: function(){
    renderedContent = this.template({
      program: this.model,
    })
    this.$el.html(renderedContent)
    return this
  },
})