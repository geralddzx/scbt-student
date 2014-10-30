Scbt.Models.HostAnswer = Backbone.Model.extend({
	initialize: function(attributes, options){
    this.surveyHost = options.surveyHost
  },

  url: function(){
    var hostURL = (this.surveyHost.url || this.surveyHost.url())
  	return hostURL + "/survey_answers"
  }, 

  // parse: function(res){
  //   this.allHosts = new this.collection(res[pluralize[this.hostType]])
  //   this.currentHosts = new this.collection(res[this.hostType + "_hosts"])
  // }
})