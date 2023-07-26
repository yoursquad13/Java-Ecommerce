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
import java.util.Optional;

@WebServlet(name ="EditProduct",urlPatterns = "/admin/editProduct")
public class EditProduct extends HttpServlet {

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
        Integer id = Integer.valueOf(req.getParameter("id"));
        Product product = dbManager.getAllProducts().stream().filter(p -> p.getId().equals(id)).findFirst().get();
        req.setAttribute("product", product);
        req.getRequestDispatcher("/editproduct.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.valueOf(req.getParameter("id"));
        String name = req.getParameter("name");
        Integer price = Integer.valueOf(req.getParameter("price"));
        String category = req.getParameter("category");
        Integer stock = Integer.valueOf(req.getParameter("stock"));
        dbManager.updateProduct(id, name, price, category, stock);
        resp.sendRedirect("/demo2_war_exploded/admin/product");
    }
}

