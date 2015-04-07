Scbt.Views.EnrollmentSearch = Backbone.View.extend({
	events: {
    'keyup #campus-search': 'renderSelect',
    'keyup #program-search': 'renderSelect',
    'keyup #student-search': 'renderSelect',
    
    'change #campus-select': 'updateIndexView',
    'change #student-select': 'updateIndexView',
    'change #program-select': 'updateIndexView',
  },

  initialize: function(){
    this.model = new Scbt.Models.EnrollmentSearch
    this.listenTo(this.model, "sync add remove", this.render)
    this.model.fetch()
  },

  template: JST["enrollments/search"],
  
  render: function(){
    renderedContent = this.template({criteria: this.model})
    this.$el.html(renderedContent)

    this.populate()
    this.listenTo(this.model.enrollments, "sync add remove", this.updateIndexView)
    this.updateIndexView()
    return this
  },

  filterCollection: function(collection, attribute, value){
    if (!value || value.length == 0){
      return new collection.constructor(collection.models)
    }
    var filter = {}
    filter[attribute] = value
    return new collection.constructor(collection.where(filter))
  },

  updateIndexView: function(){
    var collection = this.buildCollection()
    var view = new Scbt.Views.EnrollmentsIndex({collection: collection, model: this.model})
    this.parentView.swapSubview("#index", view)
  },

  buildCollection: function(){
    var campus_id = parseInt(this.$("#campus-select").val())
    var campusFilter = this.filterCollection(this.model.enrollments, "campus_id", campus_id)
    var student_id = parseInt(this.$("#student-select").val())
    var studentFilter = this.filterCollection(campusFilter, "student_id", student_id)
    var program_id = parseInt(this.$("#program-select").val())
    return this.filterCollection(studentFilter, "program_id", program_id)
  },

  populate: function(){
    this.populateSelect("campus")
    this.populateSelect("program")
    this.populateSelect("student")
  },

  populateSelect: function(model){
    var view = this
    var searchString = this.$("#" + model + "-search").val().toLowerCase()
    var collection = this.model[pluralize[model]]
    var select = this.$("#" + model + "-select")
    select.empty()
    if(searchString == ""){select.append(this.selectOption(model))}

    collection.each(function(model){
      if(model.get("name").toLowerCase().indexOf(searchString) > -1){
        select.append(view.modelOption(model))
      }
    })
    this.updateIndexView()
  },

  selectOption: function(modelClass){
    var option = $('<option>Select ' + capitalize(modelClass) + "</option>")
    option.val("")
    return option
  },

  modelOption: function(model){
    var option = $('<option>')
    if(model){
      option.val(model.get("id"))
      option.html(model.escape("name"))
    }
    return option
  },

  renderSelect: function(event){
    var id = $(event.target).attr("id")
    var model = id.slice(0, id.length - 7)
    this.populateSelect(model)
  },
})