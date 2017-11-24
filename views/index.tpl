<!DOCTYPE html>
<html>
<head>
  <title>Kantin</title>
  <meta name="viewport" content="initial-scale=1.0">
  <meta charset="utf-8">
  <style>
  #map {
    height: 100%;
  }
  html, body {
    height: 100%;
    margin: 0;
    padding: 0;
  }
</style>
</head>
<body>
  <div id="map" style="width:500px;height:500px;"></div>
  <p id="demo"></p>
  <script>
    var obj={{.json}}
    function initMap() {
      var cmap = {lat: -6.891020, lng: 107.610378};
      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 16,
        center: cmap,
        styles: [
        {
          "featureType": "administrative",
          "elementType": "geometry",
          "stylers": [
          {
            "visibility": "off"
          }
          ]
        },
        {
          "featureType": "poi",
          "stylers": [
          {
            "visibility": "off"
          }
          ]
        },
        {
          "featureType": "road",
          "elementType": "labels.icon",
          "stylers": [
          {
            "visibility": "off"
          }
          ]
        },
        {
          "featureType": "transit",
          "stylers": [
          {
            "visibility": "off"
          }
          ]
        }
        ]
      });
      var infowindow = new google.maps.InfoWindow();

      var marker, i;

      for (i = 0; i < obj.length; i++) {  
        marker = new google.maps.Marker({
          position: new google.maps.LatLng(obj[i].lat, obj[i].lng),
          map: map
        });

        google.maps.event.addListener(marker, 'click', (function(marker, i) {
          return function() {
            infowindow.setContent(obj[i].nama);
            infowindow.open(map, marker);
          }
        })(marker, i));
      }
    }
  </script>
  <script async defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiR44OZuZJXCsWOdazQpoVyetbaFt23a4&callback=initMap">
</script>
</body>
</html>