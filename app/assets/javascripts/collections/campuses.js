Scbt.Collections.Campuses = Backbone.Collection.extend({
  model: Scbt.Models.Campus,
  url: "api/campuses"
})

Scbt.Collections.campuses = new Scbt.Collections.Campuses