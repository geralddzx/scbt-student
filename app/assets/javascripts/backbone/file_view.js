Backbone.FileView = Backbone.View.extend({
  selectFile: function(){
    return this.$('input[type=file]')[0].files[0]
  }
})
