package com.cg.case_m3.controller;

import com.cg.case_m3.DAO.BillDAO;
import com.cg.case_m3.model.Bill;
import com.cg.case_m3.model.Cart;
import com.cg.case_m3.model.CartItem;
import com.cg.case_m3.model.User;
import com.cg.case_m3.utils.ValidateUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "BillServlet", value = "/bill")
public class BillServlet extends HttpServlet {
    private BillDAO billDAO;
    @Override
    public void init() throws ServletException {
        billDAO = new BillDAO();
    }



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {

        }

    }

    private void showBill(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            try {
                HttpSession session = req.getSession();
                User user = (User) session.getAttribute("user");
                if (user.isAdmin() == true) {
                    List<Bill> bill = billDAO.getBillInfo();
                    req.setAttribute("bill", bill);
                    req.getRequestDispatcher("admin/order.jsp").forward(req, resp);
                } else {
                    resp.sendRedirect("user?action=login");
                }
            } catch (Exception e) {
                resp.sendRedirect("404.jsp");
            }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addBill(req,resp);
                break;
        }
    }

    private void addBill(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> errors = new ArrayList<>();

        Bill bill = new Bill();
        User user = (User) req.getSession().getAttribute("user");
        int userId = user.getUserId();
//        String address = String.valueOf(req.getParameter("address"));
        String address = new String(req.getParameter("address").getBytes("iso-8859-1"), "utf-8");
        String phone = req.getParameter("phone");
        String email = user.getUserEmail();
//        String email = req.getParameter("email");
        String payment = req.getParameter("radio");
        Long total = Long.parseLong(req.getParameter("totalBill"));

        if (!ValidateUtils.isAddress(address)) {
            errors.add("Vui lòng viết hoa chữ cái đầu của địa chỉ!");
        }
        if (!ValidateUtils.isPhone(phone)) {
            errors.add("Vui lòng nhập số điện thoại gồm 10 chữ số bắt đầu bằng số 0! ");
        }



        if (errors.size() == 0) {
            bill.setUserId(userId);
            bill.setAddress(address);
            bill.setEmail(email);
            bill.setPhone(phone);
            bill.setPayment(payment);
            bill.setTotal(total);
            billDAO.createBill(bill, req);

            req.setAttribute("bill",bill);

            req.setAttribute("message", "Mua hàng thành công!");
            req.getSession().removeAttribute("cart");
            showCart(req,resp);
        }
        else {
            req.setAttribute("errors", errors);
            showCart(req, resp);
        }



    }
    private void showCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        int count = 0;
        count = countProductInCart(count, req);
        List<CartItem> cartItems = cart.getCartItems();
        req.setAttribute("cart", cart);
        req.setAttribute("cartItem", cartItems);
        req.setAttribute("count",count);

        req.getRequestDispatcher("/WEB-INF/admin/cart/cart.jsp").forward(req,resp);
    }

    private int countProductInCart(int count, HttpServletRequest req) {
        Cart cart = null;
        cart = (Cart) req.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        if(cart.getCartItems() !=null){
            for (int i=0;i<cart.getCartItems().size();i++) {
                count+=1;
            }
        }

        return count;
    }
}
