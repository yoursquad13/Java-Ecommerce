package com.example.contollers;

import com.example.models.DbManager;
import com.example.models.User;
import com.example.utils.EncryptDecrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name ="Login",urlPatterns = "/login")
public class Login extends HttpServlet {
    private DbManager dbManager = new DbManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        User user = dbManager.getUser(login);
        if (user == null) {
            resp.sendRedirect("/demo2_war_exploded/login?msg=Incorrect Username! Try Again&type=error");
        }else {
            if (EncryptDecrypt.encrypt(password).equals(user.getPassword())) {
                session.setAttribute("user", user);
                resp.sendRedirect("/demo2_war_exploded");
            }else {
                resp.sendRedirect("/demo2_war_exploded/login?msg=Incorrect Password! Try Again&type=error");
            }

        }
    }
}
