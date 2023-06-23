package com.cg.case_m3.controller;

import com.cg.case_m3.DAO.ProductDAO;
import com.cg.case_m3.model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/cart")
public class CartServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {

            case "showCart":
                showCart(req,resp);
                break;
            case "add":
                //http://localhost:8080/cart?action=add&id=3&memory_id=1&color=1&quantity=5
                //http://localhost:8080/cart?action=increase&id=1&memory_id=1&color=1&quantity=1
                //http://localhost:8080/cart?action=decrease&id=1&memory_id=1&color=1&quantity=1
                //http://localhost:8080/cart?action=update&id=1&memory_id=1&color=1&quantity=10
                addCart(req, resp);
                break;
            case "increase":
                increaseCart(req, resp);
                break;
            case "decrease":
                decreaseCart(req, resp);
                break;
            case "update":
                updateCart(req, resp);
                break;
            case "delete":
                showDelete(req,resp);
                break;
            default:
                showProductDetail(req,resp);
                break;
        }
    }

    private void showProductDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("product_id");
        List<Color> colorId = productDAO.getColorByProductID(productId);
        List<Memory> memoryId = productDAO.getMemoryByProductID(productId);
        List<Color> color = productDAO.getColor();
        List<Memory> memory = productDAO.getMemory();
        List<ListAvatar> listAvatar = productDAO.getListAvatarByID(productId);
        Product product = productDAO.getProductByID(productId);
        int count = 0;
        count = countProductInCart(count, req);
        if (product == null) {
            req.getRequestDispatcher("/404.jsp").forward(req, resp);
        }
        int categoryId = product.getCategoryId();
        List<Product> productByCategory = productDAO.getProductByCategory(categoryId);
        Category category = productDAO.getCategoryById(categoryId);
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
        req.setAttribute("count",count);
        req.getRequestDispatcher("/WEB-INF/admin/customer/productDetail.jsp").forward(req,resp);
    }

    private void showDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/admin/cart/cart.jsp").forward(req,resp);
    }

    private void updateCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cart cart = null;
        cart = (Cart) req.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        int idProduct = Integer.parseInt(req.getParameter("product_id"));
        Product product = productDAO.getProductByID(idProduct + "");
        int colorId = Integer.parseInt(req.getParameter("colorCart"));
        Color color = productDAO.getColorByColorID(colorId);
        int memoryId = Integer.parseInt(req.getParameter("memoryCart"));
        Memory memory = productDAO.getMemoryByMemoryID(memoryId);
        Long price = Long.valueOf(req.getParameter("priceCartItem"));
        int quantity = 1;
        if (req.getParameter("quantityCart") != null) {
            quantity = Integer.parseInt(req.getParameter("quantityCart"));
        }

        updateCart(product, colorId, memoryId,price,color.getColor(),memory.getMemory(), quantity, cart, req);
        showCart(req, resp);
    }

    private void decreaseCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cart cart = null;
        cart = (Cart) req.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        int idProduct = Integer.parseInt(req.getParameter("product_id"));
        Product product = productDAO.getProductByID(idProduct + "");
        int colorId = Integer.parseInt(req.getParameter("colorCart"));
        Color color = productDAO.getColorByColorID(colorId);
        int memoryId = Integer.parseInt(req.getParameter("memoryCart"));
        Memory memory = productDAO.getMemoryByMemoryID(memoryId);
        Long price = Long.valueOf(req.getParameter("priceCartItem"));
        int quantity = 1;
        if (req.getParameter("quantityCart") != null) {
            quantity = Integer.parseInt(req.getParameter("quantityCart"));
        }
        int oldQuantity = getQuantityProductInCartById(product,colorId, memoryId, cart);
        cart.updateTotal();
        updateCart(product, colorId, memoryId,price,color.getColor(),memory.getMemory(), oldQuantity - 1, cart, req);
        showCart(req,resp);
    }

    private void addCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cart cart = null;
        cart = (Cart) req.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        int idProduct = Integer.parseInt(req.getParameter("product_id"));
        Product product = productDAO.getProductByID(idProduct + "");
        int colorId = Integer.parseInt(req.getParameter("colorCart"));
        Color color = productDAO.getColorByColorID(colorId);
        int memoryId = Integer.parseInt(req.getParameter("memoryCart"));
        Memory memory = productDAO.getMemoryByMemoryID(memoryId);
        long price = Long.parseLong(req.getParameter("priceCart"));
        int quantity = 1;
        if (req.getParameter("quantityCart") != null) {
            quantity = Integer.parseInt(req.getParameter("quantityCart"));
        }
        updateCartInOrder(product, colorId,price, memoryId,color.getColor(),memory.getMemory(), quantity, cart, req);
        showProductDetail(req, resp);

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

    private void increaseCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cart cart = null;
        cart = (Cart) req.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        int idProduct = Integer.parseInt(req.getParameter("product_id"));
        Product product = productDAO.getProductByID(idProduct + "");
        int colorId = Integer.parseInt(req.getParameter("colorCart"));
        Color color = productDAO.getColorByColorID(colorId);
        int memoryId = Integer.parseInt(req.getParameter("memoryCart"));
        Memory memory = productDAO.getMemoryByMemoryID(memoryId);
        Long price = Long.valueOf(req.getParameter("priceCartItem"));
        int quantity = 1;
        if (req.getParameter("quantityCart") != null) {
            quantity = Integer.parseInt(req.getParameter("quantityCart"));
        }
        int oldQuantity = getQuantityProductInCartById(product,colorId, memoryId, cart);
        cart.updateTotal();
        updateCart(product, colorId, memoryId,price,color.getColor(),memory.getMemory(), oldQuantity + 1, cart, req);
        showCart(req,resp);
    }

    private int getQuantityProductInCartById(Product product,int color, int memory, Cart cart) {
        for (CartItem item : cart.getCartItems()) {
            Product p = item.getProduct();
            if (p.getProductId() == product.getProductId() && p.getColorId() == color && p.getMemoryId() == memory) {
                return item.getQuantity();
            }
        }
        return -1;
    }

    public void updateCart(Product product, int colorId, int memoryId,Long price, String colorName, String memoryName,  int quantity, Cart cart, HttpServletRequest req) {
        if (cart.getCartItems() == null) {
            List<CartItem> cartItems = new ArrayList<>();
            product.setColorId(colorId);
            product.setMemoryId(memoryId);
            long totalAmountItem = quantity * price;
            CartItem cartItem = new CartItem(product, quantity, price, colorId, memoryId, memoryName,colorName,totalAmountItem);
            cartItems.add(cartItem);
            cart.setCartItems(cartItems);
        }else{
            boolean check = checkIdProductExistCart(product.getProductId(), colorId, memoryId, cart);
            if (check == true) {
                updateProductInCart(product.getProductId(),price,colorId, memoryId, quantity, cart);
            }else{
                addProductToCart(product, quantity,price, cart, colorId, memoryId, memoryName,colorName);
            }
        }
        cart.updateTotal();
        req.getSession().setAttribute("cart", cart);
    }


    public void updateCartInOrder(Product product, int colorId,Long price, int memoryId, String colorName, String memoryName,  int quantity, Cart cart, HttpServletRequest req) {
        if (cart.getCartItems() == null) {
            List<CartItem> cartItems = new ArrayList<>();
            product.setColorId(colorId);
            product.setMemoryId(memoryId);
            long totalAmountItem = quantity * price;
            CartItem cartItem = new CartItem(product, quantity, price, colorId, memoryId, memoryName,colorName,totalAmountItem);
            cartItems.add(cartItem);
            cart.setCartItems(cartItems);
        }else{
            boolean check = checkIdProductExistCart(product.getProductId(), colorId, memoryId, cart);
            if (check == true) {
                updateProductInOrder(product.getProductId(),colorId, memoryId, quantity, cart);
            }else{
                addProductToCart(product, quantity,price, cart,  colorId, memoryId, memoryName,colorName);
            }
        }
        cart.updateTotal();
        req.getSession().setAttribute("cart", cart);
    }




    private void addProductToCart(Product product, int quantity,Long price, Cart cart, int colorId, int memoryId,String memoryName,String colorName) {
        product.setColorId(colorId);
        product.setMemoryId(memoryId);
        long totalAmountItem = quantity * price;
        CartItem cartItem = new CartItem(product, quantity, price, colorId, memoryId,memoryName,colorName,totalAmountItem);
        cart.getCartItems().add(cartItem);
    }

    private void updateProductInCart(int idProduct,Long price,int color, int memory, int quantity, Cart cart) {
        for (int i = 0; i < cart.getCartItems().size(); i++) {
            CartItem item = cart.getCartItems().get(i);
            if (item.getProduct().getProductId() == idProduct && item.getColor() == color && item.getMemory() == memory && item.getPrice() == price ) {
                CartItem temp = cart.getCartItems().get(i);
                temp.setQuantity(quantity);
                temp.updateTotalItem();
                break;
            }
        }
    }

    private void updateProductInOrder(int idProduct,int color, int memory, int quantity, Cart cart) {
        for (int i = 0; i < cart.getCartItems().size(); i++) {
            CartItem item = cart.getCartItems().get(i);
            if (item.getProduct().getProductId() == idProduct && item.getColor() == color && item.getMemory() == memory ) {
                CartItem temp = cart.getCartItems().get(i);
                int newQuantity = temp.getQuantity() + quantity;
                temp.setQuantity(newQuantity);
                temp.updateTotalItem();
                break;
            }
        }
    }

    private boolean checkIdProductExistCart(int idProduct,int color, int memory, Cart cart) {
        if (cart.getCartItems() == null) {
            return false;
        }
        for (int i = 0; i < cart.getCartItems().size(); i++) {
            Product product = cart.getCartItems().get(i).getProduct();
            if (product.getProductId() == idProduct && product.getColorId() == color && product.getMemoryId() == memory) {
                return true;
            }
        }
        return false;
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




    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                deleteCart(req,resp);
                break;
        }
    }

    private void deleteCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cart cart = null;
        cart = (Cart) req.getSession().getAttribute("cart");

        int idProduct = Integer.parseInt(req.getParameter("product_id"));
        int colorId = Integer.parseInt(req.getParameter("color_id"));
        int memoryId = Integer.parseInt(req.getParameter("memory_id"));

        deleteProductInCart(idProduct, colorId,memoryId, cart);
        showCart(req,resp);

    }

    private void deleteProductInCart(int idProduct,int color, int memory, Cart cart) throws IOException {
        for (int i = 0; i < cart.getCartItems().size(); i++) {
            CartItem item = cart.getCartItems().get(i);
            if (item.getProduct().getProductId() == idProduct && item.getColor() == color && item.getMemory() == memory ) {
                cart.getCartItems().remove(i);
                cart.updateTotal();
                break;
            }
        }
    }

//    private List<CartItem> removeItemInCart(int idProduct,int color, int memory, Cart cart) {
//        List<CartItem> cartItems = cart.getCartItems();
//        for (int i=0; i<cartItems.size();i++) {
//            if (cartItems.get(i).getProduct().getProductId() == idProduct && cartItems.get(i).getProduct().getColorId() == color && cartItems.get(i).getProduct().getMemoryId() == memory) {
//                cartItems.remove(i);
//            }
//        }
//        return cartItems;
//    }

//product.getProductId() == idProduct && product.getColorId() == color && product.getMemoryId() == memory
}
