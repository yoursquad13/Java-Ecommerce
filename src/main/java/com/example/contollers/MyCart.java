package com.example.contollers;

import com.example.models.DbManager;
import com.example.models.Product;
import com.example.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;

@WebServlet(name ="MyCart",urlPatterns = "/mycard")
public class MyCart extends HttpServlet {

    private DbManager dbManager = new DbManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");

        if (user != null) {
            req.setAttribute("logged", true);
            Integer numberOfProduct = dbManager.getNumberOfProductInCart(user.getId());
            req.setAttribute("num", numberOfProduct);
            List<Product> productList = dbManager.getProducts(user.getId());
            req.setAttribute("products", productList);
            user = dbManager.getUserInfo(user.getId());
            req.setAttribute("user_edit", user);

        }else {
            req.setAttribute("logged", false);
        }

        req.getRequestDispatcher("/mycart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user != null) {
            List<Product> productList = dbManager.getProducts(user.getId());
            String login = req.getParameter("login");
            String todoString = req.getParameter("do");
            int todo = Integer.parseInt(todoString);
            if (todo == 1){
                dbManager.confirmProduct(user.getId());
                BigDecimal sum = productList.stream()
                    .map(Product::getPrice).reduce(BigDecimal.ZERO, BigDecimal::add);
                resp.sendRedirect("/demo2_war_exploded/mycard?msg=<h2>Order Confirmed!</h2><p>Your order has been confirmed. Total amount to be paid is <b>Rs. "+sum+"</b></p>&type=success");
            } else {
                dbManager.removeProduct(user.getId());
                resp.sendRedirect("/demo2_war_exploded/mycard?msg=<h2>Order Deleted!</h2><p>All products were removed from the cart</p>&type=error");
            }
        }
    }
}
