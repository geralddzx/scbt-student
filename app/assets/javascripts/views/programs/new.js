Scbt.Views.ProgramsNew = Backbone.View.extend({
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
  template: JST["programs/new"],
  render: function(){
    renderContent = this.template({program: this.model})
    this.$el.html(renderContent)
    return this    
  },
  submit: function(event){
    event.preventDefault()
    var view = this
    
    var params = $(event.currentTarget).serializeJSON()
    this.model.save(params["program"], {
      success: function(req, res){
        alert("Your program has been created")
        Backbone.history.navigate("/programs/" + view.model.get("id"), {trigger: true})
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
      }
    })
  }
});