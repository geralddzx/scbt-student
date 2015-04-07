Backbone.View.prototype.disablePageNav = function(){
	this.$(".pagination li").attr("class", "disabled")
}

Backbone.View.prototype.enablePageNav = function(){
	this.$(".pagination li").attr("class", "enabled")
}

Backbone.View.prototype.buildUploader = function(){
	$this = this
	var $el = this.$('input[type=filepicker]')
	filepicker.constructWidget($el[0])
	$el.change(function(){
		$this.submitFile()
	})
}