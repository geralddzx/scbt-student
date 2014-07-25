Scbt.Views.CourseEdit = Backbone.View.extend({
  events: {
    "submit form": "submit"
  },
  initialize: function(){
    this.listenTo(this.model, "sync", this.render)
  }, 
  template: JST["courses/form"],
  templateParams: function(){
    return {
      title: "Edit",                 
      action: "Update",              
      course: this.model             
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
   
   this.model.save(params["course"],{
     success: function(req, res){
       alert("This course has been updated")
       Backbone.history.navigate("/", {trigger: true})
     },
     error: function(req, res){
       debugger
       alert(res.responseJSON || res.responseText)
     }     
   }) 
  }  
})