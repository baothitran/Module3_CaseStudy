package com.cg.case_m3.controller;

import com.cg.case_m3.DAO.ProductDAO;
import com.cg.case_m3.model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "homeServlet", urlPatterns = "/home")
public class HomeServlet extends HttpServlet {
    private ProductDAO productDAO;
    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        ProductDAO productDAO = new ProductDAO();
        List<Product> product = productDAO.getTop10Product();
        List<Product> product1 = productDAO.getTrendProduct();
        request.setAttribute("top10", product);
        request.setAttribute("topTrend", product1);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        request.setAttribute("user", user);
        request.getRequestDispatcher("/WEB-INF/admin/customer/index.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        String action = req.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {
            default:
                showList(req,resp);
        }
    }


    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> productList = productDAO.getProduct();
        List<Product> productListLimit5 = productDAO.getProductByPriceAsclimit5();
        List<Category> category = productDAO.getCategory();
        List<Brand> brand = productDAO.getBrand();

        int count = 0;
        count = countProductInCart(count, req);

        List<Product> product = productDAO.getListByPage(productList);
        List<Product> productLimit5 = productDAO.getListByPage(productListLimit5);

        req.setAttribute("categoryData", category);
        req.setAttribute("productData", product);
        req.setAttribute("productDataLimit5", productLimit5);
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        req.setAttribute("user", user);
        req.setAttribute("brandData", brand);
        req.setAttribute("count",count);

        req.getRequestDispatcher("/WEB-INF/admin/customer/index.jsp").forward(req, resp);
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




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }






    @Override
    public void destroy() {
    }
}
