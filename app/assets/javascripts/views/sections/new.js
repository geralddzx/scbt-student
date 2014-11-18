Scbt.Views.SectionsNew = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.model, "sync", this.render)
    this.model.fetch()
  },

  template: JST["sections/new"],

  render: function(){         
    renderedContent = this.template({section: this.model})
    this.$el.html(renderedContent)
    return this
  },
})