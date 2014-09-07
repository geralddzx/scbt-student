Scbt.Views.ProgramEdit = Backbone.View.extend({
  events: {
    "submit form": "submit"
  },
  initialize: function(){
    this.listenTo(this.model, "sync", this.render)
    this.model.fetch({data: {instructors: true}})
  }, 
  template: JST["programs/form"],
  templateParams: function(){
    return {
      title: "Edit",                 
      action: "Update",              
      program: this.model             
    }
  },                               
  render: function(){              
    renderedContent = this.template(this.templateParams())
    this.$el.html(renderedContent)
    return this
  },
  submit: function(event){
    event.preventDefault()
    params = $(event.currentTarget).serializeJSON()
    
    this.model.save(params["program"],{
      success: function(req, res){
        alert("This program has been updated")
        Backbone.history.navigate("/", {trigger: true})
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
      }     
   }) 
  }  
})