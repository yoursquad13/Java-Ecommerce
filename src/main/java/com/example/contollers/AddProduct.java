package com.example.contollers;

import com.example.models.DbManager;
import com.example.models.Product;
import com.example.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.time.Instant;

@MultipartConfig
@WebServlet(name ="AddProduct",urlPatterns = "/admin/addProduct")
public class AddProduct extends HttpServlet {

    private DbManager dbManager = new DbManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null || user.getRole().equals("USER")) {
            PrintWriter printWriter = resp.getWriter();
            printWriter.println("<html><body>");
            printWriter.println("Access denied !!");
            printWriter.println("</body></html>");
            printWriter.close();
        }
        req.getRequestDispatcher("/addproduct.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part part = req.getPart("file");
        String fileName = part.getSubmittedFileName();
        String path = "images/" + System.currentTimeMillis() + fileName;
        part.write(getServletContext().getRealPath("/") + path);
        String name = req.getParameter("name");
        BigDecimal price = BigDecimal.valueOf(Double.parseDouble(req.getParameter("price")));
        Integer stock = Integer.parseInt(req.getParameter("stock"));
        String category = req.getParameter("category");
        Product product = new Product(name, price, 0, path, stock, category);
        dbManager.addProduct(product);
        resp.sendRedirect("/demo2_war_exploded/admin/product");
    }
}
