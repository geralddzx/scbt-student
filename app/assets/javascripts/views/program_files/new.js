Scbt.Views.ProgramFilesNew = Backbone.FileView.extend({
	events: {
    "click #choose-file": "browseFiles",
    "change #file-input": "updateFileName",
    "click #add-file": "addFile",
  },

  initialize: function(){
    this.listenTo(this.collection, "sync", this.render)
  },
  
  template: JST["program_files/new"],
  
  render: function(){
    renderedContent = this.template({
      change_permission: this.collection.change_permission
    })
    this.$el.html(renderedContent)
    this.buildUploader()
    this.delegateEvents()
    return this
  }, 

  // browseFiles: function(event){
  //   $("#file-input").click()
  // },

  submitFile: function(){
    var view = this
    var url = event.currentTarget.value
    var newFile = new Scbt.Models.ProgramFile()
    newFile.set("url", url)
    newFile.set("program_id", this.collection.program.get("id"))
    newFile.saveWithError({}, function(){
      view.collection.add(newFile)
    })
  },

  // checkFile: function(file, content){
  //   if (file.size > this.collection.maxFileSize){
  //     alert("File must be smaller than " + this.collection.maxFileDes)
  //     this.enableAddFile()      
  //   } else {
  //     this.uploadFile(file, content)
  //   }
  // },

  // uploadFile: function(file, content){
  //   var view = this
  //   var newFile = new Scbt.Models.ProgramFile
  //   newFile.set("program_id", this.collection.program.get("id"))
  //   newFile.set("name", file.name)
  //   newFile.set("file", content)
  //   newFile.save({}, {
  //     success: function(){
  //       view.collection.add(newFile)
  //       // view.enableAddFile()
  //     },
  //     error: function(model, res){
  //       alert(res.responseJSON || res.responseText)
  //       view.enableAddFile()
  //     }
  //   })
  // },

  // disableAddFile: function(){
  //   this.$("#add-file").html("Uploading...")
  //   this.$("#add-file").attr("disabled", "disabled")
  // },

  // enableAddFile: function(){
  //   this.$("#add-file").attr("disabled", false)
  //   this.$("#add-file").html("Add File") 
  // },

  // updateFileName: function(){
  //   var name = this.$("#file-input").val()
  //   if (name){
  //     this.$("#file-name").html(name)
  //   } else {
  //     this.$("#file-name").html("Add New File Here")
  //   }
  // }
})