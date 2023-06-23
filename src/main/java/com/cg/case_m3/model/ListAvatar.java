package com.cg.case_m3.model;

public class ListAvatar {
    private int id;
    private String productImg;
    private int productId;

    public ListAvatar() {

    }

    public ListAvatar(int id, String productImg, int productId) {
        this.id = id;
        this.productImg = productImg;
        this.productId = productId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }
}
