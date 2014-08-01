Scbt.Collections.Users = Backbone.Collection.extend({
  model: Scbt.Models.User,
  initialize: function(models, options){
    if (options && options.url){this.url = options.url}
  }
  // url: "api/users"
})

Scbt.Collections.instructors = new Scbt.Collections.Users([],{url: "api/users/instructors"})