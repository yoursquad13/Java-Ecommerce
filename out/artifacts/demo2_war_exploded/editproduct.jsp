<%@ page import="com.example.models.Product" %><%--
  Created by IntelliJ IDEA.
  User: popic
  Date: 06.05.2023
  Time: 7:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f2f2f2;
            border-radius: 5px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: none;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #3e8e41;
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
<%
    Product product = (Product)request.getAttribute("product");
%>
<form action="editProduct" method="post">
    <label>Name</label>
    <input type="hidden" name="id" value=<%=product.getId()%>>
    <input type="text" name="name" value=<%=product.getName()%>>
    <label>Price</label>
    <input type="number" name="price" value=<%=product.getPrice()%>>
    <label>Stock</label>
    <input type="number" name="stock" value=<%=product.getStock()%>>
    <label>Category</label>
    <input type="text" name="category" value="<%=product.getCategory()%>">
    <input type="submit">
</form>
</body>
</html>
