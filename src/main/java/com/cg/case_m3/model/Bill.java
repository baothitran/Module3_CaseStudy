package com.cg.case_m3.model;

import com.cg.case_m3.utils.CurrencyFormat;

import java.util.Date;
import java.util.List;

public class Bill {
    private int billId;
    private int userId;
    private String address;
    private String phone;
    private String email;
    private String payment;
    private Long total;
    private Date createAt;
    User user;

    List<Bill> billItems;


    private BillDetail billDetail;


    public Bill() {
    }

    public Bill(int billId, int userId, String address, String phone, String email, String payment, Long total, Date createAt, User user, BillDetail billDetail) {
        this.billId = billId;
        this.userId = userId;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.payment = payment;
        this.total = total;
        this.createAt = createAt;
        this.user = user;
        this.billDetail = billDetail;
    }

    public Bill(int billId, int userId, String address, String phone, String email, String payment, Long total, Date createAt) {
        this.billId = billId;
        this.userId = userId;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.payment = payment;
        this.total = total;
        this.createAt = createAt;
    }

    public Bill(int billId, Long total, Date createAt) {
        this.billId = billId;
        this.total = total;
        this.createAt = createAt;
    }

    public Bill(int billId, int userId, String address, String phone, String email, String payment, Long total, Date createAt, BillDetail billDetail) {
        this.billId = billId;
        this.userId = userId;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.payment = payment;
        this.total = total;
        this.createAt = createAt;
        this.billDetail = billDetail;
    }

    public Bill(int billId, int userId, Long total, String payment, String address, Date createAt) {
        this.billId = billId;
        this.userId = userId;
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.createAt = createAt;
    }
    //Bill(int, User, Long, String, Date, String)'
    public Bill(int billId, User user, Long total, String payment,  java.sql.Date date,String address) {
        this.billId = billId;
        this.user = user;
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.createAt = date;

    }

    public Bill(int billId, Long total, String payment, String address, Date createAt) {
        this.billId = billId;
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.createAt = createAt;
    }



    public Bill(int billId, User user, String phone , String address , java.sql.Date date,long total, String payment) {
        this.billId = billId;
        this.user = user;
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.createAt = date;
        this.phone = phone;
    }




    public List<Bill> getBillItems() {
        return billItems;
    }

    public void setBillItems(List<Bill> billItems) {
        this.billItems = billItems;
    }

    public BillDetail getBillDetail() {
        return billDetail;
    }

    public void setBillDetail(BillDetail billDetail) {
        this.billDetail = billDetail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }
    public String getBillTotal(long total) {
        String totalNew = CurrencyFormat.covertPriceToString(total);
        return totalNew;
    }
}
