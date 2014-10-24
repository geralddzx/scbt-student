Scbt.Collections.Surveys = Backbone.Collection.extend({
  model: Scbt.Models.Survey,
  url: "api/surveys"
})

Scbt.Collections.surveys = new Scbt.Collections.Surveys