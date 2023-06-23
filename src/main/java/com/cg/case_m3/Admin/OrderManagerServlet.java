package com.cg.case_m3.Admin;

import com.cg.case_m3.DAO.BillDAO;
import com.cg.case_m3.model.*;
import com.mysql.cj.x.protobuf.MysqlxCrud;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderManagerServlet", urlPatterns = "/orderManager")
public class OrderManagerServlet extends HttpServlet {
    private BillDAO billDAO;

    @Override
    public void init() throws ServletException {
        billDAO = new BillDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "showDetail":
                showOrderDetail(request, response);
                break;
            default:
                showOrder(request, response);
                break;
        }
    }



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
                count = countBill(count,request);


                request.setAttribute("count",count);
                List<Bill> bills = billDAO.getListByPage(bill, start, end);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("bill", bills);
                request.getRequestDispatcher("/WEB-INF/admin/dashboard/order.jsp").forward(request, response);
            } else {
                response.sendRedirect("user?action=login");
            }
        } catch (Exception e) {
            response.sendRedirect("404.jsp");
        }


    }

    // ordersevelet
    private int countBill(int count, HttpServletRequest req) {
        Bill bill = null;
        bill = (Bill) req.getSession().getAttribute("bill");
        if (bill == null) {
            bill = new Bill();
        }
        if(bill.getBillItems() !=null){
            for (int i=0;i<bill.getBillItems().size();i++) {
                count+=1;
            }
        }

        return count;
    }


    private void showOrderDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bill_id = request.getParameter("bill_id");
        int id = Integer.parseInt(bill_id);
        List<BillDetail> detail = billDAO.getDetailDB(id);

        request.setAttribute("detail", detail);
        request.getRequestDispatcher("/WEB-INF/admin/dashboard/orderDetail.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
