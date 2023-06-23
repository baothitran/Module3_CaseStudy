package com.cg.case_m3.model;

import com.cg.case_m3.utils.CurrencyFormat;

public class CartItem {
     private   Product product;
     private  int quantity;
     private long price;
     private int color;
     private  int memory;
     private  String memoryName;
     private String colorName;
     private long totalCartItem;

     private Color objColor;
     private Memory objMemory;


     public Color getObjColor() {
         return objColor;
     }

     public void setObjColor(Color objColor) {
         this.objColor = objColor;
     }

     public Memory getObjMemory() {
         return objMemory;
     }

     public void setObjMemory(Memory objMemory) {
         this.objMemory = objMemory;
     }

     public CartItem() {
        }

     public CartItem(Product product, int quantity, long price) {
         this.product = product;
         this.quantity = quantity;
         this.price = price;
     }

     public CartItem(Product product, int quantity, long price, int color, int memory) {
         this.product = product;
         this.quantity = quantity;
         this.price = price;
         this.color = color;
         this.memory = memory;
     }

     public CartItem(Product product, int quantity, long price, int color, int memory, String memoryName, String colorName,long totalCartItem) {
         this.product = product;
         this.quantity = quantity;
         this.price = price;
         this.color = color;
         this.memory = memory;
         this.memoryName = memoryName;
         this.colorName = colorName;
         this.totalCartItem = totalCartItem;
     }

     public void updateTotalItem() {
         long totalAmount = 0;
         if (this.getQuantity() != 0) {
             totalAmount = this.getQuantity() * this.getPrice();
         }
         this.setTotalCartItem(totalAmount);
     }

     public long getTotalCartItem() {
         return totalCartItem;
     }

     public void setTotalCartItem(long totalCartItem) {
         this.totalCartItem = totalCartItem;
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

     public int getColor() {
         return color;
     }

     public void setColor(int color) {
         this.color = color;
     }

     public int getMemory() {
         return memory;
     }

     public void setMemory(int memory) {
         this.memory = memory;
     }

     public Product getProduct() {
         return product;
     }

     public void setProduct(Product product) {
         this.product = product;
     }

     public int getQuantity() {
         return quantity;
     }

     public void setQuantity(int quantity) {
         this.quantity = quantity;
     }

     public long getPrice() {
         return price;
     }

     public void setPrice(long price) {
         this.price = price;
     }
    public String getPriceFormat(long price) {
        return CurrencyFormat.covertPriceToString(price);
    }
}


