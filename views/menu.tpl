<!DOCTYPE html>

<html>
<head>
  <title>Menu</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css">

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

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
  <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:10%">
    <h3 class="w3-bar-item">Index</h3>
    <a href="/main" class="w3-bar-item w3-button">Home</a>
    <a href="#" class="w3-bar-item w3-button">Menu</a>
    <a href="#" class="w3-bar-item w3-button">Link 3</a>
  </div>
  <div id="showData" style="margin-left:15%"></div>
  <p id="demo"></p>
  <script>
    function CreateTableFromJSON() {
      var menuK = {{.jsonm}}
      document.getElementById("demo").innerHTML = "";
        // EXTRACT VALUE FOR HTML HEADER. 
        // ('Book ID', 'Book Name', 'Category' and 'Price')
        var col = [];
        for (var i = 0; i < menuK.length; i++) {
          for (var key in menuK[i]) {
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
        for (var i = 0; i < menuK.length; i++) {

          tr = table.insertRow(-1);

          for (var j = 0; j < col.length; j++) {
            var tabCell = tr.insertCell(-1);
            tabCell.innerHTML = menuK[i][col[j]];
          }
        }

        // FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
        var divContainer = document.getElementById("showData");
        divContainer.innerHTML = "";
        divContainer.appendChild(table);
      }
    </script>
  </body>
  </html>