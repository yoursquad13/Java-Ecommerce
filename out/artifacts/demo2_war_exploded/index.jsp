<%@ page import="com.example.models.Product" %>
<%@ page import="com.example.models.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        .slide {
            width: 100%;
            height: 550px;
            max-width: 1440px;
            background-size: cover;
            background-position: center center;
            animation: changeBg 9s infinite;
            margin: auto;
        }
        @keyframes changeBg {
            0% {
                background-image: url(images/image1.jpg);
            }
            33.33% {
                background-image: url(images/image2.jpg);
            }
            66.66% {
                background-image: url(images/image3.jpg);
            }
            100% {
                background-image: url(images/image1.jpg);
            }
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
                <li><a href="#products">Products</a></li>
                <% if(logged) { %><li><a href="myprofile">Account</a></li><% } %>
                <% if (logged && user.getLogin() != null && user.getLogin().equals("admin")) { %>
                <li> <a href="admin">ADMIN PANEL</a></li>
                    <% } %>
                <li><%= logged ? "<a href=\"logout\">Logout</a>" : "<a href=\"login\">Login</a>"%></li>
            </ul>
        </nav>
        <a href="<%= logged ? "mycard" : "login"%>"><img src="https://i.ibb.co/PNjjx3y/cart.png" alt="" width="30px" height="30px" /><%= logged ? "<b style=\"border-radius: 50%;background: red;padding: 1px 5px;font-size: 11px;color: #fff;position: relative;right: 10px;\">"+numberOfProductCart+"</b>" : ""%></a>
        <img src="images/cart.png" alt="" class="menu-icon" onclick="menutoggle()" />
    </div>
</div>

<div class="slide">
    <div style="text-align: center;position: relative;background: linear-gradient(358deg, black, transparent);height: 550px;padding-top: 10%;color: white;text-shadow:5px 5px 7px #000">
        <h1 style="font-size: 70px;">SareeNepal</h1>
        <p style="max-width: 70%;margin: auto;color: #fff;font-size: 23px">Saree Nepal offers elegant sarees showcasing Nepali culture. Our artisans use traditional techniques to create unique designs, adding grace to any occasion. Experience Nepali culture with Saree Nepal. Explore our products below.</p>
    </div>
</div>

<div class="small-container" id="products">
    <div class="row row-2">
        <h2>All Products</h2>
        <input type="text" id="search-box" placeholder="Search for product.." style="height: 38px;width: 300px;padding: 10px;border: solid 1px black;border-radius:5px" >
    </div>
    <div class="row" id="elements-container">

<br>
        <%----%>
        <%
            ArrayList<Product> car = (ArrayList<Product>)request.getAttribute("products");
            for(Product s: car){
        %>


        <div id="<%=s.getId()%>" class="col-4">
            <img src="<%=s.getImage()%>" alt="" />
            <h4><%=s.getName()%></h4>
            <p>रु‎. <%=s.getPrice()%></p>
            <p style="font-size: 12px" class="cat"><%=s.getCategory()%></p>
            <p style="font-size: 11px;color:<%= s.getStock()<1 ? "red" : "green"%>" class="cat">In Stock: <%=s.getStock()%> PCS</p>
            <a href="<%= logged ? "addtocart?id=" + s.getId() : "login"%>"><button class="anishbtn"><%= s.getStock()<1 ? "Out of Stock" : "Add to Cart"%></button></a>
        </div>
        <%}
            car.clear();%>

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
    var MenuItems = document.getElementById('MenuItems');
    MenuItems.style.maxHeight = '0px';

    function menutoggle() {
        if (MenuItems.style.maxHeight == '0px') {
            MenuItems.style.maxHeight = '200px';
        } else {
            MenuItems.style.maxHeight = '0px';
        }
    }

</script>
<script>
    const searchBox = document.getElementById('search-box');
    const elementsContainer = document.getElementById('elements-container');
    const elements = elementsContainer.getElementsByTagName('div');

    searchBox.addEventListener('input', () => {
        const searchTerm = searchBox.value.toLowerCase();
        for (let i = 0; i < elements.length; i++) {
            const element = elements[i];
            const text = element.innerText.toLowerCase();
            if (text.includes(searchTerm)) {
                element.style.display = 'block';
            } else {
                element.style.display = 'none';
            }
        }
    });
</script>
</body>
</html>
