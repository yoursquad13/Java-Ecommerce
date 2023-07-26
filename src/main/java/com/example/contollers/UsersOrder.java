package com.example.contollers;

import com.example.models.DbManager;
import com.example.models.UsersCarts;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminOrders",urlPatterns = "/admin/usersOrder")
public class UsersOrder extends HttpServlet {

    private DbManager dbManager = new DbManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<UsersCarts> orderList = dbManager.getAllOrders();
        req.setAttribute("orders", orderList);
        req.getRequestDispatcher("/admincart.jsp").forward(req, resp);
    }
}
