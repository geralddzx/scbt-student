Scbt.Views.SurveyAnswersIndex = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.collection, "sync", this.render)
    this.collection.fetch()
  },
  
  template: JST["survey_answers/index"],

  render: function(){
    var renderedContent = this.template({answers: this.collection})
    this.$el.html(renderedContent)
    return this
  },

  // submit: function(event){
  //   event.preventDefault()
  //   var view = this
  //   var question = new this.collection.model
  //   params = $(event.currentTarget).serializeJSON()
  //   question.set("survey_id", this.collection.survey.get("id"))

  //   question.saveWithError(params["question"], function(){
  //     alert("This question has been created")
  //     view.collection.add(question)
  //     view.closeView()
  //   })
  // }
})