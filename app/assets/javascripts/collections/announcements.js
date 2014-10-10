Scbt.Collections.Announcements = Backbone.Collection.extend({
  model: Scbt.Models.Announcement,
  url: "api/announcements"
})

Scbt.Collections.announcements = new Scbt.Collections.Announcements