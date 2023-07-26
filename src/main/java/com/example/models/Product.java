package com.example.models;

import java.math.BigDecimal;

public class Product {

    private Integer id;

    private String name;
    private BigDecimal price;
    private Integer rate;
    private String image;

    private Integer stock;

    private String category;

    public Product(String name, BigDecimal price, Integer rate, String image, Integer stock, String category) {
        this.name = name;
        this.price = price;
        this.rate = rate;
        this.image = image;
        this.stock = stock;
        this.category = category;
    }

    public Product(String name, String image, Integer price) {
        this.name = name;
        this.image = image;
        this.price = BigDecimal.valueOf(price);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public Integer getStock(){
        return stock;
    }

    public void setStock(Integer stock){this.stock = stock;}

    public void setCategory(String category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getRate() {
        return rate;
    }

    public void setRate(Integer rate) {
        this.rate = rate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}
