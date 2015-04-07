Scbt.Views.UserSectionsIndex = Backbone.View.extend({
  initialize: function(){
    this.collection = new Scbt.Collections.Sections([], {user: Scbt.Models.user})
    this.listenTo(this.collection, "sync add remove", this.render)
    this.collection.fetch()
    
  },

  template: JST["sections/user_index"],

  render: function(){
    renderedContent = this.template({sections: this.collection})
    this.$el.html(renderedContent)
    return this
  }
})