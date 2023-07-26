package com.example.models;

import java.math.BigDecimal;

public class UsersCarts {

    private String image;
    private String login;
    private String productName;

    private BigDecimal price;

    public UsersCarts(String login, String image, String productName, BigDecimal price) {
        this.login = login;
        this.productName = productName;
        this.price = price;
        this.image = image;
    }
    public String getLogin() {
        return login;
    }
    public void setLogin(String login) {
        this.login = login;
    }
    public String getProductName() {
        return productName;
    }
    public void setProductName(String productName) {
        this.productName = productName;
    }
    public BigDecimal getPrice() {
        return price;
    }
    public String getImage() {return image; }
    public void setImage(String image) {
        this.image = image;
    }
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}
