<!DOCTYPE html>
<html>
<head>
  <head>
    <title>Kantin</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">
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
  <style>
  table, th, td 
  {
    margin:10px 0;
    border:solid 1px #333;
    padding:2px 4px;
    font:15px Verdana;
  }
  th {
    font-weight:bold;
  }
</style>
</head>
<body>
  <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:10%">
    <h3 class="w3-bar-item">Index</h3>
    <a href="#" class="w3-bar-item w3-button">Home</a>
    <a href="/menu" class="w3-bar-item w3-button">Menu</a>
    <a href="#" class="w3-bar-item w3-button">Link 3</a>
  </div>
  <div style="margin-left:15%">
    <div id="map" style="width:500px;height:500px;">
    </div>
  </div>
  <script>
    var obj={{.jsonk}}

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
            infowindow.setContent(obj[i].Nama);
            infowindow.open(map, marker);
          }
        })(marker, i));
      }

      function placeMarker(location) {
        if ( marker ) {
          marker.setPosition(location);
        } else {
          marker = new google.maps.Marker({
            position: location,
            map: map
          });
        }
        if (!!infowindow && !!infowindow.close) {
          infowindow.close();
        }
        infowindow = new google.maps.InfoWindow({
          content: '<form method="post" action="/inputmenu">Nama kantin:</br> <input type="text" name="nama" placeholder="ex. Kantin Baru"><br>Lokasi: </br><input type="text" name="lokasi" placeholder="ex. Labtek X"><br><input type="submit" value="Submit"></form>'
        });
        infowindow.open(map,marker);
      }

      google.maps.event.addListener(map, 'click', function(event) {
        placeMarker(event.latLng);
      });
    }
  </script>
  <script async defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiR44OZuZJXCsWOdazQpoVyetbaFt23a4&callback=initMap">
</script>
</body>
</html>