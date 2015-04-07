Scbt.Views.SurveyAnswersIndex = Backbone.View.extend({
  events: {
    "submit form": "submit"
  },

  initialize: function(){
    this.listenTo(this.collection, "sync", this.render)
    this.collection.fetch()
  },  
  
  template: JST["survey_answers/index"],

  render: function(){
    this.attachNumbers()
    var renderedContent = this.template({answers: this.collection})
    this.$el.html(renderedContent)
    return this
  },

  attachNumbers: function(){
    for(var i = 0; i < this.collection.length; i++){
      var answer = this.collection.models[i]
      answer.set("number", i + 1)
    }
  },

  submit: function(event){
    event.preventDefault()
    var view = this
    this.parseAnswers(event)

    this.collection.sync("create", this.collection, {
      success: function(){
        alert("Your answers have been submitted")
        Backbone.history.navigate(view.collection.subjectURL(), {trigger: true})
      },
      error: function(res){
        alert(res.responseJSON || res.responseText)
        Backbone.history.loadUrl(view.collection.subjectURL() + "/survey")
      }
    })
  },

  parseAnswers: function(event){
    var params = $(event.currentTarget).serializeJSON()
    this.collection.each(function(answer){
      var currentAnswer = params.answers[answer.cid]
      answer.answer(currentAnswer)
    })
  }
})