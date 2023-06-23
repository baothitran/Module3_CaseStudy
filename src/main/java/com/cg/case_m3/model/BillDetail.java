package com.cg.case_m3.model;

import com.cg.case_m3.utils.CurrencyFormat;

public class BillDetail {
    private int detailId;
    private int billId;
    private int productId;
    private int quantity;
    private int color;
    private Long price;
    private int memory;
    private Long total;
    private Product product;



    private String colorName;


    public BillDetail(int detailId, int billId, int productId, int quantity, int color, Long price, int memory, Long total) {
        this.detailId = detailId;
        this.productId = productId;
        this.quantity = quantity;
        this.color = color;
        this.price = price;
        this.memory = memory;
        this.total = total;
        this.billId = billId;
    }

    public BillDetail(int detailId, Product product, int quantity, Long price, Long total, int billId) {
        this.detailId = detailId;
        this.billId = billId;
        this.quantity = quantity;
        this.price = price;
        this.total = total;
        this.product = product;
    }

    public BillDetail(int productId, int quantity, int color, Long price, int memory, Long total, Product product) {
        this.productId = productId;
        this.quantity = quantity;
        this.color = color;
        this.price = price;
        this.memory = memory;
        this.total = total;
        this.product = product;
    }



//detail_id, Product product, int quantity, String size, String color, Long price


    public BillDetail(int detailId, int quantity, int color, Long price, Product product) {

    }

    public BillDetail() {
    }
//detail_id, Product product, int quantity, String size, String color, Long price


    public BillDetail(int color , int quantity ,  Long price,int detailId, Product product) {
        this.detailId = detailId;
        this.quantity = quantity;
        this.color = color;
        this.price = price;
        this.product = product;
    }

    public BillDetail(int color , int quantity ,  Long price,int detailId, Product product, String colorName) {
        this.detailId = detailId;
        this.quantity = quantity;
        this.color = color;
        this.price = price;
        this.product = product;
        this.colorName = colorName;
    }

    public int getMemory() {
        return memory;
    }

    public void setMemory(int memory) {
        this.memory = memory;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getDetailId() {
        return detailId;
    }

    public void setDetailId(int detailId) {
        this.detailId = detailId;
    }

    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


    public int getColor() {
        return color;
    }

    public void setColor(int color) {
        this.color = color;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getBillDetailPrice(long total) {
        String priceNew = CurrencyFormat.covertPriceToString(total);
        return priceNew;
    }

    public String getColorName() {
        return colorName;
    }

    public void setColorName(String colorName) {
        this.colorName = colorName;
    }
}

