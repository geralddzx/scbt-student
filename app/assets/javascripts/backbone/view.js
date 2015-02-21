Backbone.View.prototype.disablePageNav = function(){
	this.$(".pagination li").attr("class", "disabled")
}

Backbone.View.prototype.enablePageNav = function(){
	this.$(".pagination li").attr("class", "enabled")
}

Backbone.View.prototype.buildUploader = function(){
	$this = this
	filepicker.constructWidget(this.$('input[type=filepicker]')[0])
	$('input[type=filepicker]').change(function(e){
		$this.submitFile(e)
	})
}