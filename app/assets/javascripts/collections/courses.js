Scbt.Collections.Programs = Backbone.Collection.extend({
  initialize: function(models, options){
    if (options && options.url){
      this.url = options.url
    }
  },
  model: Scbt.Models.Program,
  url: "api/programs"
  // getOrFetch: function(id){
//     program = this.get(id)
//     collection = this
//
//     if (program){
//       program.fetch()
//     } else {
//       program = new this.model({id: id})
//       program.fetch({
//         success: function(req, res){collection.add(program)}
//       })
//     }
//     return program
//   }
});

Scbt.Collections.programs = new Scbt.Collections.Programs;