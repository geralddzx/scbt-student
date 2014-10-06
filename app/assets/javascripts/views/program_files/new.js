Scbt.Views.ProgramFilesNew = Backbone.FileView.extend({
	events: {
    'change input[type=file]': 'handleFile',
    'click #add-file': 'createFile'
  },

  initialize: function(){
    this.listenTo(this.collection, "sync", this.render)
    this.reader = new FileReader()
  },

  template: JST["program_files/new"],
  
  render: function(){
    renderedContent = this.template({
      change_permission: this.collection.change_permission
    })
    this.$el.html(renderedContent)
    return this
  },

  handleFile: function (event){
    this.disableAddFile()
    var view = this

    this.reader.onload = function(e){
      view.setNewFile(view.selectFile(), this.result)
      view.unload()
    }
    this.read()
  },

  createFile: function(event){
    view = this
    if (!this.selectFile()){
      alert("There is no file to upload")
    } else if (this.selectFile().size > this.collection.max_file_num){
      alert("File must be smaller than " + this.collection.max_file_word)
    } else {
      // $('input[type=file]').val("")
      this.toggleUpload()
      this.saveNewFile()
    } 
  },

  saveNewFile: function(){
    var view = this
    var newProgramFile = this.newProgramFile
    newProgramFile.unset("id")
    newProgramFile.save({},{
      success: function(){
        view.collection.add(newProgramFile)
        // view.toggleAddFile()
      }, 
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
        view.toggleAddFile()
      }
    })
  },

  read: function(){
    var file = this.selectFile()
    if (file){
      this.load()
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
    this.disableAddFile()
  },

  toggleAddFile: function(){
    this.$("#add-file").html("Add File")
    // if (this.selectFile() && this._loading === 0){
    //   this.enableAddFile()
    // }
  },

	setNewFile: function(file, content){
		this.newProgramFile = new Scbt.Models.ProgramFile
		this.newProgramFile.set("program_id", this.collection.program.get("id"))
		this.newProgramFile.set("name", file.name)
		this.newProgramFile.set("file", content)
	},
  
  load: function(){
    this.disableAddFile()
    if (this._loading == undefined){
      this._loading = 0
    }
    this._loading = this._loading + 1
  },

  unload: function(){
    if (this._loading == undefined){
      this._loading = 0
    }
    this._loading = this._loading - 1
    if (this._loading == 0 && this.$("#add-file").html() == "Add File" && this.selectFile()){
      this.enableAddFile()
    }
  }
})