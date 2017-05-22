<map>
  <div id="map-canvas" style="width:100vw;height:30vh;"></div>
  <script>
    import GoogleMapsLoader  from 'google-maps'
    GoogleMapsLoader.KEY = process.env.GMAPS_AUTH;
    console.log('coords', opts.coords);

    function initMap() {
      console.log('init map');
      return GoogleMapsLoader.load(function(google) {
        console.log('google', google);
        var uluru = {lat: opts.coords.latitude, lng: opts.coords.longitude};
        var map = new google.maps.Map(document.getElementById('map-canvas'), {
          zoom: 15,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
        console.log(map);
      });
    }
    this.on('mount', () => {
      console.log('before', document.getElementById('map'));
      initMap()
      console.log('after', document.getElementById('map'));
    })
  </script>
</map>
