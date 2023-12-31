<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Electro - HTML Ecommerce Template</title>
    <jsp:include page="/WEB-INF/admin/layout/head.jsp"/>

</head>
<body>
<!-- HEADER -->
<header>
    <!-- TOP HEADER -->

    <!-- /MAIN HEADER -->
    <jsp:include page="/WEB-INF/admin/layout/navbar.jsp"/>
</header>
<!-- /HEADER -->


<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb-tree">
                    <li><a href="home">Home</a></li>
                    <li><a href="#">Accessories</a></li>
                    <li class="active">All Categories (227,490 Results)</li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- ASIDE -->
            <div id="aside" class="col-md-3">
                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Categories</h3>
                    <div class="checkbox-filter">
                        <c:forEach items="${requestScope.categoryData}" var="c">
                            <div class="input-checkbox">
                                <label for="${b.getCategoryId()}">
                                    <span></span>
                                    <a href="product?action=listByCategory&categoryId=${c.getCategoryId()}">${c.getCategoryName()}</a>
                                    <small>(578)</small>
                                </label>
                            </div>
                        </c:forEach>

                        <div class="input-checkbox">
                            <label>
                                <span></span>
                                Camera
                                <small>(1450)</small>
                            </label>
                        </div>

                        <div class="input-checkbox">
                            <label>
                                <span></span>
                                Accessories
                                <small>(578)</small>
                            </label>
                        </div>

                    </div>
                </div>
                <!-- /aside Widget -->

                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Price</h3>
                    <div class="price-filter">
                        <div id="price-slider"></div>


                        <div class="input-number price-min">
                            <input id="price-min" type="number">
                            <span class="qty-up">+</span>
                            <span class="qty-down">-</span>
                        </div>
                        <span>-</span>
                        <div class="input-number price-max">
                            <input id="price-max" type="number">
                            <span class="qty-up">+</span>
                            <span class="qty-down">-</span>
                        </div>
                    </div>
                </div>
                <!-- /aside Widget -->

                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Brand</h3>
                    <div class="checkbox-filter">
                        <c:forEach items="${requestScope.brandData}" var="b">
                            <div class="input-checkbox">

                                <label for="${b.getBrandId()}">
                                    <span></span>
                                    <a href="product?action=listByBrand&brandId=${b.getBrandId()}">${b.getBrandName()}</a>
                                    <small>(578)</small>
                                </label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- /aside Widget -->

                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Top selling</h3>
                    <div class="product-widget">
                        <div class="product-img">
                            <img src="./img/product01.png" alt="">
                        </div>
                        <div class="product-body">
                            <p class="product-category">Category</p>
                            <h3 class="product-name"><a href="#">product name goes here</a></h3>
                            <h4 class="product-price">$980.00
                                <del class="product-old-price">$990.00</del>
                            </h4>
                        </div>
                    </div>

                    <div class="product-widget">
                        <div class="product-img">
                            <img src="./img/product02.png" alt="">
                        </div>
                        <div class="product-body">
                            <p class="product-category">Category</p>
                            <h3 class="product-name"><a href="#">product name goes here</a></h3>
                            <h4 class="product-price">$980.00
                                <del class="product-old-price">$990.00</del>
                            </h4>
                        </div>
                    </div>

                    <div class="product-widget">
                        <div class="product-img">
                            <img src="./img/product03.png" alt="">
                        </div>
                        <div class="product-body">
                            <p class="product-category">Category</p>
                            <h3 class="product-name"><a href="#">product name goes here</a></h3>
                            <h4 class="product-price">$980.00
                                <del class="product-old-price">$990.00</del>
                            </h4>
                        </div>
                    </div>
                </div>
                <!-- /aside Widget -->
            </div>
            <!-- /ASIDE -->

            <!-- STORE -->
            <div id="store" class="col-md-9">
                <!-- store top filter -->
                <div class="store-filter clearfix">
                    <div class="store-sort">
                        <label>
                            Sort By:
                            <select class="input-select" onchange="sortProducts(this)">
                                <option value="0">..........</option>
                                <option value="1" <c:if test="${type == 'low'}">selected</c:if> >Giá từ thấp đến cao</option>
                                <option value="2" <c:if test="${type == 'hight'}">selected</c:if> >Giá từ cao đến thấp</option>
                                <option value="3" <c:if test="${type == 'a-z'}">selected</c:if> >Từ A-Z</option>
                            </select>
                        </label>
                        <label>
                            Show:
                            <select class="input-select">
                                <option value="0" >20</option>
                                <option value="1" >50</option>
                            </select>
                        </label>
                    </div>
                    <ul class="store-grid">
                        <li class="active"><i class="fa fa-th"></i></li>
                        <li><a href="#"><i class="fa fa-th-list"></i></a></li>
                    </ul>
                </div>
                <!-- /store top filter -->

                <!-- store products -->
                <div class="row">
                    <!-- product -->
                    <c:forEach items="${requestScope.productData}" var="p">
                        <div class="col-md-4 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <a class="primary_img"
                                       href="product?action=productDetail&product_id=${p.getProductId()}"><img
                                            src="/assets/img/${p.getProductImg()}" alt=""
                                            style="width: 100%; height: 250px"></a>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">${p.getCategory().getCategoryName()}</p>
                                    <h3 class="product-name"><a
                                            href="product?action=productDetail&product_id=${p.getProductId()}">${p.getProductName()}</a>
                                    </h3>
                                    <h4 class="product-price">${p.getProductPrice()}</h4>
                                    <div class="product-rating">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <div class="product-btns">
                                        <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                class="tooltipp">add to wishlist</span></button>
                                        <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                class="tooltipp">add to compare</span></button>
                                        <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <!-- /product -->

                    <!-- /store products -->

                    <!-- store bottom filter -->
                    <c:set var="page" value="${requestScope.page}"/>
                    <div class="store-filter clearfix">
                        <span class="store-qty">Showing 20-100 products</span>
                        <ul class="store-pagination">
                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                <li class="${i==page?"current":""}"><a href="product?page=${i}">${i}</a></li>
                            </c:forEach>
                        </ul>
                    </div>

                    <!-- /store bottom filter -->
                </div>
                <!-- /STORE -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /SECTION -->

    <!-- NEWSLETTER -->
    <div id="newsletter" class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="newsletter">
                        <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                        <form>
                            <input class="input" type="email" placeholder="Enter Your Email">
                            <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                        </form>
                        <ul class="newsletter-follow">
                            <li>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /NEWSLETTER -->

    <!-- FOOTER -->
    <footer id="footer">
        <!-- top footer -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-3 col-xs-6">
                        <div class="footer">
                            <h3 class="footer-title">About Us</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut.</p>
                            <ul class="footer-links">
                                <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                                <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                                <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-3 col-xs-6">
                        <div class="footer">
                            <h3 class="footer-title">Categories</h3>
                            <ul class="footer-links">
                                <li><a href="#">Hot deals</a></li>
                                <li><a href="#">Laptops</a></li>
                                <li><a href="#">Smartphones</a></li>
                                <li><a href="#">Cameras</a></li>
                                <li><a href="#">Accessories</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="clearfix visible-xs"></div>

                    <div class="col-md-3 col-xs-6">
                        <div class="footer">
                            <h3 class="footer-title">Information</h3>
                            <ul class="footer-links">
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Contact Us</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Orders and Returns</a></li>
                                <li><a href="#">Terms & Conditions</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-3 col-xs-6">
                        <div class="footer">
                            <h3 class="footer-title">Service</h3>
                            <ul class="footer-links">
                                <li><a href="#">My Account</a></li>
                                <li><a href="#">View Cart</a></li>
                                <li><a href="#">Wishlist</a></li>
                                <li><a href="#">Track My Order</a></li>
                                <li><a href="#">Help</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /top footer -->

        <!-- bottom footer -->
        <div id="bottom-footer" class="section">
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12 text-center">
                        <ul class="footer-payments">
                            <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                            <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                            <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                            <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                            <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                            <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                        </ul>
                        <span class="copyright">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i
                                class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com"
                                                                                    target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</span>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /bottom footer -->
    </footer>
    <!-- /FOOTER -->

    <!-- jQuery Plugins -->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.11/sweetalert2.all.min.js"
            integrity="sha512-sZf2OK8od53udtGBBdzSqg3BGjjL3BpM5K4dQgB0mmhumO07aWOLmBK917w5cbdLWPfILjJzKgJcYm+neEBUDw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <jsp:include page="/WEB-INF/admin/layout/script.jsp"/>

    <script>
        function sortProducts(selectElement) {
            var selectedOption = selectElement.options[selectElement.selectedIndex];
            var value = +selectedOption.value;
            var url;

            if (value == 0) {
                url = "product";
            } else if (value == 1) {
                url = "product?action=sortProductByPriceDesc&type=high";
            } else if (value == 2) {
                url = "product?action=sortProductByPriceDesc&type=high";
            } else if (value == 3) {
                url = "product?action=sortProductByName&type=a-z";
            }
            console.log(url)
            if (url) {
                window.location.assign(url)
            }
        }
    </script>

</body>
</html>
