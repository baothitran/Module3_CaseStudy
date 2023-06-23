 <!-- TOP HEADER -->
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page contentType="text/html" pageEncoding="UTF-8" %>
 <div id="top-header">
     <div class="container">
         <ul class="header-links pull-left">
             <li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
             <li><a href="#"><i class="fa fa-envelope-o"></i> email@email.com</a></li>
             <li><a href="#"><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</a></li>
         </ul>
         <ul class="header-links-drop pull-right">
             <c:if test="${sessionScope.user.getUserName() != null}">
                 <li role="presentation" class="dropdown"> <a href="#" class="dropdown-toggle text-dropdown" id="drop4" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> ${user.getUserName()} <span class="caret"></span> </a>
                     <ul class="dropdown-menu" id="menu1" aria-labelledby="drop4">
                         <li><a href="/login?action=myAccount">Đơn hàng của tôi</a></li>
                         <c:if test="${sessionScope.user.isAdmin() == true}">
                             <li><a href="/dashboard">Trang quản lý</a></li>
                         </c:if>
                         <li><a href="/login?action=logout">Đăng xuất</a></li>
                     </ul>
                 </li>
             </c:if>
             <c:if test="${sessionScope.user.getUserName() == null}">
                 <li>
                     <a href="/login?action=login" class="btn btn-secondary text-dropdown">Đăng nhập</a>
                     <a href="/login?action=register" class="btn btn-secondary text-dropdown">Đăng ký</a>
                 </li>
             </c:if>

         </ul>
     </div>
 </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="#" class="logo">
                            <img src="./img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form action="product?action=search" method="POST">
                            <select class="input-select" onchange="searchProducts(this)">
                                <option value="0">All Categories</option>
                                <option value="1"  >All Products</option>
                                <option value="2"  >Smartphones</option>
                                <option value="3" >Tablets</option>
                            </select>
                            <input name="text" class="input" placeholder="Search here">
                            <button type="submit" class="search-btn">Search</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Cart -->
                        <div>
                            <a  href="/cart?action=showCart">

                                <i class="fa fa-shopping-cart"></i>
                                <span>Your Cart</span>
                                <div class="qty">${requestScope.count}</div>
                            </a>
                        </div>
                        <!-- /Cart -->

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
<!-- /HEADER -->

<!-- NAVIGATION -->
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li class="active"><a href="home">Home</a></li>
                <li><a href="product">Product</a></li>
                <li><a href="product?action=listByCategory&categoryId=1">Smartphones</a></li>
                <li><a href="product?action=listByCategory&categoryId=2">Tablets</a></li>
                <li><a href="">Camera</a></li>
                <li><a href="">Accessories</a></li>
            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>

 <script>
     function searchProducts(selectElement) {
         var selectedOption = selectElement.options[selectElement.selectedIndex];
         var value = +selectedOption.value;
         var url;

         if (value == 0) {
             url = "";
         } else if (value == 1) {
             url = "product";
         } else if (value == 2) {
             url = "product?action=listByCategory&categoryId=1";
         } else if (value == 3) {
             url = "product?action=listByCategory&categoryId=2";
         }
         console.log(url)
         if (url) {
             window.location.assign(url)
         }
     }
 </script>