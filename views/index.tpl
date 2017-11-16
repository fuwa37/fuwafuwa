<!DOCTYPE html>
<html>
  <head>
    <title>Kantin</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
    <div id="map" style="width:500px;height:500px;"></div>
    <script>
      function initMap() {
      var pin ={lat: -6.887114, lng: 107.610229};
      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 20,
        center:pin
      });
      var marker = new google.maps.Marker({
        position:pin,
        map:map
      });
      var infowindow = new google.maps.InfoWindow({
        content:"Hello World!"
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
