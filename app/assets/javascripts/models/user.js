Scbt.Models.User = Backbone.Model.extend({
  url: "api/user",
  admin: function(){
    var permission = this.get('permission');
    return (permission == "ADMIN" || permission == "MASTER_ADMIN")
  },
  master_admin: function(){
    return this.get('permission') == "MASTER_ADMIN"
  },
  student: function(){
    return this.get('permission') == "STUDENT"
  },
  instructor: function(){
    return this.get('permission') == "INSTRUCTOR"
  },
  permissionType: function(){
    var permission = this.get('permission');
    if (permission == "ADMIN" || permission == "MASTER_ADMIN"){
      return "admin";
    }
    return permission.toLowerCase();
  },
  mailProvider: function(){
    return this.get("email").split("@")[1]
  },

  removePhotoFp: function(url){
    if (url && url != ""){
      filepicker.remove({url: url})
      // {}, function(){
      //   alert("Your old photo has been removed")
      // })
    } 
  },

  changePhoto: function(url){
    var user = this
    var old_url = this.get("photo_url")
    this.set("photo_url", url)
    this.saveWithError({}, function(){
      alert("Your profile photo has been updated")
      user.removePhotoFp(old_url)
    })
  },


})
