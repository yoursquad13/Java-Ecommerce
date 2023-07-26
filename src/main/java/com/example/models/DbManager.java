package com.example.models;

import com.example.utils.EncryptDecrypt;
import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DbManager {
    private final Connection connection;

    public DbManager() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1:3306/ecommerce";
            connection = DriverManager.getConnection(url, "techteam", "123456Aa@");
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void saveUser(User user) {
        PreparedStatement st = null;
        try {
            st = connection.prepareStatement("INSERT INTO user (login, password, image, user_role, fullname, email) VALUES (?, ?, ?, ?, ?, ?)");
            st.setString(1, user.getLogin());
            st.setString(2, user.getPassword());
            st.setString(3, user.getImageUrl());
            st.setString(4, user.getRole());
            st.setString(5, user.getFullname());
            st.setString(6, user.getEmail());
            st.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public User getUser(String login) {
        PreparedStatement st = null;
        try {
            st = connection.prepareStatement("SELECT id, login, password, image, user_role FROM user where login = ?");
            st.setString(1,login);
            ResultSet resultSet = st.executeQuery();
            if (resultSet.next()) {
                User user =  new User(resultSet.getString("login"), resultSet.getString("password"),
                        resultSet.getString("image"), resultSet.getString("user_role"));
                user.setId(resultSet.getInt("id"));
                return user;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean emailCheck(String email) {
        PreparedStatement st = null;
        try {
            st = connection.prepareStatement("SELECT id FROM user where email = ?");
            st.setString(1,email);
            ResultSet resultSet = st.executeQuery();
            if (!resultSet.next()) {
                //Email is alredy taken
                return true;
            } else {
                //email is new
                return false;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addProduct(Product product) {
        PreparedStatement st = null;
        try {
            st = connection.prepareStatement("INSERT INTO product (name_product, price," +
                    "rate, image, stock, category) values (?, ?, ?, ?, ?, ?)");
            st.setString(1, product.getName());
            st.setString(2, String.valueOf(product.getPrice()));
            st.setString(3, String.valueOf(product.getRate()));
            st.setString(4, product.getImage());
            st.setString(5, String.valueOf(product.getStock()));
            st.setString(6, product.getCategory());
            st.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement("SELECT id, name_product, price," +
                    " rate, image, stock, category FROM product");
            ResultSet resultSet = st.executeQuery();
            while (resultSet.next()) {
                Product product = new Product(resultSet.getString("name_product"),
                        BigDecimal.valueOf(resultSet.getInt("price")),
                        resultSet.getInt("rate"), resultSet.getString("image"),
                        resultSet.getInt("stock"),
                        resultSet.getString("category"));
                product.setId(resultSet.getInt("id"));
                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    public void deleteProduct(String id) {
        PreparedStatement st = null;
        try {
            st = connection.prepareStatement("Delete from product where id = ?");
            st.setInt(1, Integer.parseInt(id));
            st.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void addToCart(Integer product_id, Integer id) {
        try {
            PreparedStatement st1 = connection.prepareStatement("SELECT COUNT(*) as 'num' FROM user_product WHERE user_id = ? AND product_id = ?");
            st1.setInt(1, id);
            st1.setInt(2, product_id);
            ResultSet rs = st1.executeQuery();
            if(rs.next()) {
                if (rs.getInt("num") == 0) {
                    PreparedStatement st = connection.prepareStatement("INSERT INTO user_product (user_id, product_id) VALUES (?, ?)");
                    st.setInt(1, id);
                    st.setInt(2, product_id);
                    st.executeUpdate();
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Integer getNumberOfProductInCart(Integer id) {
        PreparedStatement st = null;
        try {
            st = connection.prepareStatement("SELECT COUNT(*) as 'num' FROM user_product WHERE user_id = ?");
            st.setInt(1, id);
            ResultSet resultSet = st.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("num");
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public User getUserInfo(Integer id) {
        try {
            PreparedStatement st = connection.prepareStatement("SELECT * FROM user WHERE id = ?");
            st.setInt(1, id);
            ResultSet resultSet = st.executeQuery();
            if (resultSet.next()) {
                User user = new User();
                user.setLogin(resultSet.getString("login"));
                user.setId(id);
                user.setImageUrl(resultSet.getString("image"));
                user.setEmail(resultSet.getString("email"));
                user.setFullname(resultSet.getString("fullname"));
                user.setGender(resultSet.getString("gender"));
                user.setAddress(resultSet.getString("address"));
                user.setPhone(resultSet.getString("phone"));
                return user;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public void updateUser(Integer id, String address, String phone, String email, String gender, String fullname, String path) {
        try {
            PreparedStatement st = connection.prepareStatement("UPDATE user Set address = ?, phone = ?, email = ?, gender = ?, fullname = ?, image = ? where id = ?");
            st.setString(1, address);
            st.setString(2, phone);
            st.setString(3, email);
            st.setString(4, gender);
            st.setString(5, fullname);
            st.setString(6, path);
            st.setInt(7, id);
            st.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void updateUser(Integer id, String address, String phone, String email, String gender, String fullname, String password, String path) {
        try {
            PreparedStatement st = connection.prepareStatement("UPDATE user Set address = ?, phone = ?, email = ?, gender = ?, fullname = ?, password = ?,image = ?  where id = ?");
            st.setString(1, address);
            st.setString(2, phone);
            st.setString(3, email);
            st.setString(4, gender);
            st.setString(5, fullname);
            st.setString(6, EncryptDecrypt.encrypt(password));
            st.setString(7, path);
            st.setInt(8, id);
            st.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Product> getProducts(Integer id) {
        try {
            List<Product> productList = new ArrayList<>();
            PreparedStatement st = connection.prepareStatement("SELECT p.name_product as 'p_name', p.image as 'p_image', p.price as 'p_price'" +
                    "FROM user_product u JOIN product p ON u.product_id = p.id WHERE u.user_id = ?");
            st.setInt(1, id);
            ResultSet resultSet = st.executeQuery();
            while (resultSet.next()) {
                Product product = new Product(resultSet.getString("p_name"), resultSet.getString("p_image"), resultSet.getInt("p_price"));
                productList.add(product);
            }
            return productList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void removeProduct(Integer id) {
        try {
            PreparedStatement st = connection.prepareStatement("DELETE FROM user_product WHERE user_id = ?");
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void confirmProduct(Integer id) {
        try {
            // Insert order
            PreparedStatement st1 = connection.prepareStatement("INSERT INTO orders (product, user_id) SELECT product_id, user_id FROM user_product WHERE user_id = ?");
            st1.setInt(1, id);
            st1.executeUpdate();

            // Delete user_product
            PreparedStatement st2 = connection.prepareStatement("DELETE FROM user_product WHERE user_id = ?");
            st2.setInt(1, id);
            st2.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public List<UsersCarts> getAllOrders() {
        try {
            List<UsersCarts> orderList = new ArrayList<>();
            PreparedStatement st = connection.prepareStatement("SELECT u.login as 'login', p.image as 'image', p.name_product as 'name', p.price as 'price', up.date as 'date' FROM " +
                    "orders up JOIN user u ON up.user_id=u.id JOIN product p ON up.product=p.id");
            ResultSet resultSet = st.executeQuery();
            while (resultSet.next()) {
                orderList.add(new UsersCarts(resultSet.getString("login"), resultSet.getString("date"), resultSet.getString("name"), resultSet.getBigDecimal("price")));
            }
            return orderList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }




    public void updateProduct(Integer id, String name, Integer price, String category, Integer stock) {
        PreparedStatement st = null;
        try {
            st = connection.prepareStatement("UPDATE product SET name_product = ?, price = ?, category = ?, stock = ? where id = ?");
            st.setString(1, name);
            st.setInt(2, price);
            st.setString(3, category);
            st.setInt(4, stock);
            st.setInt(5, id);
            st.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public List<User> getAllUsers() {
        try {
            List<User> users = new ArrayList<>();
            PreparedStatement st = connection.prepareStatement("SELECT fullname, login, email, image FROM user");
            ResultSet resultSet = st.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setEmail(resultSet.getString("email"));
                user.setFullname(resultSet.getString("fullname"));
                user.setLogin(resultSet.getString("login"));
                user.setImageUrl(resultSet.getString("image"));
                users.add(user);
            }
            return users;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
