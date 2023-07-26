<%@ page import="com.example.models.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SareeNepal - Admin Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F5F5F5;
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


        table {
            border-collapse: collapse;
            width: 80%;
            margin: 0 auto;
            background-color: white;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        img{
            height: 80px;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #000000;
            color: white;
            position: sticky;
            top: 0;
            z-index: 1;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        a {
            text-decoration: none;
            color: #000000;
        }
        .add-product-btn {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #000000;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s ease;
        }
        .add-product-btn:hover {
            background-color: #00995c;
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
        <li style="float:right"><a href="./logout">Logout</a></li>
    </ul>
</nav>
<h1>Products</h1>
<a href="./addProduct" class="add-product-btn">Add Product</a>
<table>
    <tr>
        <th>Id</th>
        <th>Category</th>
        <th>Rate</th>
        <th>Image</th>
        <th>Price</th>
        <th>Name</th>
        <th>Stock</th>
        <th>Actions</th>
    </tr>
    <% ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products"); %>
    <% for (Product product : products) { %>
    <tr>
        <td><%= product.getId() %></td>
        <td><%= product.getCategory() %></td>
        <td><%= product.getRate() %></td>
        <td><img src="../<%= product.getImage() %>"></td>
        <td><%= product.getPrice() %></td>
        <td><%= product.getName() %></td>
        <td><%= product.getStock() %></td>
        <td>
            <a href="deleteProduct?id=<%= product.getId() %>">Remove</a>
            <a href="editProduct?id=<%= product.getId() %>">Update</a>
        </td>
    </tr>
    <% } %>
</table>
</body>
</html>
