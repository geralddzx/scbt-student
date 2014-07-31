Scbt.Collections.Courses = Backbone.Collection.extend({
  initialize: function(models, options){
    if (options && options.url){
      this.url = options.url
    }
  },
  model: Scbt.Models.Course,
  url: "api/courses"
  // getOrFetch: function(id){
//     course = this.get(id)
//     collection = this
//
//     if (course){
//       course.fetch()
//     } else {
//       course = new this.model({id: id})
//       course.fetch({
//         success: function(req, res){collection.add(course)}
//       })
//     }
//     return course
//   }
});

Scbt.Collections.courses = new Scbt.Collections.Courses;