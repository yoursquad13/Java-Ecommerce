package com.example.contollers;

import com.example.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;

@WebServlet(name ="Admin",urlPatterns = "/admin")
public class Admin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            PrintWriter printWriter = resp.getWriter();
            printWriter.println("<html><body>");
            printWriter.println("You don't have access to this page");
            printWriter.println("</body></html>");
            printWriter.close();
        }
        if (user.getRole().equals("ADMIN")) {
            req.getRequestDispatcher("/admin.jsp").forward(req, resp);
        }else {
            PrintWriter printWriter = resp.getWriter();
            printWriter.println("<html><body>");
            printWriter.println("You don't have access to this page");
            printWriter.println("</body></html>");
            printWriter.close();
        }
    }
}
