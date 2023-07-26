<%--
  Created by IntelliJ IDEA.
  User: popic
  Date: 05.05.2023
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SareeNepal - Admin Panel</title>
    <style>
        body {
            margin: 0;
            padding: 0;
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

        h1 {
            margin-top: 50px;
            text-align: center;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .btn {
            padding: 10px;
            border-radius: 5px;
            border: none;
            background-color: #333;
            color: white;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #555;
        }
    </style>
</head>
<body style="padding-top: 75px;">
<div class="navbar">
    <a href="./">Home</a>
    <a href="./logout">Logout</a>
</div>

<h1>SareeNepal Admin Panel</h1>

<div class="container">
    <div class="btn-group">
        <a href="admin/product" class="btn">All Products</a>
        <a href="admin/addProduct" class="btn">Add Product</a>
        <a href="admin/usersOrder" class="btn">Users Orders</a>
        <a href="admin/listUsers" class="btn">List of Users</a>
    </div>
</div>
</body>
</html>
