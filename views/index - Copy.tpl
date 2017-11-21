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
      var obj1={{.json}}
      var obj2=JSON.parse(obj1[1])
      document.getElementById("demo").innerHTML = "aasdaf";

      function initMap() {
      var pin ={lat: obj.lat, lng: obj.lng};
      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 20,
        center:pin
      });
      var marker = new google.maps.Marker({
        position:pin,
        map:map
      });
      var infowindow = new google.maps.InfoWindow({
        content:obj.nama
      });
      google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map,marker);
      }); 
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBG5qIxqpGx7cbnT7KdVVvz0f8Z8F32eAc&callback=initMap"
    async defer></script>
  </body>
</html>
