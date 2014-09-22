Scbt.Views.ProgramShowHome = Backbone.CompositeView.extend({
  initialize: function(options){
    this.render()
  },
  
  template: JST["programs/show/home/_"],
  
  render: function(){
    renderedContent = this.template({
      program: this.model,
    })
    this.$el.html(renderedContent)
    this.addUserView()
    return this
  },

  addUserView: function(){
    var viewName = "ProgramShow" + capitalize(Scbt.Models.user.permissionType())
    var view = Scbt.Views[viewName]
    this.addSubview(
      "#user", 
      new view({model: this.model})
    )
  }
})

  