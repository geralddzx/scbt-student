Scbt.Views.EnrollmentsIndex = Backbone.View.extend({
	events: {
    // 'click .remove-question': 'removeQuestion'
    // 'submit form': 'submitForm'
  },

  initialize: function(){
    this.render()
  },

  template: JST["enrollments/index"],
  
  render: function(){
    renderedContent = this.template({enrollments: this.collection, models: this.model})
    this.$el.html(renderedContent)
    return this
  },

  // removeQuestion: function(event){
  //   var view = this
  //   id = $(event.currentTarget).attr("id")
  //   var question = this.collection.get(id)
  //   question.set("survey_id", null)
  //   question.saveWithError({}, function(){
  //     alert("This question has been removed from this survey")
  //   })
  //   this.collection.remove(question)
  // }
})