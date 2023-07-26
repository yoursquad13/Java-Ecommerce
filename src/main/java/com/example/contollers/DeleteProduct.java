package com.example.contollers;

import com.example.models.DbManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name ="DeleteProduct",urlPatterns = "/admin/deleteProduct")
public class DeleteProduct extends HttpServlet {

    private DbManager dbManager = new DbManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        dbManager.deleteProduct(id);
        resp.sendRedirect("/demo2_war_exploded/admin/product");
    }
}
