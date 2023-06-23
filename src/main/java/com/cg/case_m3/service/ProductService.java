package com.cg.case_m3.service;

import com.cg.case_m3.model.ListAvatar;
import com.cg.case_m3.model.Product;

import java.util.ArrayList;
import java.util.List;

public interface ProductService {
    List<Product> findAll();
    List<Product> findAll2();
    void save(Product customer);
    Product findById(int id);
    void update(int id, Product customer);
    void remove(int id);

    default List<Product> searchProduct(String productName){
        List<Product> result = new ArrayList<>();
        List<Product> products = findAll();
        for (Product product: products){
            if(product.getProductName().toUpperCase().contains(productName.toUpperCase())){
                result.add(product);
            }
        }
        return result;
    }
    void create(Product product);


}
