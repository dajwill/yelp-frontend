<map>
  <div id="map-canvas" style="height:30vh;margin:0 10px;"></div>
  <script>
    import GoogleMapsLoader  from 'google-maps'
    GoogleMapsLoader.KEY = process.env.GMAPS_AUTH;

    function initMap() {
      return GoogleMapsLoader.load(function(google) {
        var uluru = {lat: opts.coords.latitude, lng: opts.coords.longitude};
        var map = new google.maps.Map(document.getElementById('map-canvas'), {
          zoom: 15,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      });
    }

    this.on('mount', () => {
      initMap()
    })
  </script>
</map>
