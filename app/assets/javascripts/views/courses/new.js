Scbt.Views.CoursesNew = Backbone.View.extend({
  events: {
    "submit form": "submit"
  },
  template: JST["courses/form"],
  templateParams: {
    title: "New", 
    action: "Create", 
    course: new Scbt.Models.Course
  },
  render: function(){
    renderContent = this.template(this.templateParams)
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
        view.collection.add(newCourse)
        Backbone.history.navigate("/#", {trigger: true})
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
      }
    })
  }
});