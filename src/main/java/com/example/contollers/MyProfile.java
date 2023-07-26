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
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
@WebServlet(name ="MyProfile",urlPatterns = "/myprofile")
public class MyProfile extends HttpServlet {

    private DbManager dbManager = new DbManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user != null) {
            req.setAttribute("logged", true);
            Integer numberOfProduct = dbManager.getNumberOfProductInCart(user.getId());
            req.setAttribute("num", numberOfProduct);

        }else {
            req.setAttribute("logged", false);
        }
        if (user == null) {
            PrintWriter printWriter = resp.getWriter();
            printWriter.println("<html><body>");
            printWriter.println("Please login !!");
            printWriter.println("</body></html>");
            printWriter.close();
        }else {
            user = dbManager.getUserInfo(user.getId());
            req.setAttribute("user_edit", user);
            req.getRequestDispatcher("/profile.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        Part part = req.getPart("file");
        String fileName = part.getSubmittedFileName();
        String path = "images/" + fileName;
        part.write(getServletContext().getRealPath("/") + path);
        String address = req.getParameter("address");
        String fullName = req.getParameter("fullname");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String gender = req.getParameter("gender");
        String password = req.getParameter("password");
        String newPassword = req.getParameter("new_password");
        if (!password.isEmpty() && !newPassword.isEmpty()) {
            if (EncryptDecrypt.encrypt(password).equals(user.getPassword())) {
                dbManager.updateUser(user.getId(), address, phone, email, gender, fullName, newPassword, path);
            }else {
                PrintWriter printWriter = resp.getWriter();
                printWriter.println("<html><body>");
                printWriter.println("Incorrect password");
                printWriter.println("</body></html>");
                printWriter.close();
            }
        }else {
            dbManager.updateUser(user.getId(), address, phone, email, gender, fullName, path);
        }
        resp.sendRedirect("/demo2_war_exploded/myprofile");
    }
}
