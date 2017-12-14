<!DOCTYPE html>

<html>
<head>
  <title>Menu</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
</style>
</head>
<body>
  <script>
    var count=0;

    function addinput(){
      count++;
      var add=document.getElementById('container');
      var data1='</br>Menu</br><input name=menu';
      var data=count;
      var data2=' id=menu';
      var data3=' type="text" placeholder="ex. Masakan Baru"></br>'
      var data4='Harga (Rp.)</br><input name=harga';
      var data5=' id=harga';
      var data6=' type="number" placeholder="ex. 15000"></br>'

      var sum=data1+data+data2+data+data3+data4+data+data5+data+data6;
      add.insertAdjacentHTML("beforeend",sum)

      document.getElementById("count").value=count;
    }

    function deleteinput(){
      var idm="menu"+count;
      var idh="harga"+count;
      var parent = document.getElementById("container");
      var childm = document.getElementById(idm);
      var childh = document.getElementById(idh);
      parent.removeChild(childm);
      parent.removeChild(childh);
      count--;
    }
  </script>
  <form method="POST" action="">
    <div id="container">
      <input type=button onclick="addinput()" value="+">
      <input type="hidden" id="count" name="count" value="" readonly>
      <input type="submit" value="Submit">
    </form>
  </body>
  </html>