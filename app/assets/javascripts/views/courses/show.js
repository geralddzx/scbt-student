Scbt.Views.CourseShow = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.model, "sync", this.render)
  },
  template: JST["courses/show"],
  render: function(){
    renderedContent = this.template({course: this.model})
    this.$el.html(renderedContent)
    return this
  }
})