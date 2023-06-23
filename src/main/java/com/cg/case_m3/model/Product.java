package com.cg.case_m3.model;

import com.cg.case_m3.utils.CurrencyFormat;

import java.util.ArrayList;
import java.util.List;

public class Product {
    private int productId;
    private String productName;
    private int quantity;
    private long productPrice;

    private Category category;
    private int categoryId;
    private int brandId;
    private int memoryId;
    private int colorId;

    private String memoryName;
    private String colorName;
    private String brandName;
    private String categoryName;
    private String productDescribe;
    private String productImg;

//    private Brand brand;
//    private Category category;
//    private Color color;
//    private Memory memory;
//    private ListAvatar listAvatar;
    private boolean delete;

    public Product() {
    }

    public Product(String productName, String colorName,String memoryName) {
        this.productName = productName;
        this.colorName = colorName;
        this.memoryName = memoryName;
    }

    public Product(int productId, String productName, int quantity, long productPrice, int categoryId, int brandId, int memoryId, int colorId, String productDescribe, String productImg, boolean delete) {
        this.productId = productId;
        this.productName = productName;
        this.quantity = quantity;
        this.productPrice = productPrice;
        this.categoryId = categoryId;
        this.brandId = brandId;
        this.memoryId = memoryId;
        this.colorId = colorId;
        this.productDescribe = productDescribe;
        this.productImg = productImg;
        this.delete = delete;
    }

    public Product(int productId, String productName, int quantity, long productPrice, String memoryName, String colorName, String brandName, String categoryName, String productDescribe, String productImg) {
        this.productId = productId;
        this.productName = productName;
        this.quantity = quantity;
        this.productPrice = productPrice;
        this.memoryName = memoryName;
        this.colorName = colorName;
        this.brandName = brandName;
        this.categoryName = categoryName;
        this.productDescribe = productDescribe;
        this.productImg = productImg;

    }

    public Product(int productId, String productName, int quantity, Long productPrice, Category category, String productDescribe, String productImg) {
        this.productId = productId;
        this.productName = productName;
        this.quantity = quantity;
        this.productPrice = productPrice;
        this.category = category;
        this.productDescribe = productDescribe;
        this.productImg = productImg;
    }

    public Product(int productId, String productName, int quantity, Long productPrice, String productDescribe, String productImg) {
        this.productId = productId;
        this.productName = productName;
        this.quantity = quantity;
        this.productPrice = productPrice;
        this.productDescribe = productDescribe;
        this.productImg = productImg;
    }

    public Product(Category category, int productId, String productName, int quantity, Long productPrice, String productDescribe, String productImg) {
        this.category = category;
        this.productId = productId;
        this.productName = productName;
        this.quantity = quantity;
        this.productPrice = productPrice;
        this.productDescribe = productDescribe;
        this.productImg = productImg;
    }
    public Product(Category category, int productId, String productName, int quantity, long productPrice, int colorId, String productDescribe, String productImg) {
        this.category = category;
        this.productId = productId;
        this.productName = productName;
        this.quantity = quantity;
        this.productPrice = productPrice;
        this.colorId = colorId;
        this.productDescribe = productDescribe;
        this.productImg = productImg;
    }

    public Product( String productImg, int productId, String productName ) {
        this.productId = productId;
        this.productName = productName;
        this.productImg = productImg;
    }



    public Product(int productId, String productName, int quantity, long productPrice, int categoryId, int brandId, int memoryId, int colorId, String productDescribe, String productImg) {
        this.productId = productId;
        this.productName = productName;
        this.quantity = quantity;
        this.productPrice = productPrice;
        this.categoryId = categoryId;
        this.brandId = brandId;
        this.memoryId = memoryId;
        this.colorId = colorId;
        this.productDescribe = productDescribe;
        this.productImg = productImg;
    }

    public Product(String productName, long productPrice, int categoryId, int brandId, int memoryId, int colorId, int quantity, String productImg, String productDescribe) {
        this.productName = productName;
        this.productPrice = productPrice;
        this.categoryId = categoryId;
        this.brandId = brandId;
        this.memoryId = memoryId;
        this.colorId = colorId;
        this.quantity = quantity;
        this.productImg = productImg;
        this.productDescribe = productDescribe;
    }

    public String getMemoryName() {
        return memoryName;
    }

    public void setMemoryName(String memoryName) {
        this.memoryName = memoryName;
    }

    public String getColorName() {
        return colorName;
    }

    public void setColorName(String colorName) {
        this.colorName = colorName;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public boolean isDelete() {
        return delete;
    }

    public void setDelete(boolean delete) {
        this.delete = delete;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Long getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Long productPrice) {
        this.productPrice = productPrice;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public int getMemoryId() {
        return memoryId;
    }

    public void setMemoryId(int memoryId) {
        this.memoryId = memoryId;
    }

    public int getColorId() {
        return colorId;
    }

    public void setColorId(int colorId) {
        this.colorId = colorId;
    }

    public String getProductDescribe() {
        return productDescribe;
    }

    public void setProductDescribe(String productDescribe) {
        this.productDescribe = productDescribe;
    }

    public String getProduct_Price(long price) {
        String priceNew = CurrencyFormat.covertPriceToString(price);
        return priceNew;
    }
}
