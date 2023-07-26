<%@ page import="com.example.models.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.contollers.UsersOrder" %>
<%@ page import="com.example.models.UsersCarts" %><%--
  Created by IntelliJ IDEA.
  User: popic
  Date: 05.05.2023
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>SareeNepal - Admin Orders</title>
  <style>
    body {
      font-family: Arial, sans-serif;
    }
    .navbar {
      background-color: #333;
      overflow: hidden;
    }

    .navbar a {
      float: left;
      color: white;
      text-align: center;
      padding: 14px 16px;
      text-decoration: none;
    }

    .navbar a:hover {
      background-color: #ddd;
      color: black;
    }
    table {
      border-collapse: collapse;
      margin: 0 auto;
      width: 80%;
    }
    th, td {
      border: 1px solid black;
      padding: 8px;
      text-align: left;
    }
    th {
      background-color: #00FF7F;
      color: white;
    }
  </style>
</head>
<body style="padding-top: 75px;">
<div class="navbar">
  <a href="./">Home</a>
  <a href="./product" class="btn">All Products</a>
  <a href="./addProduct" class="btn">Add Product</a>
  <a href="./usersOrder" class="btn">Users Orders</a>
  <a href="./listUsers" class="btn">List of Users</a>
  <a href="./logout">Logout</a>
</div>
<table>
  <tr>
    <th>ID</th>
    <th>Username</th>
    <th>Product Name</th>
    <th>Price</th>
  </tr>
  <%----%>
  <%
    ArrayList<UsersCarts> usersCarts = (ArrayList<UsersCarts>)request.getAttribute("orders");
    int id = 1; // initialize id to 1
    for(UsersCarts u: usersCarts){
  %>
  <tr>
    <td><%= id++ %></td> <!-- display the id number and increment it -->
    <td><%=u.getLogin()%></td>
    <td><%=u.getProductName()%></td>
    <td><%=u.getPrice()%></td>
  </tr>
  <%}%>
</table>
</body>
</html>
