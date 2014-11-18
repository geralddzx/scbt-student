Scbt.Views.EnrollmentSearch = Backbone.View.extend({
	events: {
    'keyup #campus-search': 'renderSelect',
    'keyup #program-search': 'renderSelect',
    'keyup #student-search': 'renderSelect',
    // 'submit form': 'submitForm'
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
    return this
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
    // var selector = "#" + model + "-select"
    // this.showSelect(selector)
  },

  showSelect: function(selector){
    var select = this.$(selector)[0]
    var event = document.createEvent('MouseEvents');
    event.initMouseEvent('mousedown', true, true, window);
    select.dispatchEvent(event);
  }
})