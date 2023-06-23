package com.cg.case_m3.model;

import com.cg.case_m3.utils.CurrencyFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class Cart {

    private int cartId;
    private long total;
    private Date creatAt;
    List<CartItem> cartItems;

    public Cart(int cartId, long total, Date creatAt, List<CartItem> cartItems) {
        this.cartId = cartId;
        this.total = total;
        this.creatAt = creatAt;
        this.cartItems = cartItems;
    }

    public Cart() {
    }


    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public Date getCreatAt() {
        return creatAt;
    }

    public void setCreatAt(Date creatAt) {
        this.creatAt = creatAt;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public void updateTotal() {
        long total = 0;
        if (this.getCartItems() != null) {
            for (int i = 0; i < this.getCartItems().size(); i++) {
                total += this.getCartItems().get(i).getQuantity() * this.getCartItems().get(i).getPrice();
            }
        }
        this.setTotal(total);
    }
}
