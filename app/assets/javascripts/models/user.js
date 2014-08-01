Scbt.Models.User = Backbone.Model.extend({
  url: "api/user",
  permissionType: function(){
    var permission = this.get('permission');
    if (permission == "ADMIN" || permission == "MASTER_ADMIN"){
      return "admin";
    }
    return permission.toLowerCase();
  }
})
