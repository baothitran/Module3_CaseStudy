package com.cg.case_m3.DAO;

import com.cg.case_m3.context.DBContext;
import com.cg.case_m3.model.*;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ProductDAO  {
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;


//    public List<Product> getProduct() {
//        List<Product> list = new ArrayList<>();
//        String sql = "select c.category_name , p.product_id , p.product_name, p.quantity, p.product_price, p.product_describe,p.product_img from product p join category c on p.category_id = c.category_id;";
//        try {
//            connection = new DBContext().getConnection();
//            ps = connection.prepareStatement(sql);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                Category category = new Category();
//                category.setCategoryName(rs.getString(1));
//                list.add(new Product(category, rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getLong(5), rs.getString(6), rs.getString(7)));
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }


    public List<Product> getProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.quantity, p.product_price, p.product_describe,p.product_img from product p join category c on p.category_id = c.category_id;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryName(rs.getString(1));
                list.add(new Product(category, rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getLong(5), rs.getString(6), rs.getString(7)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.product_id, p.product_name, p.quantity, p.product_price,pm.memory_name,pc.color,pb.brand_name,c.category_name,p.product_describe,p.product_img from product p join category c on p.category_id = c.category_id JOIN product_brand pb on p.brand_id = pb.brand_id JOIN product_color pc on p.color_id = pc.color_id JOIN product_memory pm on p.memory_id = pm.memory_id WHERE `delete` = false;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
//                int productId, String productName, int quantity, Long productPrice, String memoryName, String colorName, String brandName, String categoryName, String productDescribe, String productImg
                list.add(new Product(rs.getInt(1),rs.getString(2), rs.getInt(3), rs.getLong(4), rs.getString(5),rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Product> getProductHaveColorId() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.quantity, p.product_price, p.color_id, p.product_describe,p.product_img from product p join category c on p.category_id = c.category_id;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryName(rs.getString(1));
                list.add(new Product(category, rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getLong(5), rs.getInt(6), rs.getString(7), rs.getString(8)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


//    public List<Product> getProduct() {
//        List<Product> product = new ArrayList<>();
//        try {
//            connection = (Connection) new DBContext().getConnection();
//            ps = (PreparedStatement) ps.executeQuery();
//            PreparedStatement preparedStatement = connection.prepareStatement(
//                    "select p.product_id , p.product_name, p.quantity, p.product_price,c.category_name, p.product_describe,p.product_img_id from product p join category c on p.category_id = c.category_id;");
//
//            System.out.println("Function findAll " + preparedStatement);
//
//            // Thuc thi cau lenh: executeQuery - select, executeUpdate - them/xoa/sua
//            ResultSet rs = preparedStatement.executeQuery();
//            // rs.next(): đọc qua từng dòng
//            while (rs.next()) {
//                // getInt, getString : lấy giá trị theo tên cột hoặc chỉ số cột (bat dau tu 1)
//                Product p = getCustomerFromRs2(rs);
//                product.add(p);
//            }
//
//        } catch (Exception sqlException) {
//            printSQLException((SQLException) sqlException);
//        }
//        return product;
//    }
//
//    private Product getCustomerFromRs2(ResultSet rs) throws SQLException {
//        int productId = rs.getInt("productId");
//        String productName = rs.getString("productName");
//        int quantity = rs.getInt("quantity");
//        Long productPrice = rs.getLong("productPrice");
//        int categoryId = rs.getInt("categoryId");
//        String productDescribe = rs.getString("productDescribe");
//        String productImg = rs.getString("productImg");
//
//
//        String categoryName = rs.getString("categoryName");
//
//
//
//        Category category = new Category(categoryId, categoryName);
//        Product product = new Product(productId, productName, quantity, productPrice, categoryId, productDescribe, productImg);
////        product.setCategory(category);
//        return  product;
//    }


    public void insertProduct(Product product) {
        String sql = "insert into product (product_name,quantity,product_price,category_id,brand_id,memory_id,color_id,product_describe,product_img) values(?,?,?,?,?,?,?,?,?);";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1,product.getProductName());
            ps.setInt(2,product.getQuantity());
            ps.setLong(3,product.getProductPrice());
            ps.setInt(4,product.getCategory().getCategoryId());
            ps.setInt(5,product.getBrandId());
            ps.setInt(6,product.getMemoryId());
            ps.setInt(7,product.getColorId());
            ps.setString(8, product.getProductDescribe());
//            ps.setString(9, product.getProductImg());

            System.out.println("Function save " + ps);
            ps.executeUpdate();

            connection.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void ProductDelete(String productId) {
        String sql = "UPDATE `product` SET `delete` = true WHERE (`product_id` = ?);";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, productId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void updateProduct(Product product) {
        String sql = "UPDATE `product` SET `product_name` = ?, `quantity` = ?, `product_price` = ?, `category_id` =?, `brand_id` = ?, `memory_id` = ?, `color_id` = ?, `product_describe` = ?, `product_img` = ? WHERE (`product_id` = ?);";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1,product.getProductName());
            ps.setInt(2,product.getQuantity());
            ps.setLong(3,product.getProductPrice());
            ps.setInt(4,product.getCategoryId());
            ps.setInt(5,product.getBrandId());
            ps.setInt(6,product.getMemoryId());
            ps.setInt(7,product.getColorId());
            ps.setString(8, product.getProductDescribe());
            ps.setString(9, product.getProductImg());
            ps.setInt(10,product.getProductId());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Color> getColor() {
        List<Color> list = new ArrayList<>();
        String sql = "select * from product_color;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Color(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ListAvatar> getListAvatar() {
        List<ListAvatar> listAvatar = new ArrayList<>();
        String sql = "select * from product_list_avartar;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listAvatar.add(new ListAvatar(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listAvatar;
    }

    public List<Memory> getMemory() {
        List<Memory> list = new ArrayList<>();
        String sql = "select * from product_memory;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Memory(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Category> getCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from category;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Brand> getBrand() {
        List<Brand> list = new ArrayList<>();
        String sql = "select * from product_brand;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Brand(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Category getCategoryByName(String name) {
        String sql = "select * from category where category_name = ?;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Category getCategoryById(int cid) {
        String sql = "select * from category where category_id = ?;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public List<Product> getTop10Product() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.product_id , p.product_name, p.quantity, p.product_price, p.product_describe,p.product_img FROM product p ORDER BY p.product_id DESC LIMIT 10;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getLong(4), rs.getString(5), rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getTrendProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.product_id , p.product_name, p.quantity, p.product_price, p.product_describe, p.product_img FROM product p \n" +
                "join (select b.product_id, count(b.product_id) as countProduct from bill_detail b group by b.product_id order by countProduct DESC LIMIT 5) as bd on p.product_id = bd.product_id;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getLong(4), rs.getString(5), rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }




    public List<Product> getProductByPriceAsc() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.quantity, p.product_price, p.product_describe,p.product_img from product p join category c on p.category_id = c.category_id ORDER BY p.product_price ASC;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryName(rs.getString(1));
                list.add(new Product(category, rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getLong(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductByPriceDesc() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.quantity, p.product_price, p.product_describe,p.product_img from product p join category c on p.category_id = c.category_id ORDER BY p.product_price DESC;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);

            System.out.println("getProductByPriceDesc: " + ps);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryName(rs.getString(1));
                list.add(new Product(category, rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getLong(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductByPriceAsclimit5() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.quantity, p.product_price, p.product_describe,p.product_img from product p join category c on p.category_id = c.category_id ORDER BY p.product_price ASC limit 5;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryName(rs.getString(1));
                list.add(new Product(category, rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getLong(5), rs.getString(6), rs.getString(7)));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }



    public List<Product> getProductByName() {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.quantity, p.product_price, p.product_describe,p.product_img from product p join category c on p.category_id = c.category_id;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryName(rs.getString(1));
                list.add(new Product(category, rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getLong(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getListByPage(List<Product> list, int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<Product> getProductByCategory(int categoryId) {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.quantity, p.product_price, p.product_describe, p.product_img from product p join category c on p.category_id = c.category_id WHERE p.category_id=?;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryName(rs.getString(1));
                list.add(new Product(category, rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getLong(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductByBrand(int categoryId) {
        List<Product> list = new ArrayList<>();
        String sql = "select c.category_name , p.product_id , p.product_name, p.quantity, p.product_price, p.product_describe, p.product_img from product p join product_brand pb on p.brand_id = pb.brand_id" +
                "                join category c on p.category_id = c.category_id" +
                "                WHERE p.brand_id= ?;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryName(rs.getString(1));
                list.add(new Product(category, rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getLong(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }



//    int productId, String productName, int quantity, Long productPrice, int categoryId, int brandId, int memoryId, int colorId, String productDescribe, String productImg, Brand brand, Category category, Color color, Memory memory, ListAvatar listAvatar, boolean delete
    public Product getProductByID(String productId) {
        Product product = new Product();
        String sql = "SELECT * FROM product WHERE product_id = ?;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                product = (new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getLong(4),rs.getInt(5),rs.getInt(6), rs.getInt(7),rs.getInt(8), rs.getString(9), rs.getString(10), rs.getBoolean(11)));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    public List<Memory> findAllMemory() {
        List<Memory> memoryList = new ArrayList<>();
        try {
            connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM memory;");

            System.out.println("Function getAllCustomers " + preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Memory memory = getCustomerFromRs(rs);
                memoryList.add(memory);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return memoryList;
    }

    private Memory getCustomerFromRs(ResultSet rs) throws SQLException {
        int memoryId = rs.getInt("memory_id");
        String memory = rs.getString("memory");
        Memory memories = new Memory(memoryId, memory);
        return memories;
    }


    public List<Color> getColorByProductID(String color_id) {
        List<Color> list = new ArrayList<>();
        String sql = "select * from product_color where color_id=?;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, color_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Color(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Color getColorByColorID(int colorId) {
        Color color = new Color();
        String sql = "select * from product_color where color_id=?;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, colorId);
            rs = ps.executeQuery();
            while (rs.next()) {
                color = (new Color(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return color;
    }

    public List<ListAvatar> getListAvatarByID(String productId) {
        List<ListAvatar> listAvatar = new ArrayList<>();
        String sql = "select * from product_list_avatar where product_id=?;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                listAvatar.add(new ListAvatar(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listAvatar;
    }

    public List<Memory> getMemoryByProductID(String productId) {
        List<Memory> list = new ArrayList<>();
        String sql = "select * from product_memory where memory_id=?;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Memory(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Memory getMemoryByMemoryID(int meromyId) {
        Memory memory = new Memory();
        String sql = "select * from product_memory where memory_id=?;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, meromyId);
            rs = ps.executeQuery();
            while (rs.next()) {
                memory = (new Memory(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return memory;
    }


//    public Product updatePriceByMemoryId(int id, Customer customer) {
//        Product product = new Product();
//        String sql1 = "UPDATE product SET memory_id = ? WHERE (product_id = ?);";
//        try {
//            connection = new DBContext().getConnection();
//            ps = connection.prepareStatement(sql1);
//            ps.setString(1, Arrays.toString(memoryId));
//            ps.setString(2, productId);
//            ps.executeUpdate();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return product;
//    }

    public void updatePriceByMemoryId(int productId, Product product) {
        try{
            connection = new DBContext().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "UPDATE product SET memory_id = ? WHERE (product_id = ?);");
            preparedStatement.setInt(1, product.getMemoryId());
            preparedStatement.setInt(2, product.getProductId());
            preparedStatement.executeUpdate();
            System.out.println("function update"+ preparedStatement);
            connection.close();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }


    public int CountProduct() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count' FROM product;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public int CountUser() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count' FROM user where is_admin = 0 or is_admin = 0;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public int CountBill() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count' FROM bill;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return count;
    }

    public int CountProductLow() {
        int count = 0;
        String sql = "SELECT COUNT(*) as 'count' FROM product where quantity < 10;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return count;
    }

    public List<Product> getProductLow() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product where quantity < 10;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryName(rs.getString(1));
                list.add(new Product(category, rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getLong(5), rs.getString(6), rs.getString(7)));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> SearchAll(String search) {
        List<Product> list = new ArrayList<>();
        String sql ="SELECT DISTINCT c.category_name , p.product_id , p.product_name, p.product_price, p.product_describe, p.quantity,p.product_img " +
                "FROM product p join category c on c.category_id = p.category_id join product_color ps on p.color_id = ps.color_id " +
                "join product_brand pb on p.brand_id = pb.brand_id " +
                "WHERE p.product_name LIKE ? OR  p.product_price LIKE ? OR ps.color LIKE ? OR c.category_name LIKE ? OR pb.brand_name LIKE ?;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");
            ps.setString(3, search);
            ps.setString(4, "_%" + search + "%_");
            ps.setString(5, "_%" + search + "%_");
            rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getString(1));
                Product product = new Product(category, rs.getInt(2), rs.getString(3), rs.getInt(6), rs.getLong(4), rs.getString(5), rs.getString(7));
                list.add(product);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByPrice(long productPriceMin, long productPriceMax) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT c.category_name, p.product_id, p.product_name, p.quantity, p.product_price, p.product_describe, p.product_img " +
                "FROM product p " +
                "JOIN category c ON p.category_id = c.category_id " +
                "WHERE p.product_price >= ? AND p.product_price <= ? " +
                "ORDER BY p.product_price ASC;";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            ps.setLong(1, productPriceMin);
            ps.setLong(2, productPriceMax);

            System.out.println("function getProductByPrice" + ps);
            rs = ps.executeQuery();

            while (rs.next()) {
                Category category = new Category();
                category.setCategoryName(rs.getString(1));
                list.add(new Product(category, rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getLong(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public List<Product> getListByPage(List<Product> productList) {
        return productList;
    }
}
