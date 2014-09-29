Scbt.Views.ProgramShowFiles = Backbone.View.extend({
  events: {
    'change input[type=file]': 'handleFile',
    'click #add-file': 'createFile'
  },

  initialize: function(){
    this.listenTo(this.collection, "sync", this.render)
    this.collection.fetch()
    this.newFile = new Scbt.Models.ProgramFile
    this.newFile.set("program_id", this.collection.program.get("id"))
  },

  template: JST["programs/show/files"],
  
  render: function(){
    console.log(this.collection)
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
    if (this.$('input[type=file]')[0].files[0]){
      view = this
      this.collection.add(this.newFile)
      this.newFile.save({},{
        success: function(){
          alert("File has been added")
          view.render()
        }, 
        error: function(req, res){
          alert(res.responseJSON || res.responseText)
        }
      })
    } else {
      alert("There is no file to upload")
    }
  },

  disableAddFile: function(){
    this.$("#add-file").attr("disabled", "disabled")
  },

  enableAddFile: function(){
    this.$("#add-file").attr("disabled", false)
  }
})