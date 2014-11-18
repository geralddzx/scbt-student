Scbt.Views.Enrollments = Backbone.CompositeView.extend({
  initialize: function(){
    this.render()
    this.addSearchView()
  },
  
  template: JST["enrollments/enrollments"],
  
  render: function(){
    renderedContent = this.template()
    this.$el.html(renderedContent)
    return this
  },

  addSearchView: function(){
    var view = new Scbt.Views.EnrollmentSearch
    this.addSubview("#search", view)
  },
})