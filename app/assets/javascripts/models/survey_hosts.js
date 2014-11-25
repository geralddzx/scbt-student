Scbt.Models.SurveyHosts = Backbone.Model.extend({
	initialize: function(attributes, options){
    this.survey = options.survey
    this.hostType = options.hostType
    this.modelClass = options.modelClass

    this.collection = Scbt.Collections[capitalize(pluralize[this.modelClass])]
  },

  url: function(){
  	return this.survey.url() + "/" + pluralize[this.hostType]
  }, 

  parse: function(res){
    Backbone.Model.prototype.parse(res)
    
    this.allHosts = new this.collection(res[pluralize[this.hostType]])
    this.currentHosts = new this.collection(res[this.hostType + "_hosts"])
  }
})