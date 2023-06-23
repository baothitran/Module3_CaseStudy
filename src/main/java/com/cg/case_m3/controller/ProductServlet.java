package com.cg.case_m3.controller;

import com.cg.case_m3.DAO.ProductDAO;
import com.cg.case_m3.model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    private ProductDAO productDAO;

    List<Product> product;
    List<Memory> memorys;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        String action = req.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {
            case "listByCategory":
                showlistByCategory(req,resp);
                break;
            case "listByBrand":
                showlistByBrand(req, resp);
                break;
            case "productDetail":
                showProductDetail(req,resp);
                break;
            case "sortProductByPriceDesc":
                showSortProductByPriceDesc(req, resp);
                break;
            case "sortProductByPriceAsc":
                showSortProductByPriceAsc(req, resp);
                break;
            case "sortProductByName":
                showSortProductByName(req, resp);
                break;
            case "edit":
                eidtProduct(req,resp);
                break;
            case "showlistByPrice":
                searchProductByPriceSlider(req, resp);
                break;
            default:
                showList(req,resp);
        }
    }

    private void eidtProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("id");
        Product product = productDAO.getProductByID(productId);
        memorys = productDAO.findAllMemory();
        req.setAttribute("customerTypes", memorys);
        req.setAttribute("product", product);
        req.getRequestDispatcher("/WEB-INF/admin/customer/productDetail.jsp").forward(req, resp);
    }

    private void showProductDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("product_id");
        List<Color> colorId = productDAO.getColorByProductID(productId);
        List<Memory> memoryId = productDAO.getMemoryByProductID(productId);
        List<Color> color = productDAO.getColor();
        List<Memory> memory = productDAO.getMemory();
        List<ListAvatar> listAvatar = productDAO.getListAvatarByID(productId);
        Product product = productDAO.getProductByID(productId);

        if (product == null) {
            req.getRequestDispatcher("/404.jsp").forward(req, resp);
        }
        int categoryId = product.getCategoryId();
        List<Product> productByCategory = productDAO.getProductByCategory(categoryId);
        Category category = productDAO.getCategoryById(categoryId);
        int count=0;
        count = countProductInCart(count,req);
        req.setAttribute("count",count);
        req.setAttribute("productData", product);
        req.setAttribute("memoryData" , memory);
        req.setAttribute("colorData", color);
        req.setAttribute("memoryId" , memoryId);
        req.setAttribute("colorId", colorId);
        req.setAttribute("category", category);
        req.setAttribute("productByCategory", productByCategory);
        req.setAttribute("listAvatar", listAvatar);
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        req.setAttribute("user", user);
        req.getRequestDispatcher("/WEB-INF/admin/customer/productDetail.jsp").forward(req, resp);
    }




//    private void updateProductMemory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String[] memoryId = req.getParameterValues("memoryId");
//        String productId = req.getParameter("product_id");
//
//
//        productDAO.updatePriceByMemoryId(memoryId, productId);
//
//        // Redirect hoặc chuyển hướng đến trang hiển thị chi tiết sản phẩm
//        req.getRequestDispatcher("/WEB-INF/admin/customer/productDetail.jsp").forward(req, resp);
//    }

    private void editProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        List<String> errors = new ArrayList<>();
//        Lấy du lieu mà người dùng gửi lên từ form, với các trường trong getParameter tương ứng với trường name ở thẻ input
        String productId = req.getParameter("product_id");
        String productName = req.getParameter("product_name");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        long productPrice = Long.parseLong(req.getParameter("product_price"));
        int categoryId = Integer.parseInt(req.getParameter("category_id"));
        int brandId = Integer.parseInt(req.getParameter("brand_id"));
        int memoryId = Integer.parseInt(req.getParameter("memory_id"));
        int colorId = Integer.parseInt(req.getParameter("color_id"));
        String productDescribe = req.getParameter("product_describe");
        String productImg = req.getParameter("product_img");

//        Lấy ra Customer từ id, và sét giá trị cho nó
        Product product = productDAO.getProductByID(productId);
        product.setProductName(productName);
        product.setQuantity(quantity);
        product.setProductPrice(productPrice);
        product.setCategoryId(categoryId);
        product.setBrandId(brandId);
        product.setMemoryId(memoryId);
        product.setColorId(colorId);
        product.setProductDescribe(productDescribe);
        product.setProductImg(productImg);

        if (errors.isEmpty()) {
            productDAO.updatePriceByMemoryId(product.getProductId(), product);
            resp.sendRedirect("/product");
        }else{
            req.setAttribute("product", product);
            req.setAttribute("errors", errors);

            List<Memory> memories = productDAO.findAllMemory();
            req.setAttribute("memories", memories);
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/admin/customer/productDetail.jsp");
            requestDispatcher.forward(req, resp);

            resp.sendRedirect("/product");
        }
    }




    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> productList = productDAO.getProduct();
        List<Category> category = productDAO.getCategory();
        List<Brand> brand = productDAO.getBrand();
        int page, numperpage = 9;
        int size = productList.size();
        int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);//so trang
        String xpage = req.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        int count=0;
        count = countProductInCart(count,req);
        req.setAttribute("count",count);
        List<Product> product = productDAO.getListByPage(productList, start, end);
        req.setAttribute("page", page);
        req.setAttribute("num", num);
        req.setAttribute("categoryData", category);
        req.setAttribute("productData", product);
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        req.setAttribute("user", user);
        req.setAttribute("brandData", brand);
        req.setAttribute("test", 1000);
        req.setAttribute("productPriceMin", 10000);
        req.setAttribute("productPriceMax", 100000000);

        req.getRequestDispatcher("/WEB-INF/admin/customer/product.jsp").forward(req, resp);
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


    private void showlistByCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryId = req.getParameter("categoryId");
        int categoryId1 = Integer.parseInt(categoryId);
        List<Product> productList = productDAO.getProductByCategory(categoryId1);
        List<Category> category = productDAO.getCategory();
        List<Brand> brand = productDAO.getBrand();
        int page, numperpage = 9;
        int size = productList.size();
        int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);//so trang
        String xpage = req.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        List<Product> product = productDAO.getListByPage(productList, start, end);
        int count=0;
        count = countProductInCart(count,req);
        req.setAttribute("count",count);
        req.setAttribute("page", page);
        req.setAttribute("num", num);
        req.setAttribute("categoryData", category);
        req.setAttribute("productData", product);
        req.setAttribute("brandData", brand);
        req.getRequestDispatcher("/WEB-INF/admin/customer/product.jsp").forward(req, resp);
    }

    private void showlistByBrand(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String brandId = req.getParameter("brandId");
        int brandId1 = Integer.parseInt(brandId);
        List<Product> productList = productDAO.getProductByBrand(brandId1);
        List<Category> category = productDAO.getCategory();
        List<Brand> brand = productDAO.getBrand();
        int count=0;
        count = countProductInCart(count,req);
        req.setAttribute("count",count);
        int page, numperpage = 9;
        int size = productList.size();
        int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);//so trang
        String xpage = req.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        List<Product> product = productDAO.getListByPage(productList, start, end);
        req.setAttribute("page", page);
        req.setAttribute("num", num);
        req.setAttribute("categoryData", category);
        req.setAttribute("productData", product);
        req.setAttribute("brandData", brand);
        req.getRequestDispatcher("/WEB-INF/admin/customer/product.jsp").forward(req, resp);
    }


    private void showlistByPrice(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long minPrice = Integer.parseInt(req.getParameter("minPrice"));
        long maxPrice = Integer.parseInt(req.getParameter("maxPrice"));

        int count=0;
        count = countProductInCart(count,req);
        req.setAttribute("count",count);

        List<Product> productList = productDAO.getProductByPrice(minPrice, maxPrice);


        req.setAttribute("productList", productList);
        req.getRequestDispatcher("/WEB-INF/admin/customer/product.jsp").forward(req, resp);
    }



    private void showSortProductByPriceDesc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> category = productDAO.getCategory();
        List<Product> productList = productDAO.getProductByPriceDesc();
        List<Brand> brand = productDAO.getBrand();
        int page, numperpage = 9;
        int size = productList.size();
        int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);//so trang
        String xpage = req.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        int count=0;
        count = countProductInCart(count,req);
        req.setAttribute("count",count);
        List<Product> product = productDAO.getListByPage(productList, start, end);
        req.setAttribute("page", page);
        req.setAttribute("num", num);
        req.setAttribute("categoryData", category);
        req.setAttribute("productData", product);
        req.setAttribute("brandData", brand);
        req.setAttribute("type", "hight");
        req.getRequestDispatcher("/WEB-INF/admin/customer/product.jsp").forward(req, resp);
    }
    private void showSortProductByName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> productList = productDAO.getProductByName();
        List<Category> category = productDAO.getCategory();
        List<Brand> brand = productDAO.getBrand();
        int page, numperpage = 9;
        int size = productList.size();
        int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);//so trang
        String xpage = req.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        int count=0;
        count = countProductInCart(count,req);
        req.setAttribute("count",count);
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        List<Product> product = productDAO.getListByPage(productList, start, end);
        req.setAttribute("page", page);
        req.setAttribute("num", num);
        req.setAttribute("categoryData", category);
        req.setAttribute("productData", product);
        req.setAttribute("brandData", brand);
        req.setAttribute("type", "a-z");
        req.getRequestDispatcher("/WEB-INF/admin/customer/product.jsp").forward(req, resp);
    }

    private void showSortProductByPriceAsc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> productList = productDAO.getProductByPriceAsc();
        List<Category> category = productDAO.getCategory();
        List<Brand> brand = productDAO.getBrand();
        int page, numperpage = 9;
        int size = productList.size();
        int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);//so trang
        String xpage = req.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        List<Product> product = productDAO.getListByPage(productList, start, end);
        int count=0;
        count = countProductInCart(count,req);
        req.setAttribute("count",count);
        req.setAttribute("page", page);
        req.setAttribute("num", num);
        req.setAttribute("categoryData", category);
        req.setAttribute("productData", product);
        req.setAttribute("brandData", brand);
        req.setAttribute("type", "low");
        req.getRequestDispatcher("/WEB-INF/admin/customer/product.jsp").forward(req, resp);
    }





    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "search":
                searchProduct(req,resp);
                break;
            case "showlistByPrice":
                searchProductByPrice(req,resp);
                break;
            case "updateProductMemory":
                editProduct(req,resp);
                break;
            default:
        }
    }

    private void searchProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("text");
        List<Product> productList = productDAO.SearchAll(search);
        List<Category> category = productDAO.getCategory();
        int page, numperpage = 9;
        int size = productList.size();
        int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);//so trang
        String xpage = req.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        List<Product> product = productDAO.getListByPage(productList, start, end);
        int count=0;
        count = countProductInCart(count,req);
        req.setAttribute("count",count);
        req.setAttribute("page", page);
        req.setAttribute("num", num);
        req.setAttribute("categoryData", category);
        req.setAttribute("productData", product);
        req.getRequestDispatcher("/WEB-INF/admin/customer/product.jsp").forward(req, resp);
    }

    private void searchProductByPrice(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long productPriceMin = Integer.parseInt(req.getParameter("minPrice"));
        long productPriceMax = Integer.parseInt(req.getParameter("maxPrice"));

        List<Product> productListByPrice = productDAO.getProductByPrice(productPriceMin, productPriceMax);
        List<Category> category = productDAO.getCategory();
        int page, numperpage = 9;
        int size = productListByPrice.size();
        int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);//so trang
        String xpage = req.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        List<Product> product = productDAO.getListByPage(productListByPrice, start, end);
        int count=0;
        count = countProductInCart(count,req);
        req.setAttribute("count",count);
        req.setAttribute("page", page);
        req.setAttribute("num", num);
        req.setAttribute("categoryData", category);
        req.setAttribute("productDataByPrice", productListByPrice);
        req.getRequestDispatcher("/WEB-INF/admin/customer/product.jsp").forward(req, resp);
    }
    private void searchProductByPriceSlider(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double productPriceMin = Double.parseDouble(req.getParameter("price-min"));
        double productPriceMax = Double.parseDouble(req.getParameter("price-max"));

        List<Product> productListByPrice = productDAO.getProductByPrice((long) productPriceMin, (long) productPriceMax);
        List<Category> category = productDAO.getCategory();
        int page, numperpage = 9;
        int size = productListByPrice.size();
        int num = (size % 9 == 0 ? (size / 9) : ((size / 9)) + 1);//so trang
        String xpage = req.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numperpage;
        end = Math.min(page * numperpage, size);
        List<Product> product = productDAO.getListByPage(productListByPrice, start, end);
        int count=0;
        count = countProductInCart(count,req);
        req.setAttribute("count",count);
        req.setAttribute("page", page);
        req.setAttribute("num", num);
        req.setAttribute("categoryData", category);
        req.setAttribute("productData", productListByPrice);

        req.setAttribute("productPriceMin", productPriceMin);
        req.setAttribute("productPriceMax", productPriceMax);
        req.getRequestDispatcher("/WEB-INF/admin/customer/product.jsp").forward(req, resp);
    }

}
