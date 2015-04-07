Scbt.Views.ProgramEdit = Backbone.View.extend({
  events: {
    "submit form": "submit"
  },
  initialize: function(){
    this.listenTo(this.model, "sync", this.render)
    this.model.fetch({data: {instructors: true}})
  }, 
  template: JST["programs/edit"],                             
  render: function(){              
    renderedContent = this.template({program: this.model})
    this.$el.html(renderedContent)
    return this
  },
  submit: function(event){
    event.preventDefault()
    var view = this
    params = $(event.currentTarget).serializeJSON()

    this.model.save(params["program"],{
      success: function(req, res){
        alert("This program has been updated")
        Backbone.history.navigate("/programs/" + view.model.get("id"), {trigger: true})
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
      }     
   }) 
  }  
})