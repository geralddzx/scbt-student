Scbt.Collections.Courses = Backbone.Collection.extend({
  model: Scbt.Models.Course,
  url: "api/courses",
  getOrFetch: function(id){
    course = this.get(id)
    collection = this
    
    if (!course){
      course = new this.model({id: id})
      course.fetch({
        success: function(req, res){collection.add(course)}
      })
    }
    return course
  }
});

Scbt.Collections.courses = new Scbt.Collections.Courses;