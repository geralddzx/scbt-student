Scbt.Views.HostShow = Backbone.View.extend({
	events: {
    "click #edit-list": "editMode",
    "click #select-all": "selectAll",
    "click #deselect-all": "deselectAll",
    "click #cancel-edit": "showMode",
    "click #update-hosts": "update"
    // "submit form": "submit"
  },

  initialize: function(){
    this.listenTo(this.model, "sync", this.showMode)
  	this.model.fetch()
  },
  
  showTemplate: JST["surveys/hosts_show"],
  editTemplate: JST["surveys/hosts_edit"],
  
  render: function(template){
  	var renderedContent = template({hosts: this.model})
    this.$el.html(renderedContent)
    this.checkBoxes()
    return this
  },

  showMode: function(){
    this.render(this.showTemplate)
  },

  editMode: function(){
    this.render(this.editTemplate)
  },

  selectAll: function(){
    this.$("input").prop("checked", true)
  },

  deselectAll: function(){
    this.$("input").prop("checked", false)
  },

  update: function(){
    var view = this
    var params = this.$('form').serializeJSON()
    params.host_ids || (params.host_ids = {})

    this.model.saveWithError(params, function(){
      alert(capitalize(pluralize[view.model.hostType]) + " that use this survey has been changed")
      view.showMode()
    })
  },

  checkBoxes: function(){
    var view = this
    this.model.currentHosts.each(function(host){
      view.$('input#' + host.get("id")).prop("checked", true)
    })
  }
})