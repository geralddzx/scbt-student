Scbt.Views.CoursesIndex = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.collection, "sync", this.render)
    this.collection.fetch()
  },
  template: JST["courses/index"],
  render: function(){
    renderedContent = this.template({courses: this.collection})
    this.$el.html(renderedContent)
    return this
  }
})