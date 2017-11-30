<html>
<head>
  <script type="text/javascript">

        // Wait for the page to load first
        window.onload = function() {

          //Get a reference to the link on the page
          // with an id of "mylink"
          var a = document.getElementById("mylink");

          //Set code to run when the link is clicked
          // by assigning a function to "onclick"
          a.onclick = function() {

            // Your code here...
            var myBooks = [
            {
              "Book ID": "1",
              "Book Name": "Computer Architecture",
              "Category": "Computers",
              "Price": "125.60"
            },
            {
              "Book ID": "2",
              "Book Name": "Asp.Net 4 Blue Book",
              "Category": "Programming",
              "Price": "56.00"
            },
            {
              "Book ID": "3",
              "Book Name": "Popular Science",
              "Category": "Science",
              "Price": "210.40"
            }
            ]

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

            //If you don't want the link to actually 
            // redirect the browser to another page,
            // "google.com" in our example here, then
            // return false at the end of this block.
            // Note that this also prevents event bubbling,
            // which is probably what we want here, but won't 
            // always be the case.
            return false;
          }
        }
      </script>
    </head>
    <body>
      <a id="mylink" href="#">linky</a>
      <div id="showData"></div>        
    </body>
    </html>