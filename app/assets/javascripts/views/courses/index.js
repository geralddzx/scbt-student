Scbt.Views.ProgramsIndex = Backbone.View.extend({
  events: {
    "click button.remove-program": "programDestroy",
    "click button.edit-program": "programEdit"
  },
  initialize: function(){
    this.listenTo(this.collection, "sync", this.render)
    this.collection.fetch()
  },
  template: function(){
    if (this.collection.url.indexOf("user") === -1){
      return JST["programs/index"]
    } else {
      return JST["programs/user_index"]
    }      
  },
  render: function(){
    renderedContent = this.template()({programs: this.collection})
    this.$el.html(renderedContent)
    return this
  },
  programDestroy: function(event){
    event.preventDefault()
    view = this
    
    var id = $(event.target).attr("id")
    var program = this.collection.get(id)
    program.destroy({
      success: function(req, res){
        alert("This program has been deleted")
        view.render()
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
        // view.collection.fetch()
      }
    })
  }  
})