Scbt.Collections.Courses = Backbone.Collection.extend({
  model: Scbt.Models.Course,
  url: "api/courses"
});

Scbt.Collections.courses = new Scbt.Collections.Courses