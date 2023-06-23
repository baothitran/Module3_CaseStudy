package com.cg.case_m3.service;

import com.cg.case_m3.DAO.ProductDAO;
import com.cg.case_m3.context.DBContext;
import com.cg.case_m3.model.ListAvatar;
import com.cg.case_m3.model.Product;
import com.cg.case_m3.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class ProductServiceImpl extends DBContext implements ProductService{

    @Override
    public List<Product> findAll() {
        return null;
    }

    @Override
    public List<Product> findAll2() {
        return null;
    }

    @Override
    public void save(Product customer) {

    }

    @Override
    public Product findById(int id) {
        Connection connection;
        PreparedStatement ps;
        ResultSet rs;
        Product product = new Product();
        String sql = "SELECT * FROM product WHERE product_id = ?;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                //int,String,int,long,int,int,int,int,string,string
                product = (new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getLong(4),rs.getInt(5),rs.getInt(6), rs.getInt(7),rs.getInt(8), rs.getString(9), rs.getString(10), rs.getBoolean(11)));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

//    public Product getProductByID(String productId) {
//        Product product = new Product();
//        String sql = "SELECT * FROM product WHERE product_id = ?;";
//        try {
//            connection = new DBContext().getConnection();
//            ps = connection.prepareStatement(sql);
//            ps.setString(1, productId);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                product = (new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getLong(4),rs.getInt(5),rs.getInt(6), rs.getInt(7),rs.getInt(8), rs.getString(9), rs.getString(10), rs.getBoolean(11)));
//
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return product;
//    }

    @Override
    public void update(int id, Product customer) {

    }

    @Override
    public void remove(int id) {

    }
    public void create(Product product) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `product` (`product_name`, `quantity`, `product_price`, `category_id`, `brand_id`, `memory_id`, `color_id`, `product_describe`, `product_img`, `delete`)" +
                    " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            //product_name`, `quantity`, `product_price`, `category_id`, `brand_id`, `memory_id`, `color_id`, `product_describe`, `product_img`, `delete
            preparedStatement.setString(1, product.getProductName());
            preparedStatement.setInt(2, product.getQuantity());
            preparedStatement.setLong(3, product.getProductPrice());
            preparedStatement.setInt(4,product.getCategoryId());
            preparedStatement.setInt(5,product.getBrandId());
            preparedStatement.setInt(6,product.getMemoryId());
            preparedStatement.setInt(7,product.getColorId());
            preparedStatement.setString(8,product.getProductDescribe());
            preparedStatement.setString(9,product.getProductImg());
            preparedStatement.setBoolean(10, false);

            preparedStatement.executeUpdate();
            System.out.println("Function create: "+ preparedStatement);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}