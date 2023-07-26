package com.example.contollers;


import com.example.models.DbManager;
import com.example.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name ="ListUsers",urlPatterns = "/admin/listUsers")
public class ListUsers extends HttpServlet {

    private DbManager dbManager = new DbManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null || user.getRole().equals("USER")) {
            PrintWriter printWriter = resp.getWriter();
            printWriter.println("<html><body>");
            printWriter.println("Please login !!");
            printWriter.println("</body></html>");
            printWriter.close();
        }
        List<User> users = dbManager.getAllUsers();
        req.setAttribute("users", users);
        req.getRequestDispatcher("/listUsers.jsp").forward(req, resp);
    }
}
