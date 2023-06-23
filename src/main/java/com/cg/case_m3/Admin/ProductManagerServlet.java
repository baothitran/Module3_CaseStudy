package com.cg.case_m3.Admin;

import com.cg.case_m3.DAO.ProductDAO;
import com.cg.case_m3.model.*;
import com.cg.case_m3.service.ProductService;
import com.cg.case_m3.service.ProductServiceImpl;
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

@WebServlet(name = "productManagerServlet", urlPatterns = "/productManager")
public class ProductManagerServlet extends HttpServlet {
    private ProductDAO productDAO;

    private ProductService productService;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
        productService = new ProductServiceImpl();

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
            case "productLow":
                showProductLow(request, response);
                break;
            case "insert":
                showInsertProduct(request, response);
                break;
            case "update":
                showUpdateProduct(request, response);
                break;
            default:
                showProduct(request, response);
        }
    }

    private void showUpdateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product p = productService.findById(id);
        List<Product> products = productDAO.getProduct();
        List<Category> categories = productDAO.getCategory();
        List<Color> colors = productDAO.getColor();
        List<Memory> memories = productDAO.getMemory();
        List<Brand> brands = productDAO.getBrand();


        request.setAttribute("p", p);
        request.setAttribute("products", products);
        request.setAttribute("CategoryData", categories);
        request.setAttribute("ColorData",colors);
        request.setAttribute("Memory", memories);
        request.setAttribute("Branddata", brands);

        request.getRequestDispatcher( "/WEB-INF/admin/dashboard/update.jsp").forward(request, response);
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
            case "insertProduct":
                insertProduct(request, response);
                break;
            case "updateProduct":
                updateProduct(request, response);
                break;
            case "deleteProduct":
                deleteProduct(request, response);
                break;
            default:
        }
    }

    private void showProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Memory> memories = productDAO.getMemory();
//        List<Product> product = productDAO.getProduct();
//        List<Brand> brands = productDAO.getBrand();
//        List<Color> color = productDAO.getColor();
//        List<Category> category = productDAO.getCategory();
//        request.setAttribute("CategoryData", category);
//        request.setAttribute("ProductData", product);
//        request.setAttribute("ColorData", color);
//        request.setAttribute("Branddata", brands);
//        request.setAttribute("Memory", memories);
        List<Product> products = productDAO.getAllProduct();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/WEB-INF/admin/dashboard/product.jsp").forward(request, response);
//        try {
//            HttpSession session = request.getSession();
//            User user = (User) session.getAttribute("user");
//            if (user.isAdmin()) {
//                List<Product> product = productDAO.getProduct();
//                List<Color> color = productDAO.getColor();
//                List<Category> category = productDAO.getCategory();
//                request.setAttribute("CategoryData", category);
//                request.setAttribute("ProductData", product);
//                request.setAttribute("ColorData", color);
//                request.getRequestDispatcher("/WEB-INF/admin/dashboard/product.jsp").forward(request, response);
//            } else {
//                response.sendRedirect("user?action=login");
////                request.getRequestDispatcher("/WEB-INF/admin/dashboard/product.jsp").forward(request, response);
//            }
//        } catch (Exception e) {
////            response.sendRedirect("404.jsp");
//        }
    }



    private void showInsertProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        try {
//            List<Category> category = productDAO.getCategory();
//            request.setAttribute("CategoryData", category);
//            request.getRequestDispatcher("WEB-INF/admin/dashboard/insertProduct.jsp").forward(request, response);
//        } catch (Exception e) {
////            response.sendRedirect("404.jsp");
//        }
        List<Category> categories = productDAO.getCategory();
        List<Memory> memories = productDAO.getMemory();
        List<Brand> brands = productDAO.getBrand();
        List<Color> colors = productDAO.getColor();

        request.setAttribute("CategoryData",categories);
        request.setAttribute("Memory", memories);
        request.setAttribute("Branddata", brands);
        request.setAttribute("ColorData",colors);
        request.setAttribute("message", "message");

        request.getRequestDispatcher("WEB-INF/admin/dashboard/insertProduct.jsp").forward(request, response);

    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> errors = new ArrayList<>();
        String brand = request.getParameter("brand_id");
        if(brand.equals("Chọn hãng")) {
            errors.add("Vui lòng chọn hãng");

        }
        int brandId = Integer.parseInt(brand);

        int categoryId = Integer.parseInt(request.getParameter("category_id"));

        String name = request.getParameter("product_name");
        Long price = Long.parseLong(request.getParameter("product_price"));
        int colorId = Integer.parseInt(request.getParameter("color_id"));
        int memoryId = Integer.parseInt(request.getParameter("memory"));
        int quantity = Integer.parseInt(request.getParameter("product_quantity"));
        String img = request.getParameter("product_img");

        String productDescribe = request.getParameter("describe");

        if(!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            showInsertProduct(request,response);

        }

        Product product = new Product();
        product.setBrandId(brandId);
        product.setCategoryId(categoryId);
        product.setProductName(name);
        product.setProductPrice(price);
        product.setColorId(colorId);
        product.setMemoryId(memoryId);
        product.setQuantity(quantity);
        product.setProductDescribe(productDescribe);
        product.setProductImg(img);

        productService.create(product);
//        request.setAttribute("brand", brand);
//        request.setAttribute("category_id", category);
//        request.setAttribute("product_name", name);
//        request.setAttribute("product_price", price);
//        request.setAttribute("color_id",color);
//        request.setAttribute("memory",memory);
//        request.setAttribute("product_quantity",quantity);
        showInsertProduct(request,response);

    }

    private void showProductLow(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            List<Brand> brands = productDAO.getBrand();
            List<Product> product = productDAO.getProductLow();
            List<Color> color = productDAO.getColor();
            List<Category> category = productDAO.getCategory();
            request.setAttribute("CategoryData", category);
            request.setAttribute("ProductLow", product);
            request.setAttribute("ColorData", color);
            request.setAttribute("Branddata", brands);
            request.getRequestDispatcher("WEB-INF/admin/dashboard/productLow.jsp").forward(request, response);
        } catch (Exception e) {
           response.sendRedirect("404.jsp");
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String product_id = request.getParameter("product_id");
            productDAO.ProductDelete(product_id);
//            request.getRequestDispatcher("/admin/product.jsp").forward(request, response);
//            response.sendRedirect("WEB-INF/admin/dashboard/product.jsp");
            response.sendRedirect("/productManager");
        } catch (Exception e) {
            response.sendRedirect("404.jsp");
        }

    }
    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<String> errors = new ArrayList<>();
            int id = Integer.parseInt(request.getParameter("product_id"));
            int newBrandId = Integer.parseInt(request.getParameter("brand_id"));
            int newCategoryId = Integer.parseInt(request.getParameter("category_id"));
            String newName = request.getParameter("product_name");
            long newPrice = Long.parseLong(request.getParameter("product_price"));
            int newColorId = Integer.parseInt(request.getParameter("color_id"));
            int newMemoryId = Integer.parseInt(request.getParameter("memory_id"));
            int newQuantity = Integer.parseInt(request.getParameter("product_quantity"));
            String newImg = request.getParameter("product_img");
            String newProductDescribe = request.getParameter("product_describe");

            Product product1 = new Product(id, newName,newQuantity, newPrice,newCategoryId, newBrandId, newMemoryId, newColorId , newProductDescribe, newImg);

                productDAO.updateProduct(product1);
                request.setAttribute("p", product1);
                request.setAttribute("message", "Thêm sản phẩm thành công");
                response.sendRedirect("/productManager");


    }




    private void validateProductName(HttpServletRequest req, List<String> errors, Product product) {
        String product_name = req.getParameter("product_name");
        if (!ValidateUtils.isNameProduct(product_name)) {
            errors.add("Tên sản phẩm không hợp lệ. Phải bắt đầu là chữ số và có từ 6-255 kí tự!");
        }
        product.setProductName(product_name);
    }

    private void validatePrice(HttpServletRequest req, List<String> errors, Product product) {
        try {
            Long price = Long.parseLong(req.getParameter("product_price"));
            if (price <= 0 || price > 10000000) {
                errors.add("Giá phải lớn hơn 0 và nhỏ hơn 10000000");
            } else {
                product.setProductPrice(price);
            }
        } catch (NumberFormatException numberFormatException) {
            errors.add("Định dạng giá không hợp lệ");
        }
    }

    private void validateQuantity(HttpServletRequest req, List<String> errors, Product product) {
        try {
            int quantity = Integer.parseInt(req.getParameter("product_quantity"));
            if (quantity <= 0 || quantity > 1000) {
                errors.add("Số lượng phải lớn hơn 0 và nhỏ hơn 1000");
            } else {
                product.setQuantity(quantity);
            }
        } catch (NumberFormatException numberFormatException) {
            errors.add("Định dạng số lượng không hợp lệ");
        }
    }

    @Override
    public void destroy() {

    }


}
