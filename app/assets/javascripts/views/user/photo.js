Scbt.Views.UserShowPhoto = Backbone.FileView.extend({
  events: {
    "click #new-photo": "browseFiles",
    "click #profile-photo": "browseFiles",
    "click #replace-photo": "replacePhoto",
    "click #remove-photo": "removePhoto",
    "change #photo-file": "updateFileName"
  },

  initialize: function(){
    // this.model = new Scbt.Models.Photo()
    this.listenTo(this.model, "sync", this.render)
    this.render()
  },
  
  template: JST["user/photo"],
  
  render: function(){
    renderedContent = this.template({user: this.model})
    this.$el.html(renderedContent)
    this.buildUploader()
    return this
  }, 

  browseFiles: function(event){
    $("#photo-file").click()
  },

  submitFile: function(){
    var url = event.currentTarget.value
    this.model.changePhoto(url)
  },

  removePhoto: function(){
    this.model.changePhoto(null)
  },

  // checkFile: function(file, content){
  //   if (file.size > this.model.get("maxPhotoSize")){
  //     alert("File must be smaller than " + this.model.get("maxPhotoDes"))
  //     this.enableReplaceFile()      
  //   } else if(!file.name.match(/.png$|.jpe?g$|.gif$|.PNG$|.JPG?G$|.GIF$/)){
  //     alert("File must be a PNG, JPEG or GIF file")
  //     this.enableReplaceFile()
  //   } else {
  //     this.uploadFile(file, content)
  //   }
  // },

  // uploadFile: function(file, content){
  //   this.model.set("photo", content)
  //   this.model.set("photo_name", file.name)
  //   var view = this
  //   this.model.save({}, {
  //     success: function(){
  //       alert("your Profile Photo Has Been Updated")
  //       // view.enableReplaceFile()
  //     },
  //     error: function(model, res){
  //       alert(res.responseJSON || res.responseText)
  //       view.enableReplaceFile()
  //     }
  //   })
  // },

  // disableReplaceFile: function(){
  //   this.$("#replace-photo").html("Submitting...")
  //   this.$("#replace-photo").attr("disabled", "disabled")
  // },

  // enableReplaceFile: function(){
  //   this.$("#replace-photo").attr("disabled", false)
  //   this.$("#replace-photo").html("Submit") 
  // },

  // disableRemoveFile: function(){
  //   this.$("#remove-photo").attr("disabled", "disabled")
  // },

  // enableRemoveFile: function(){
  //   this.$("#remove-photo").attr("disabled", false)
  // },

  // updateFileName: function(){
  //   var name = this.$("#photo-file").val()
  //   if (name){
  //     this.$("#file-name").html(name)
  //   } else {
  //     this.$("#file-name").html("Upload Your Profile Photo Here")
  //   }
  // },


})