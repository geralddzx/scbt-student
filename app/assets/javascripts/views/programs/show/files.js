Scbt.Views.ProgramShowFiles = Backbone.View.extend({
  events: {
    'change input[type=file]': 'handleFile',
    'click #add-file': 'createFile',
    'click .remove-file': 'destroyFile',
    // 'submit form': 'submitForm'
  },

  initialize: function(){
    this.listenTo(this.collection, "sync", this.render)
    this.listenTo(this.collection, "add", this.render)
    this.collection.fetch()
    
    this.reader = new FileReader()
  },

  template: JST["programs/show/files"],
  
  render: function(){
    renderedContent = this.template({
      files: this.collection,
      change_permission: this.collection.change_permission
    })
    this.$el.html(renderedContent)
    return this
  },

  handleFile: function (event) {
    this.disableAddFile()
    var view = this

    var file = event.currentTarget.files[0]
    this.reader.onload = function(e){
      view.setNewFile(file, this.result)
      view.enableAddFile()
    }
    this.read(file)
  },

  createFile: function(){
    if (this.$('#add-file').html() == "Add File"){
      view = this
      if (this.$('input[type=file]')[0].files[0]){
        this.toggleUpload()
        this.saveNewFile()
      } else {
        alert("There is no file to upload")
      }
    }  
  },

  saveNewFile: function(){
    var view = this
    this.newProgramFile.unset("id")
    this.newProgramFile.save({},{
      success: function(){
        view.collection.add(view.newProgramFile)
        view.toggleAddFile()
      }, 
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
        view.toggleAddFile()
      }
    })
  },

  destroyFile: function(event){
    var view = this
    id = $(event.currentTarget).attr("id")
    var programFile = this.collection.get(id)
    if (confirm("Are you sure you want to delete " + programFile.get("file_name"))){
      programFile.destroy({
        success: function(req, res){
          view.render()
        },
        error: function(req, res){
          alert(res.responseJSON || res.responseText)
        }
      })
    }
  },

  read: function(file){
    if (file){
      this.reader.abort()
      this.reader.readAsDataURL(file)
    } 
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
  },

  setNewFile: function(file, content){
    this.newProgramFile = new Scbt.Models.ProgramFile
    this.newProgramFile.set("program_id", this.collection.program.get("id"))
    this.newProgramFile.set("file_file_name", file.name)
    // this.newProgramFile.set("file_size", file.size)
    this.newProgramFile.set("file_file_content", content)
  },

  file: function(){
    return this.$('input[type=file]')[0].files[0]
  }
})