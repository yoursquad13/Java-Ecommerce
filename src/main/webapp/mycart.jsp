<%@ page import="com.example.models.User" %>
<%@ page import="com.example.models.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
  Created by IntelliJ IDEA.
  User: popic
  Date: 05.05.2023
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%
  boolean logged = (boolean) request.getAttribute("logged");
  Integer numberOfProductCart = (Integer) request.getAttribute("num"); %>
<%
  User user = (User)request.getAttribute("user_edit");
%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>SareeNepal - Homepage</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link
          href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet"
  />
  <link
          rel="stylesheet"
          href="style.css"
  />
  <style>
    form{
      width: 100%;
      max-width: 550px;
    }
    form input{
      height: 40px;
      border-radius: 5px;
    }
    .msg {
      margin-bottom: 10px;
      margin: auto;
      width: 450px;
      top: 10px;
      height: fit-content;
    }
    .msg span{
      padding: 10px;display: block;border-radius: 10px;
    }
    .msg span.error{
      background: #ffc3c3;
      border: solid 1px red;
      color: red;
    }
    .msg span.success{
      background: #d0ffd0;
      border: solid 1px green;
      color: green;
    }
    .small-container{
      min-height: 600px;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="navbar">
    <div class="logo">
      <a href="./"><img src="images/logo-l.png" alt="SareeNepal" width="125px" /></a>
    </div>
    <nav>
      <ul id="MenuItems">
        <li><a href="./">Home</a></li>
        <li><a href="./">Products</a></li>
        <li><% if(logged) { %><a href="myprofile">Account</a><% } %></li>
        <li><% if (logged && user != null && user.getLogin() != null && user.getLogin().equals("admin")) { %>
          <a href="admin">ADMIN PANEL</a>
          <% } %></li>
        <li><%= logged ? "<a href=\"logout\">Logout" : "<a href=\"login\">Login"%></a></li>
      </ul>
    </nav>
    <a href="<%= logged ? "mycard" : "login"%>"><img src="images/cart.png" alt="" width="30px" height="30px" /><%= logged ? "<b style=\"border-radius: 50%;background: red;padding: 1px 5px;font-size: 11px;color: #fff;position: relative;right: 10px;\">"+numberOfProductCart+"</b>" : ""%></a>
    <img src="images/cart.png" alt="" class="menu-icon" onclick="menutoggle()" />
  </div>
</div>

<div class="small-container">
  <div class="msg"></div>
      <%----%>
      <%
        if (logged){
        ArrayList<Product> product = (ArrayList<Product>)request.getAttribute("products");
    if (!product.isEmpty()){
      %>
  <h2>Confirm Purchase</h2>
  <div class="row">
    <table border ="1" width="500" align="center">
      <tr bgcolor="00FF7F">
        <th><b>Image</b></th>
        <th><b>Price</b></th>
        <th><b>Name</b></th>
      </tr>
      <% for(Product s: product){ %>
      <tr>
        <td><img src="<%=s.getImage()%>" alt="" /></td>
        <td>RS. <%=s.getPrice()%></td>
        <td><%=s.getName()%></td>
      </tr>
      <% } %>
    </table>
    <form action="mycard" method="post">
      <h1 id="price"></h1>
      <input type="hidden" value="1" name="do">
      <button class="anishbtn" type="submit">Confirm Order</button>
    </form>
    <form action="mycard" method="post">
      <input type="hidden" value="0" name="do">
      <button class="anishbtn" style="background: red" type="submit">Delete Order</button>
    </form>
      <%}} else {%>
      <div class="msg"><span class="error"><h2>Authorization Failed!</h2><p>You must be logged in to view this page</p></span></div>
    <% } %>


    <br><br><br>
  </div>

</div>

<!-- Footer -->
<div class="footer">
  <div class="container">
    <div class="row">
      <div class="footer-col-1">
        <h3>Download Our App</h3>
        <p>Download ouf App for your mobile phone.</p>
        <div class="app-logo" style="cursor: pointer" onclick="alert('This section is under creation.')">
          <img src="https://i.ibb.co/KbPTYYQ/play-store.png" alt="" />
          <img src="https://i.ibb.co/hVM4X2p/app-store.png" alt="" />
        </div>
      </div>

      <div class="footer-col-2">
        <img src="images/logo.png" alt="" />
        <p>
          Experience the beauty of Nepali culture with Saree Nepal.
        </p>
      </div>

      <div class="footer-col-3">
        <h3>Team Profiles</h3>
        <ul>
          <li><a href="https://www.instagram.com/anishkhatri10/" target="_blank">Anish Khatri</a></li>
          <li><a href="https://www.instagram.com/aliza_ranjitkar/" target="_blank">Aliza Ranjitkar</a></li>
          <li><a href="https://www.instagram.com/anneayh/" target="_blank">Annie Itani</a></li>
          <li><a href="https://www.instagram.com/aanirudra/" target="_blank">Anirudra Shrestha</a></li>
        </ul>
      </div>

      <div class="footer-col-4">
        <h3>Follow us</h3>
        <ul>
          <li><a href="https://www.facebook.com/GreatAnishKhatri/" target="_blank">Facebook</a></li>
          <li><a href="https://twitter.com/_AnishKhatri_" target="_blank">Twitter</a></li>
          <li><a href="https://www.instagram.com/anishkhatri10/" target="_blank">Instagram</a></li>
          <li><a href="https://www.linkedin.com/in/anishkhatri10/" target="_blank">LinkedIn</a></li>
        </ul>
      </div>
    </div>
    <hr />
    <p style="text-align: center">Built by <a href="https://anishkhatri.com/" target="_blank" style="font-weight: 700;color: #b6b6b6;">Anish Khatri</a> and team at Islington College</p>
  </div>
</div>
<script>
    const urlParams = new URLSearchParams(window.location.search);
    const message = urlParams.get('msg');
    const type = urlParams.get('type');
    const msgDiv = document.querySelector('.msg');

    if(message != null) {
    msgDiv.innerHTML = '<span class="' + type + '">' + message + '</span>';
  }


    const table = document.querySelector("table"); // Get the table element
    const rows = table.querySelectorAll("tr"); // Get all the rows of the table
    let sum = 0;
    for (let i = 1; i < rows.length; i++) {
      const cells = rows[i].querySelectorAll("td"); // Get all the cells of the row

      const priceText = cells[1].textContent.replace("RS. ", ""); // Extract the price text and remove the "RS." prefix

      const price = parseInt(priceText); // Convert the price text into an integer

      sum += price; // Add the price to the sum
    }

    document.getElementById("price").innerHTML="Grand Total: RS. "+sum;

</script>
</body>
</html>
