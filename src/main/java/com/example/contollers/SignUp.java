package com.example.contollers;

import com.example.models.DbManager;
import com.example.models.User;
import com.example.utils.EncryptDecrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

@MultipartConfig
@WebServlet(name ="SignUp",urlPatterns = "/signup")
public class SignUp extends HttpServlet {
    private DbManager dbManager = new DbManager();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part part = req.getPart("file");
        InputStream inputStream = part.getInputStream();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = inputStream.read(buffer)) != -1){
            outputStream.write(buffer, 0, bytesRead);
        }
        byte[] imageData = outputStream.toByteArray();

        outputStream.close();
        inputStream.close();
        String fileName = part.getSubmittedFileName();
        String path = "images/" + System.currentTimeMillis() + fileName;
        part.write(getServletContext().getRealPath("/") + path);
        String login = req.getParameter("login");
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String password = EncryptDecrypt.encrypt(req.getParameter("password"));
        if (login == null || fullname == null || email == null) {
            resp.sendRedirect("/demo2_war_exploded/login?msg=Enter all the fields for sign up&type=error");
        } else {
            User userl = dbManager.getUser(login);
            if (userl != null) {
                resp.sendRedirect("/demo2_war_exploded/login?msg=Username already taken, Try another one&type=error");
            } else if (!(dbManager.emailCheck(email))) {
                resp.sendRedirect("/demo2_war_exploded/login?msg=Email Address already in use&type=error");
            } else {
                User user = new User(login, password, path, "USER");
                user.setFullname(fullname);
                user.setEmail(email);
                dbManager.saveUser(user);
                resp.sendRedirect("/demo2_war_exploded/login?msg=Account Created Successfully! Login Now&type=success");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }
}
