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
import java.util.List;

@WebServlet(name ="Home",urlPatterns = "")
public class Home extends HttpServlet {

    private DbManager dbManager = new DbManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> productList = dbManager.getAllProducts();
        req.setAttribute("products", productList);
        User user = (User) req.getSession().getAttribute("user");
        if (user != null) {
            req.setAttribute("logged", true);
            Integer numberOfProduct = dbManager.getNumberOfProductInCart(user.getId());
            req.setAttribute("num", numberOfProduct);
            user = dbManager.getUserInfo(user.getId());
            req.setAttribute("user_edit", user);
        }else {
            req.setAttribute("logged", false);
        }
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
