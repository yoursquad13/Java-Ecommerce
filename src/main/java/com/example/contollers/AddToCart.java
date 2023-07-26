package com.example.contollers;

import com.example.models.DbManager;
import com.example.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name ="AddToCart",urlPatterns = "/addtocart")
public class AddToCart extends HttpServlet {

    private DbManager dbManager = new DbManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        User user = (User) req.getSession().getAttribute("user");
        dbManager.addToCart(Integer.parseInt(id), user.getId());
        resp.sendRedirect("/demo2_war_exploded");
    }
}
