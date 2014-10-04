Scbt.Views.ProgramFilesIndex = Backbone.View.extend({
	events: {
    'click .remove-file': 'destroyFile'
    // 'submit form': 'submitForm'
  },

  initialize: function(){
    this.listenTo(this.collection, "sync add remove", this.render)
  },

  template: JST["program_files/index"],
  
  render: function(){
    renderedContent = this.template({
      files: this.collection,
      change_permission: this.collection.change_permission
    })
    this.$el.html(renderedContent)
    return this
  },

  destroyFile: function(event){
    var view = this
    id = $(event.currentTarget).attr("id")
    var programFile = this.collection.get(id)
    if (confirm("Are you sure you want to delete " + programFile.get("file_name"))){
      programFile.destroy({
        error: function(req, res){
          alert(res.responseJSON || res.responseText)
        }
      })
    }
  },
})