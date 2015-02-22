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
    this.fetchFileNames()
    return this
  },

  fetchFileNames: function(){
    this.collection.each(function(file){
      filepicker.stat({url: file.get("url")}, {filename: true}, function(metadata){
        $("#file-" + file.get("id") + " .file-name").html(metadata.filename)
        $("#file-" + file.get("id")).show()
        file.set("fileName", metadata.filename)
      })
    })
  },

  destroyFile: function(event){
    var view = this
    id = $(event.currentTarget).attr("id")
    var programFile = this.collection.get(id)
    if (confirm("Are you sure you want to delete " + programFile.get("fileName"))){
      programFile.destroyWithError(function(){
        filepicker.remove({url: programFile.get("url")}, function(){
          alert("Your file has been removed")
        })
      })
    }
  },
})