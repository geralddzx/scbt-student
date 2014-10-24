Scbt.Views.Survey = Backbone.CompositeView.extend({
  initialize: function(){
    this.listenTo(this.model, "sync", this.render)
    this.model.fetch()
    
    this.addSubview("#show", new Scbt.Views.SurveyShow({
      model: this.model
    }))
  },
  
  template: JST["surveys/_"],
  
  render: function(){
    renderedContent = this.template({
      survey: this.model
    })
    this.$el.html(renderedContent)
    this.attachSubviews()
    return this
  }
})