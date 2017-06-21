<map>
  <div id="map-canvas"></div>
  <script>
    import GoogleMapsLoader  from 'google-maps'
    GoogleMapsLoader.KEY = process.env.GMAPS_AUTH;

    function initMap() {
      return GoogleMapsLoader.load(function(google) {
        var business = {lat: opts.coords.latitude, lng: opts.coords.longitude};
        var map = new google.maps.Map(document.getElementById('map-canvas'), {
          zoom: 15,
          center: business
        });
        var marker = new google.maps.Marker({
          position: business,
          map: map
        });
      });
    }

    this.on('mount', () => {
      initMap()
    })
  </script>
</map>
