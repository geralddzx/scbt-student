window.Scbt = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Scbt.Routers.Router()
    Backbone.history.start()
  }
}