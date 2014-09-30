Scbt.Views.ProgramShowFiles = Backbone.View.extend({
  events: {
    'change input[type=file]': 'handleFile',
    'click #add-file': 'createFile',
    'click .remove-file': 'destroyFile',
    // 'submit form': 'submitForm'
  },

  initialize: function(){
    this.listenTo(this.collection, "sync", this.render)
    this.collection.fetch()
    this.newFile = new Scbt.Models.ProgramFile
    this.newFile.set("program_id", this.collection.program.get("id"))
  },

  template: JST["programs/show/files"],
  
  render: function(){
    renderedContent = this.template({
      files: this.collection
    })
    this.$el.html(renderedContent)
    return this
  },

  handleFile: function (event) {
    var view = this
    this.disableAddFile()

    var file = event.currentTarget.files[0]
    this.newFile.set("file_name", file.name)
    var reader = new FileReader()
    reader.onload = function(e) {
      view.newFile.set("file", this.result)
      view.enableAddFile()
    }
    if (file){
      reader.readAsDataURL(file);
    } 
  },

  createFile: function(){
    view = this
    var newFile = this.newFile
    newFile.unset("id")
    this.toggleUpload()
    if (this.$('input[type=file]')[0].files[0]){
      
      newFile.save({},{
        success: function(){
          // alert("File has been added")
          view.collection.add(newFile)
          view.render()
          view.toggleAddFile()
        }, 
        error: function(req, res){
          alert(res.responseJSON || res.responseText)
          view.toggleAddFile()
        }
      })
    } else {
      alert("There is no file to upload")
    }
  },

  destroyFile: function(event){
    var view = this
    id = $(event.currentTarget).attr("id")
    var programFile = this.collection.get(id)
    programFile.destroy({
      success: function(req, res){
        alert("This file has been deleted")
        view.render()
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
      }
    })
  },

  disableAddFile: function(){
    this.$("#add-file").attr("disabled", "disabled")
  },

  enableAddFile: function(){
    this.$("#add-file").attr("disabled", false)
  },

  toggleUpload: function(){
    this.$("#add-file").html("Uploading...")  
  },

  toggleAddFile: function(){
    this.$("#add-file").html("Add File")  
  }
  // submitForm: function(event){
  //   console.log($(event.currentTarget).serializeJSON())
  // }
})