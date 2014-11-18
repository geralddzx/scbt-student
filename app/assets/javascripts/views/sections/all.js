Scbt.Views.AllSections = Backbone.CompositeView.extend({
  events: {
    "submit form": "submit"
  },

  initialize: function(){
    this.listenTo(this.collection, "sync", this.render)
    this.collection.fetch()
  },

  template: JST["sections/all"],

  render: function(){
    renderedContent = this.template({programs: this.collection.programsSections})
    this.$el.html(renderedContent)
    this.removeAllSubviews()
    var view = this
    var programSections = this.collection.programsSections
    
    Object.keys(programSections).forEach(function(key){
      view.addSubview("#" + programSections[key].subviewId(), new Scbt.Views.ProgramSections({collection: programSections[key]}))
    })
    return this
  },

  indexSubview: function(id){
    return this.subviews("#" + this.collection.programSections[id].subviewId())[0]
  },

  submit: function(event){
    event.preventDefault()
    var view = this
    var params = $(event.currentTarget).serializeJSON()
    var id = $(event.currentTarget).attr("id")
    var model = new Scbt.Models.Section
    model.saveWithError(params["section"], function(req, res){
      alert("This Section has been created")
      view.subviews("#" + id)[0].cancelNew()
      var collection = view.collection.programsSections[res["program_id"]]
      if (collection){
        collection.add(model)
      } else {
        Backbone.history.loadUrl(Backbone.history.fragment)
      }
    }) 
  }  
})