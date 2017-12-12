<!DOCTYPE html>
<html>
<head>
  <title>Main</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <style>
  body {font-family: Arial;}

  /* Style the tabmenu */
  div.tabmenu {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
  }

  /* Style the buttons inside the tabmenu */
  div.tabmenu button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
  }

  /* Change background color of buttons on hover */
  div.tabmenu button:hover {
    background-color: #ddd;
  }

  /* Create an active/current tabmenulink class */
  div.tabmenu button.active {
    background-color: #ccc;
  }

  /* Style the tabmenu content */
  .tabmenucontent {
    display: none;
    padding: 60px 12px;
    border: 1px solid #ccc;
    border-top: none;
  }
</style>
<style>
#map {
  height: 500px;
  width: 500px
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
<style>
* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}

/* Style the tab */
div.tab {
  float: left;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  width: 15%;
  height: 100%;
}

/* Style the buttons inside the tab */
div.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
div.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
div.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  float: left;
  padding: 0px 12px;
  border: 1px solid #ccc;
  width: 85%;
  border-left: none;
  height: 100%;
}
</style>
</head>
<body>
  <div class="tab">
    <h2>INDEX</h2>
    <button class="tablinks" onclick="openIndex(event, 'Peta')" id="defaultOpen">Peta</button>
    <button class="tablinks" onclick="openIndex(event, 'Menu')">Daftar Menu</button>
    <button class="tablinks" onclick="openIndex(event, 'About')">About</button>
  </div>

  <div id="Peta" class="tabcontent">
    <div id="map">
    </div>
  </div>

  <div id="Menu" class="tabcontent">
    <div id="demo"></div>
    
  </div>

  <div id="About" class="tabcontent">
    <div id="showData" style="margin-left:0%"></div>
    <div id="tes3"></div>
  </div>
  <script>
    var menuK = {{.jsonm}}
    var col = [];
    for (var i = 0; i < menuK.length; i++) {
      for (var key in menuK[i]) {
        if (col.indexOf(key) === -1) {
          col.push(key);
        }
      }
    }
    function CreateTableFromJSON(menu,no) {
      var table = document.createElement("table");

      var tr = table.insertRow(-1);      

      for (var i = 1; i < col.length; i++) {
        var th = document.createElement("th");   
        th.innerHTML = col[i];
        tr.appendChild(th);
      }

      var idx=0;
      var edx=0;
      for (var k=0;k<menuK.length;k++) {
        if (menuK[k][col[0]]==menu) {
          idx=k;
          break;
        }
      }
      for (var k=0;k<menuK.length;k++) {
        if (menuK[k][col[0]]==menu) {
          edx=k;
        }
      }
      for (var i = idx; i < edx; i++) {

        tr = table.insertRow(-1);

        for (var j = 1; j < col.length; j++) {
          var tabCell = tr.insertCell(-1);
          tabCell.innerHTML = menuK[i][col[j]];

        }
      }

      var divContainer = document.getElementById("showData"+no);
      divContainer.innerHTML = "";
      divContainer.appendChild(table);

      //document.getElementById("tes3").innerHTML = "aaaa"+no; 
    }
    
    //window.onload=CreateTableFromJSON('Nasi Jepang');
  </script>
  <script>
    var menuKantin = {{.jsonm}}
    var dataKantin = {{.jsonk}}
    var kolom = [];
    for (var i = 0; i < dataKantin.length; i++) {
      for (var key in dataKantin[i]) {
        if (kolom.indexOf(key) === -1) {
          kolom.push(key);
        }
      }
    }
    var add=document.getElementById('demo');
    

    var data1='<div class="tabmenu"><div id="tes"></div><div id="tes2"></div></div>';
    var data2='<button class="tabmenulinks" onclick="openMenu(event,';
    var data3;
    var data31=',';
    var data32;
    var data4=')">';
    var data5='</button>';
    var data;
    var data6='<div id="';
    var data7='"class="tabmenucontent">';
    var data8='<div id="showData';
    var data10='" style="margin-left:0%"></div>';
    var data9='</div>';
    var data11;

    add.innerHTML+=data1
    var addt=document.getElementById('tes');
    var addt2=document.getElementById('tes2');
    for (i=0;i<dataKantin.length-1;i++) {
      data3=dataKantin[i][kolom[0]];
      data32=i;
      data=data2+"'"+data3+"'"+data31+data32+data4+data3+data5;
      addt.innerHTML+=data;
    }

    for (i=0;i<dataKantin.length-1;i++) {
      data3=dataKantin[i][kolom[0]];
      data11=i;
      data=data6+data3+data7+data8+data11+data10+data9;
      addt2.innerHTML+=data;
    }
  </script>
  <script>
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
            infowindow.setContent(obj[i].Nama);
            infowindow.open(map, marker);
          }
        })(marker, i));
      }

      var ltd,lng

      google.maps.event.addListener(map, 'click', function(event) {
        ltd=event.latLng.lat().toFixed(6)
        lng=event.latLng.lng().toFixed(6)
        placeMarker(event.latLng);


      });

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
        var isi='<form method="post" action="">Nama kantin:</br> <input type="text" name="nama" placeholder="ex. Kantin Baru"><br>Koordinat:</br><input type="text" name="ltd" value='+ltd+' readonly>'+'</br><input type="text" name="lng" value='+lng+' readonly>'+'<br><input type="submit" value="Submit"></form>'
        infowindow = new google.maps.InfoWindow({
          content: isi
        });
        infowindow.open(map,marker);
      }
    }
  </script>
  <script>
    function openIndex(evt, index) {
      var i, tabcontent, tablinks;
      tabcontent = document.getElementsByClassName("tabcontent");
      for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
      }
      tablinks = document.getElementsByClassName("tablinks");
      for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
      }
      document.getElementById(index).style.display = "block";
      evt.currentTarget.className += " active";
    }
    document.getElementById("defaultOpen").click();
  </script>

  <script>
    function openMenu(evt, menu,nomor) {
      var i, tabmenucontent, tabmenulinks;
      tabmenucontent = document.getElementsByClassName("tabmenucontent");
      for (i = 0; i < tabmenucontent.length; i++) {
        tabmenucontent[i].style.display = "none";
      }
      tabmenulinks = document.getElementsByClassName("tabmenulinks");
      for (i = 0; i < tabmenulinks.length; i++) {
        tabmenulinks[i].className = tabmenulinks[i].className.replace(" active", "");
      }
      document.getElementById(menu).style.display = "block";
      evt.currentTarget.className += " active";
      CreateTableFromJSON(menu,nomor);
    }
    //document.getElementById("defaultOpenmenu").click();
  </script>
  <script async defer
  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiR44OZuZJXCsWOdazQpoVyetbaFt23a4&callback=initMap">
</script>
</body>
</html> 