Scbt.Views.Home = Backbone.CompositeView.extend({
  initialize: function(){
  	this.render()
    this.addSubview("#announcements", new Scbt.Views.AnnouncementsIndex({
      collection: Scbt.Collections.announcements
    }))
    this.addSubview("#programs", new Scbt.Views.ProgramsIndex({
      collection: Scbt.Collections.programs
    }))
  },

  template: JST["home"],

  render: function(){
    renderedContent = this.template()
    this.$el.html(renderedContent)
    return this
  }
})