Scbt.Views.CampusesIndex = Backbone.View.extend({
	events: {
	  "click button.remove-campus": "campusDestroy",
	},
  
  initialize: function(){
    	this.listenTo(this.collection, "sync", this.render)
   		this.collection.fetch()
 	},

	template: JST["campuses/index"],

  render: function(){
    renderedContent = this.template({campuses: this.collection})
    this.$el.html(renderedContent)
    $(document).ready(this.loadMap.bind(this))
    return this
	},

	campusDestroy: function(event){
    event.preventDefault()
    view = this
    
    var id = $(event.target).attr("id")
    var campus = this.collection.get(id)
    campus.destroy({
      success: function(req, res){
        alert("This campus has been deleted")
        view.render()
      },
      error: function(req, res){
        alert(res.responseJSON || res.responseText)
        // view.collection.fetch()
      }
    })
  },  

  loadMap: function(){
    var map = new google.maps.Map($('#campuses-map')[0])
    var geocoder = new google.maps.Geocoder();
    var bounds = new google.maps.LatLngBounds();

    this.collection.each(function(campus){
      geocoder.geocode({address: campus.address()}, function(results, status){
        if(status == google.maps.GeocoderStatus.OK){
          var coords = results[0].geometry.location
          var marker = new google.maps.Marker({
            map: map,
            position: coords,
            title: campus.get("name") + ":" + campus.address(),
          })
          bounds.extend(coords)
          map.fitBounds(bounds)
        }
      })
    })
  },


})