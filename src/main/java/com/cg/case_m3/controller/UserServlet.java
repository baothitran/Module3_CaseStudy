package com.cg.case_m3.controller;

import com.cg.case_m3.DAO.BillDAO;

import com.cg.case_m3.DAO.ProductDAO;
import com.cg.case_m3.model.*;

import com.cg.case_m3.model.Bill;
import com.cg.case_m3.model.BillDetail;
import com.cg.case_m3.model.User;

import com.cg.case_m3.utils.ValidateUtils;
import com.cg.case_m3.service.IUserService;
import com.cg.case_m3.service.UserService;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;



@WebServlet(name = "UserServlet", urlPatterns = "/login")
public class UserServlet extends HttpServlet {

    private IUserService userService;
    private BillDAO billDAO;
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
        billDAO = new BillDAO();
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(req,resp);
                break;
            case "login":
                showFormLogin(req,resp);
                break;
            case "logout":
                showLogout(req,resp);
                break;
            case "myAccount":
                showMyAccount(req,resp);
                break;
            case "billDetail":
                showBillDetail(req,resp);
                break;

            default:
                showFormCreate(req,resp);
                break;
        }
    }

    private void showBillDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bill_id = req.getParameter("bill_id");
        int id = Integer.parseInt(bill_id);
        List<BillDetail> details = billDAO.getDetail(id);
        int count = 0;
        count = countProductInCart(count, req);
        req.setAttribute("count",count);

        req.setAttribute("details",details);
        req.getRequestDispatcher("/WEB-INF/admin/customer/billdetail.jsp").forward(req,resp);
    }
    //    OrderManagerServlet
    private void showOrder(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user.isAdmin()) {
                List<Bill> bill = billDAO.getBillInfo();
                int page, numperpage = 10;
                int size = bill.size();
                int num = (size % 10 == 0 ? (size / 10) : ((size / 10)) + 1);//so trang
                String xpage = request.getParameter("page");
                if (xpage == null) {
                    page = 1;
                } else {
                    page = Integer.parseInt(xpage);
                }
                int start, end;
                start = (page - 1) * numperpage;
                end = Math.min(page * numperpage, size);
                int count=0;
//                count = countBill(count,request);


                request.setAttribute("count",count);
                List<Bill> bills = billDAO.getListByPage(bill, start, end);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("bill", bills);
//                request.setAttribute("bills", bills);
                request.getRequestDispatcher("/WEB-INF/admin/dashboard/order.jsp").forward(request, response);
            } else {
                response.sendRedirect("user?action=login");
            }
        } catch (Exception e) {
            response.sendRedirect("404.jsp");
        }


    }

    private void showMyAccount(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("user");
            if (user != null) {
                int count = 0;
                count = countProductInCart(count, req);
                req.setAttribute("count",count);

                int userId = user.getUserId();
                List<Bill> bill = billDAO.getBillByUserID(userId);
                req.setAttribute("bill", bill);

                req.getRequestDispatcher("/WEB-INF/admin/customer/myaccount.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("/login?action=login");
            }
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

    private void showLogout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        session.removeAttribute("user");
        resp.sendRedirect("home");
    }

    private void showFormLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/admin/login/login.jsp").forward(req,resp);
    }

    private void showFormCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/admin/login/register.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createUser(req,resp);
                break;
            case "login":
                try {
                    loginUser(req,resp);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                showFormLogin(req,resp);
        }
    }



    private void loginUser(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, InterruptedException {
        List<String> errors = new ArrayList<>();
        String userEmail = req.getParameter("userEmail");
        String password = req.getParameter("password");
        User user = userService.checkUser(userEmail,password);
        boolean checkrole = user.isAdmin();
        System.out.println(checkrole);
        if (user == null) {
            errors.add("Account does not exist!");
            req.setAttribute("errors",errors);
            req.getRequestDispatcher("/WEB-INF/admin/login/login.jsp").forward(req,resp);
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("user",user);
            session.setAttribute("isadmin",checkrole);
            resp.sendRedirect("home");
        }

    }

    private void createUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> errors = new ArrayList<>();
        User user = new User();
        String userName = req.getParameter("userName");
        String userEmail = req.getParameter("userEmail");
        String userPass = req.getParameter("password");
        if (userService.checkExistUser(userEmail)){
            errors.add("Account already exists!");
        }
        if (!ValidateUtils.isUserName(userName)) {
            errors.add("Please enter username at least 3 characters with uppercase first letter without spaces!");
        }

        if (!ValidateUtils.isEmail(userEmail)) {
            errors.add("Please provide a valid email!");
        }
        if (!ValidateUtils.isPassWord(userPass)) {
            errors.add("Please enter a password with at least 8 characters and have a number in it! ");
        }
        if (errors.size() == 0) {
            user.setUserName(userName);
            user.setUserEmail(userEmail);
            user.setUserPass(userPass);
            userService.create(user);
            req.setAttribute("message", "Successfully registered!");
        } else {
            req.setAttribute("errors", errors);
        }
        req.getRequestDispatcher("/WEB-INF/admin/login/register.jsp").forward(req,resp);
    }

}
