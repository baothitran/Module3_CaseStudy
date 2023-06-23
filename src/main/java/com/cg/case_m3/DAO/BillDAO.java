package com.cg.case_m3.DAO;

import com.cg.case_m3.context.DBContext;
import com.cg.case_m3.model.*;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class BillDAO extends DBContext {
    Connection conn= null;
    PreparedStatement ps = null;
    ResultSet rs = null;

//    public void addOrder(User user, Cart cart, String payment, String address, Date createAt) {
//        LocalDate curDate = LocalDate.now();
//        String date = curDate.toString();
//
//        try{
//            String sql = "INSERT INTO `bill` (`user_id`, `total`, `payment`, `address`, `create_at`) VALUES (?, ?, ?,?, ?);";
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(sql);
//            ps.setInt(1,user.getUserId());
//            ps.setLong(2,cart.getTotalMoney());
//            ps.setString(3,payment);
//            ps.setString(4,address);
//            ps.setDate(5, createAt);
//            ps.executeUpdate();
//
//            String sql1 = "select bill_id from bill order by bill_id desc limit 1";
//            ps = conn.prepareStatement(sql1);
//            rs = ps.executeQuery();
//
//            if (rs.next()) {
//                int bill_id = rs.getInt(1);
//                for (Item i : cart.getItems()) {
//                    String sql2 = "INSERT INTO `bill_detail` (`bill_id`, `product_id`, `quantity`, `color`, `product_price`) VALUES (?,?,?,?,?,?);";
//                    Long total = i.getQuantity() *i.getProduct().getProductPrice();
//
//                    ps.setInt(1,bill_id);
//                    ps.setInt(2,i.getProduct().getProductId());
//                    ps.setInt(3,i.getQuantity());
//                    ps.setString(4, i.getColor());
//                    ps.setLong(5, total);
//                    ps.executeUpdate();
//                }
//            }
//
//            String sql3 = "update product set quantity = quantity - ? where product_id = ?;";
//            ps = conn.prepareStatement(sql3);
//            for (Item i : cart.getItems()) {
//                ps.setInt(1,i.getQuantity());
//                ps.setInt(2,i.getProduct().getProductId());
//                ps.executeUpdate();
//            }
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//    }

    public ArrayList<Bill> getListByPage(List<Bill> list, int start, int end) {
        ArrayList<Bill> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }





    public List<Bill> getBillInfo() {
        List<Bill> list = new ArrayList<>();
            String sql = "select b.bill_id, u.user_name,b.phone,b.address,b.create_at,b.total,b.payment from bill b join user u on b.user_id = u.user_id;";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString(2));
                list.add(new Bill(rs.getInt(1),u,rs.getString(3), rs.getString(4), rs.getDate(5), rs.getLong(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public void createBill(Bill bill, HttpServletRequest req) {
        try {
            LocalDate curDate = LocalDate.now();
            String date = curDate.toString();
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `casestudy_module3`.`bill` (`user_id`, `address`, `phone`, `email`, `payment`, `total`, `create_at`) VALUES (?,?,?,?,?,?,?);");
            preparedStatement.setInt(1,bill.getUserId());
            preparedStatement.setString(2,bill.getAddress());
            preparedStatement.setString(3,bill.getPhone());
            preparedStatement.setString(4,bill.getEmail());
            preparedStatement.setString(5, bill.getPayment());
            preparedStatement.setLong(6,bill.getTotal());
            preparedStatement.setString(7, date);
            preparedStatement.executeUpdate();
            System.out.println("Function createBill: "+ preparedStatement );


            String sqlBill = "select bill_id from bill order by bill_id desc limit 1;";
            ps = connection.prepareStatement(sqlBill);
            rs = ps.executeQuery();
            if(rs.next()){
                int bill_id = rs.getInt(1);
                Cart cart = (Cart) req.getSession().getAttribute("cart");

                List<BillDetail> billDetailList = new ArrayList<>();
                BillDetail billDetail = new BillDetail();
                for(CartItem carts : cart.getCartItems()){
                    billDetail.setMemory(carts.getMemory());
                    billDetail.setColor(carts.getColor());
                    billDetail.setBillId(bill_id);
                    billDetail.setProduct(carts.getProduct());
                    billDetail.setTotal(carts.getTotalCartItem());
                    billDetail.setPrice(carts.getPrice());
                    billDetail.setQuantity(carts.getQuantity());
                    this.createBillDetail(billDetail);
                    billDetailList.add(billDetail);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void createBillDetail(BillDetail billDetail) {
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `casestudy_module3`.`bill_detail` (`bill_id`, `product_id`, `quantity`, `color`, `price`, `memory`, `total`) VALUES (?,?,?,?,?,?,?);");
            preparedStatement.setInt(1, billDetail.getBillId());
            preparedStatement.setInt(2,billDetail.getProduct().getProductId());
            preparedStatement.setInt(3,billDetail.getQuantity());
            preparedStatement.setInt(4, billDetail.getColor());
            preparedStatement.setLong(5, billDetail.getPrice());
            preparedStatement.setInt(6, billDetail.getMemory());
            preparedStatement.setLong(7,billDetail.getTotal());
            preparedStatement.executeUpdate();
            System.out.println("Function createBill: "+ preparedStatement );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Bill getBill() {
        List<Bill> list = new ArrayList<>();
        String sql = "select bill_id, total, createDate from bill order by bill_id desc limit 1;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new Bill(rs.getInt(1), rs.getLong(2), rs.getDate(3)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<BillDetail> getDetail(int bill_id) {
        List<BillDetail> list = new ArrayList<>();
      String sql = "select bd.detail_id,p.product_name,c.color,m.memory_name,bd.quantity,bd.price,bd.total,bd.bill_id from bill_detail bd inner join product p on bd.product_id = p.product_id inner join product_color c on bd.color = c.color_id inner join product_memory m on bd.memory= m.memory_id where bd.bill_id= ?;";
//        String sql = "select*from bill_detail where bill_id=?;";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bill_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getString(2), rs.getString(3), rs.getString(4));
//                Product p = new Product(rs.getInt(2), rs.getString(3), rs.getString(4));
                list.add(new BillDetail(rs.getInt(1),product, rs.getInt(5), rs.getLong(6),rs.getLong(7),rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }


//    public List<Bill> getBillByUserID(int user_id) {
//        List<Bill> list = new ArrayList<>();
////        String sql = "select  p.product_img, p.product_id , p.product_name , d.color , d.quantity, d.price, d.detail_id " +
////                "from bill_detail d join product p on d.product_id = p.product_id where d.bill_id = ?;";
//        String sql = "select  p.product_img, p.product_id , p.product_name , d.color, d.quantity, d.price, d.detail_id, pc.color from bill_detail d join product p on d.product_id = p.product_id join product_color pc on d.color = pc.color_id where d.bill_id = ?";
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(sql);
//            ps.setInt(1, user_id);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                Product product = new Product(rs.getString(1), rs.getInt(2), rs.getString(3));
//                BillDetail billDetail = new BillDetail(rs.getInt(4), rs.getInt(5), rs.getLong(6),rs.getInt(7), product, rs.getString(8));
//                list.add(billDetail);
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }


     public List<BillDetail> getDetailDB(int bill_id) {
        List<BillDetail> list = new ArrayList<>();
//        String sql = "select  p.product_img, p.product_id , p.product_name , d.color , d.quantity, d.price, d.detail_id " +
//                "from bill_detail d join product p on d.product_id = p.product_id where d.bill_id = ?;";
         String sql = "select  p.product_img, p.product_id , p.product_name , d.color, d.quantity, d.price, d.detail_id, pc.color from bill_detail d join product p on d.product_id = p.product_id join product_color pc on d.color = pc.color_id where d.bill_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bill_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getString(1), rs.getInt(2), rs.getString(3));
                BillDetail billDetail = new BillDetail(rs.getInt(4), rs.getInt(5), rs.getLong(6),rs.getInt(7), product, rs.getString(8));
                list.add(billDetail);
            }
        } catch (Exception e) {
        }
        return list;
    }


    public List<Bill> getBillByUserID(int user_id) {
        List<Bill> list = new ArrayList<>();
        String sql = "select *  from `casestudy_module3`.`bill` where user_id = ?;";
//        String sql = "select b.bill_id, b.create_At,b.total,b.payment, b.address from bill b where user_id = ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bill(rs.getInt(1), rs.getInt(2),rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),rs.getLong(7),rs.getDate(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Bill> getBillByDay() {
        List<Bill> list = new ArrayList<>();
        String sql = "select b.bill_id, u.user_name,b.address,b.create_At,b.total,b.payment " +
                "from bill b join `user` u on b.user_id = u.user_id where b.create_At = cast(CURDATE() as Date);";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString(2));
                list.add(new Bill(rs.getInt(1), u, rs.getLong(5), rs.getString(6), rs.getDate(4), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Long revenue() {
        Long revenue = 0L;
        String sql = "select sum(total) from bill;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                revenue = Long.parseLong(rs.getString(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return revenue;
    }

    public Long revenueByMonth(int month) {
        Long revenue = 0L;
        String sql = "select sum(total) from bill where month(create_At) = ?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, month);
            rs = ps.executeQuery();
            while (rs.next()) {
                revenue = Long.parseLong(rs.getString(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return revenue;
    }


}
