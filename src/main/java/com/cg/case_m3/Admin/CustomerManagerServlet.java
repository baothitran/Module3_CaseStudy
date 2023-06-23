package com.cg.case_m3.Admin;

import com.cg.case_m3.DAO.UserDAO;
import com.cg.case_m3.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "customerManagerServlet", urlPatterns = "/customerManager")
public class CustomerManagerServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {

        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        List<User> user1 = userDAO.getUser();
        request.setAttribute("user", user1);
        request.getRequestDispatcher("/WEB-INF/admin/customer/customer.jsp").forward(request, response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "update":
                updateUser(request, response);
                break;
            case "deleteUser":
                deleteUser(request, response);
                break;
            default:
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String userId = request.getParameter("user_id");
            String isAdmin = request.getParameter("permission");
            int id = Integer.parseInt(userId);
            UserDAO dao = new UserDAO();
            dao.setAdmin(id, isAdmin);
            response.sendRedirect("customerManager");
        } catch (Exception e) {
            response.sendRedirect("404.jsp");
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("user_id"));
            userDAO.deleteUser(userId);
//            request.getRequestDispatcher("/admin/product.jsp").forward(request, response);
            response.sendRedirect("/customerManager");
        } catch (Exception e) {
            response.sendRedirect("404.jsp");
        }

    }

    @Override
    public void destroy() {

    }
}

