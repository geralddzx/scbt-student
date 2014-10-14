Backbone.View.prototype.disablePageNav = function(){
	this.$(".pagination li").attr("class", "disabled")
}

Backbone.View.prototype.enablePageNav = function(){
	this.$(".pagination li").attr("class", "enabled")
}