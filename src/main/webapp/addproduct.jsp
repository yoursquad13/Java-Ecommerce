<%--
  Created by IntelliJ IDEA.
  User: popic
  Date: 05.05.2023
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SareeNepal - Admin Add Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
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


        form {
            margin: 0 auto;
            width: 400px;
        }

        label {
            display: inline-block;
            margin-bottom: 10px;
            width: 100%;
        }

        input[type=text], input[type=number] {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        input[type=submit]:hover {
            background-color: #45a049;
        }

        input[type=file] {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<nav>
    <ul>
        <li><a href=".">Home</a></li>
        <li><a href="./product" class="btn">All Products</a></li>
        <li><a href="./addProduct" class="btn">Add Product</a></li>
        <li><a href="./usersOrder" class="btn">Users Orders</a></li>
        <li><a href="./listUsers" class="btn">List of Users</a></li>
        <li style="float:right"><a href="./logout">Logout</a></li>
    </ul>
</nav>
<h1>Add Product</h1>
<form action="addProduct" method="post" enctype='multipart/form-data'>
    <label>Name:</label>
    <input type="text" name="name"/>
    <label>Price:</label>
    <input type="number" name="price"/>
    <label>Stock:</label>
    <input type="text" name="stock"/>
    <label>Category:</label>
    <input type="text" name="category"/>
    <label>Image:</label>
    <input type="file" name="file" alt="image">
    <input type="submit" value="Add Product">
</form>
</body>
</html>
