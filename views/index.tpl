<!DOCTYPE html>
<html>
<head>
  <head>
    <title>Kantin</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<body onLoad="CreateTableFromJSON()">
  <div id="map" style="width:500px;height:500px;">
  </div>
  <div id="showData"></div>
  <p id="demo"></p>
  <script>
    var myList = {{.jsonm}}

    function CreateTableFromJSON() {
      var myBooks = {{.jsonm}}
      document.getElementById("demo").innerHTML = "";
        // EXTRACT VALUE FOR HTML HEADER. 
        // ('Book ID', 'Book Name', 'Category' and 'Price')
        var col = [];
        for (var i = 0; i < myBooks.length; i++) {
          for (var key in myBooks[i]) {
            if (col.indexOf(key) === -1) {
              col.push(key);
            }
          }
        }

        // CREATE DYNAMIC TABLE.
        var table = document.createElement("table");

        // CREATE HTML TABLE HEADER ROW USING THE EXTRACTED HEADERS ABOVE.

        var tr = table.insertRow(-1);                   // TABLE ROW.

        for (var i = 0; i < col.length; i++) {
            var th = document.createElement("th");      // TABLE HEADER.
            th.innerHTML = col[i];
            tr.appendChild(th);
          }

        // ADD JSON DATA TO THE TABLE AS ROWS.
        for (var i = 0; i < myBooks.length; i++) {

          tr = table.insertRow(-1);

          for (var j = 0; j < col.length; j++) {
            var tabCell = tr.insertCell(-1);
            tabCell.innerHTML = myBooks[i][col[j]];
          }
        }

        // FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
        var divContainer = document.getElementById("showData");
        divContainer.innerHTML = "";
        divContainer.appendChild(table);
      }
    </script>
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