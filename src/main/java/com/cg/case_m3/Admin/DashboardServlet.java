package com.cg.case_m3.Admin;

import com.cg.case_m3.DAO.BillDAO;
import com.cg.case_m3.DAO.ProductDAO;
import com.cg.case_m3.model.Bill;
import com.cg.case_m3.model.User;
import com.cg.case_m3.utils.CurrencyFormat;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DashboardServlet", value = "/dashboard")
public class DashboardServlet extends HttpServlet {

    private ProductDAO productDAO;
    private BillDAO billDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
        billDAO = new BillDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if (user.isAdmin()) {
                int count = productDAO.CountProduct();
                int countuser = productDAO.CountUser();
                int countproductlow = productDAO.CountProductLow();
                List<Bill> billbyday = billDAO.getBillByDay();

                request.setAttribute("product", count);
                request.setAttribute("user", countuser);
                request.setAttribute("low", countproductlow);
                request.setAttribute("billbyday", billbyday);
                request.getRequestDispatcher("WEB-INF/admin/customer/dashboard.jsp").forward(request, response);
            } else {
                response.sendRedirect("login");
            }
        } catch (Exception e) {
            response.sendRedirect("404.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        processRequest(request, response);
    }

    @Override
    public void destroy() {

    }
}
