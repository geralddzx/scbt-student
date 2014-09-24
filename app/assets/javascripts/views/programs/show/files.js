Scbt.Views.ProgramShowFiles = Backbone.View.extend({
  events: {
    'change #file-upload': 'handleFile',
  },

  initialize: function(){
    this.render()
  },
  
  template: JST["programs/show/files"],
  
  render: function(){
    renderedContent = this.template({
    })
    this.$el.html(renderedContent)
    return this
  },

  handleFile: function (event) {
    var file = event.currentTarget.files[0]
    var reader = new FileReader()
    reader.onload = function(e) {
      console.log(this.result)
    }
    reader.readAsDataURL(file);
  }
})