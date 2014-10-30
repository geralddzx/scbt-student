Scbt.Views.SurveyQuestionsNew = Backbone.View.extend({
  events: {
    "click #open-new-form": "openView",
    "click #select-comment": "disableRange",
    "click #select-rating": "enableRange",
    "click #cancel-new": "closeView",
    "submit form": "submit"
  },

  initialize: function(){
    // this.closeView()
    this.listenTo(this.collection, "sync", this.closeView)
  },
  
  closeTemplate: JST["survey_questions/new_close"],
  openTemplate: JST["survey_questions/new_open"],
  
  render: function(template){
    var renderedContent = template()
    this.$el.html(renderedContent)
    return this
  },

  closeView: function(){
    this.render(this.closeTemplate)
  },

  openView: function(){
    this.render(this.openTemplate)
  },

  disableRange: function(){
    this.$('input[type=number]').attr('type', 'hidden')
  },

  enableRange: function(){
    this.$('input[type=hidden]').attr('type', 'number')
  },

  submit: function(event){
    event.preventDefault()
    var view = this
    var question = new this.collection.model
    params = $(event.currentTarget).serializeJSON()
    question.set("survey_id", this.collection.survey.get("id"))

    question.saveWithError(params["question"], function(){
      alert("This question has been created")
      view.collection.add(question)
      view.closeView()
    })
  }
})