Scbt.Views.CoursesNew = Backbone.View.extend({
  initialize: function(){
    if (Scbt.Models.user.get("permission") == "MASTER_ADMIN"){
      this.model.instructors = Scbt.Collections.instructors
      this.listenTo(this.model.instructors, "sync", this.render)
      this.model.instructors.fetch({
        error: function(req, res){
          alert(res.responseText || res.responseJSON)
        }
      })
    }
    this.render()
  },  
  events: {
    "submit form": "submit"
  },
  template: JST["courses/form"],
  templateParams: function(){
    return {
      title: "New", 
      action: "Create",
      course: this.model
    }
  },
  render: function(){
    renderContent = this.template(this.templateParams())
    this.$el.html(renderContent)
    return this    
  },
  submit: function(event){
    var view = this
    event.preventDefault()
    
    var params = $(event.currentTarget).serializeJSON()
    var newCourse = new Scbt.Models.Course()
    newCourse.save(params["course"], {
      success: function(req, res){
        alert("Your course has been created")
        // view.collection.add(newCourse)
        Backbone.history.navigate("/#", {trigger: true})
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
      }
    })
  }
});