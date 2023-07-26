<%@ page import="com.example.models.User" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: popic
  Date: 06.05.2023
  Time: 7:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SareeNepal - Admin List Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            text-align: center;
        }
        table {
            border-collapse: collapse;
            width: 80%;
            margin: auto;
            margin-top: 50px;
            margin-bottom: 50px;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }

        nav {
            background-color: #333;
            overflow: hidden;
            position: fixed;
            top: 0;
            width: 100%;
        }

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        nav li {
            float: left;
        }

        nav li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        nav li a:hover {
            background-color: #ddd;
            color: black;
        }

        nav li a.active {
            background-color: #4CAF50;
            color: white;
        }

        nav li a.btn {
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
        }

        nav li a.btn:hover {
            background-color: #3e8e41;
            color: white;
        }


        th {
            background-color: #00FF7F;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        img {
            width: 50px;
            height: 50px;
            object-fit: cover;
        }
    </style>
</head>
<body style="padding-top: 75px;">
<nav>
    <ul>
        <li><a href=".">Home</a></li>
        <li><a href="./product" class="btn">All Products</a></li>
        <li><a href="./addProduct" class="btn">Add Product</a></li>
        <li><a href="./usersOrder" class="btn">Users Orders</a></li>
        <li><a href="./listUsers" class="btn">List of Users</a></li>
        <li><a href="./logout">Logout</a></li>
    </ul>
</nav>
<h1>List Users</h1>
<table border ="1">
    <tr>
        <th>Image URL</th>
        <th>Login</th>
        <th>Full Name</th>
        <th>Email</th>
    </tr>
    <% ArrayList<User> users = (ArrayList<User>)request.getAttribute("users");
        for(User s: users){ %>
    <tr>
        <td><img src="../<%=s.getImageUrl()%>"></td>
        <td><%=s.getLogin()%></td>
        <td><%=s.getFullname()%></td>
        <td><%=s.getEmail()%></td>
    </tr>
    <% } %>
</table>
</body>
</html>
