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
  }
})
