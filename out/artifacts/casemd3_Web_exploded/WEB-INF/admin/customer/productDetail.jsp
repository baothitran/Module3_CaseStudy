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

<%--    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">--%>

    <link rel="stylesheet" href="/assets/slide/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/assets/slide/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/4.5.6/css/ionicons.min.css">
<%--    <link rel="stylesheet" href="/assets/slide/css/style.css">--%>
    <jsp:include page="/WEB-INF/admin/layout/navbar.jsp"/>
</header>
<!-- /NAVIGATION -->

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">

    <!-- Button trigger modal -->
    <!-- Trigger the modal with a button -->
    <div class="modal fade" id="myModal" role="dialog">
        <c:if test="${user.getUserName() != null}">

        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Confirm Order</h4>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <thead>
                        <tr class="text-center">
                            <th class="text-center" scope="col">Customer Name</th>
                            <th class="text-center" scope="col">Product Name</th>
                            <th class="text-center" scope="col">Category</th>
                            <th class="text-center" scope="col">Memory</th>
                            <th class="text-center" scope="col">Color</th>
                            <th class="text-center" scope="col">Quantity</th>
                            <th class="text-center" scope="col">Price</th>
                            <th class="text-center" scope="col">Total Price</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="text-center">

                                <th scope="row">${user.getUserName()}</th>

                            <td id="productNameModal">${productData.getProductName()}</td>
                            <c:if test="${category.getCategoryId() == productData.getCategoryId()}">
                                <td>${category.getCategoryName()}</td>
                            </c:if>
                            <td id="memoryModal"></td>
                            <td id="colorModal"></td>
                            <td id="quantityModal"></td>
                            <td id="priceModal"></td>
                            <td id="totalAmountModal"></td>


                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">Add </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
        </c:if>
        <c:if test="${user.getUserName() == null}">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Mua Hàng Thất Bại</h4>
                    </div>
                    <div class="modal-body">
                        <h1 style="color:red;">VUI LÒNG ĐĂNG NHẬP ĐỂ MUA HÀNG !!!</h1>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </c:if>
    </div>


    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb-tree">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">All Categories</a></li>
                    <li><a href="#">Accessories</a></li>
                    <li><a href="#">Headphones</a></li>
                    <li class="active">Product name goes here</li>
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
            <!-- Product main img -->

            <div class="col-md-5 col-md-push-2">
                <div id="product-main-img">
                    <c:forEach items="${requestScope.listAvatar}" var="l">
                        <c:if test="${l.getProductId() == productData.getProductId()}">
                            <img src="/assets/img/${l.getProductImg()}" alt="">
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <!-- /Product main img -->

            <!-- Product thumb imgs -->
            <div class="col-md-2  col-md-pull-5">
                <div id="product-imgs">
                    <c:forEach items="${requestScope.listAvatar}" var="l">
                        <c:if test="${l.getProductId() == productData.getProductId()}">
                            <img src="/assets/img/${l.getProductImg()}" alt="">
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <!-- /Product thumb imgs -->

            <!-- Product details -->

                <div class="col-md-5">
                    <div class="product-details">
                        <h2 class="product-name" name="productName">${productData.getProductName()}</h2>
                        <div>
                            <div class="product-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                        </div>
                        <div>
                            <h3 class="product-price" name="price" id="priceData">${productData.getProductPrice()}</h3>
                            <span class="product-available">Còn hàng</span>
                        </div>
                        <p>${productData.getProductDescribe()}</p>

                        <div class="product-options">
                            <label>
                                Bộ nhớ
                                <select class="input-select" name="memory" id="memoryData">
                                    <c:forEach items="${requestScope.memoryData}" var="me">
                                        <option
                                                value="${me.getMemory()}">${me.getMemory()}
                                        </option>
                                    </c:forEach>
                                </select>
                            </label>
                            <label>
                                Color
                                <select class="input-select" name="color" id="colorData">
                                    <c:forEach items="${requestScope.colorData}" var="cd">
                                        <option
                                                value="${cd.getColor()}">${cd.getColor()}
                                        </option>
                                    </c:forEach>
                                </select>
                            </label>
                        </div>

                        <div class="add-to-cart">
                            <div class="qty-label">
                                Số lượng
                                <div class="input-number">
                                    <input name="quantity" type="number" id="inputNumberValue" min="1" value="1" max="100">
                                    <span class="qty-up">+</span>
                                    <span class="qty-down">-</span>
                                </div>
                            </div>
                            <button class="add-to-cart-btn" id="btnAddToModal" data-toggle="modal" data-target="#myModal"><i class="fa fa-shopping-cart">
                            </i> add to cart</button>
                        </div>
                    </div>
                </div>

<%--------------------------------------------------%>

            <!-- /Product details -->

            <!-- Product tab -->
            <div class="col-md-12">
                <div id="product-tab">
                    <!-- product tab nav -->
                    <ul class="tab-nav">
                        <li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
                        <li><a data-toggle="tab" href="#tab2">Details</a></li>
                        <li><a data-toggle="tab" href="#tab3">Reviews (3)</a></li>
                    </ul>
                    <!-- /product tab nav -->

                    <!-- product tab content -->
                    <div class="tab-content">
                        <!-- tab1  -->
                        <div id="tab1" class="tab-pane fade in active">
                            <div class="row">
                                <div class="col-md-12">
                                    <p>${productData.getProductDescribe()}</p>
                                </div>
                            </div>
                        </div>
                        <!-- /tab1  -->

                        <!-- tab2  -->
                        <div id="tab2" class="tab-pane fade in">
                            <div class="row">
                                <div class="col-md-12">
                                    <p>${productData.getProductDescribe()}</p>
                                </div>
                            </div>
                        </div>
                        <!-- /tab2  -->

                        <!-- tab3  -->
                        <div id="tab3" class="tab-pane fade in">
                            <div class="row">
                                <!-- Rating -->
                                <div class="col-md-3">
                                    <div id="rating">
                                        <div class="rating-avg">
                                            <span>4.5</span>
                                            <div class="rating-stars">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>
                                        </div>
                                        <ul class="rating">
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: 80%;"></div>
                                                </div>
                                                <span class="sum">3</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: 60%;"></div>
                                                </div>
                                                <span class="sum">2</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div></div>
                                                </div>
                                                <span class="sum">0</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div></div>
                                                </div>
                                                <span class="sum">0</span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div></div>
                                                </div>
                                                <span class="sum">0</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /Rating -->

                                <!-- Reviews -->
                                <div class="col-md-6">
                                    <div id="reviews">
                                        <ul class="reviews">
                                            <li>
                                                <div class="review-heading">
                                                    <h5 class="name">Thi</h5>
                                                    <div class="review-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o empty"></i>
                                                    </div>
                                                </div>
                                                <div class="review-body">
                                                    <p>Sản phẩm dùng ok</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="review-heading">
                                                    <h5 class="name">Hoàn</h5>
                                                    <div class="review-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o empty"></i>
                                                    </div>
                                                </div>
                                                <div class="review-body">
                                                    <p>Mượt chụp ảnh đẹp, mỗi tội pin ko lâu như mong đợi. Xài từ sáng đến chiều là đã hết sạch pin</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="review-heading">
                                                    <h5 class="name">Đạt</h5>
                                                    <div class="review-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o empty"></i>
                                                    </div>
                                                </div>
                                                <div class="review-body">
                                                    <p>Dt sai đc 2 tuần,OK hết,man hình hoi nhỏ,ai muốn man hình OK thì sai 14plus…</p>
                                                </div>
                                            </li>
                                        </ul>
                                        <ul class="reviews-pagination">
                                            <li class="active">1</li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /Reviews -->

                                <!-- Review Form -->
                                <div class="col-md-3">
                                    <div id="review-form">
                                        <form class="review-form">
                                            <input class="input" type="text" placeholder="Your Name">
                                            <input class="input" type="email" placeholder="Your Email">
                                            <textarea class="input" placeholder="Your Review"></textarea>
                                            <div class="input-rating">
                                                <span>Your Rating: </span>
                                                <div class="stars">
                                                    <input id="star5" name="rating" value="5" type="radio"><label
                                                        for="star5"></label>
                                                    <input id="star4" name="rating" value="4" type="radio"><label
                                                        for="star4"></label>
                                                    <input id="star3" name="rating" value="3" type="radio"><label
                                                        for="star3"></label>
                                                    <input id="star2" name="rating" value="2" type="radio"><label
                                                        for="star2"></label>
                                                    <input id="star1" name="rating" value="1" type="radio"><label
                                                        for="star1"></label>
                                                </div>
                                            </div>
                                            <button class="primary-btn">Submit</button>
                                        </form>
                                    </div>
                                </div>
                                <!-- /Review Form -->
                            </div>
                        </div>
                        <!-- /tab3  -->
                    </div>
                    <!-- /product tab content  -->
                </div>
            </div>
            <!-- /product tab -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- Section -->
<section class="ftco-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <h2 class="heading-section mb-5 pb-md-4">Related Products</h2>
            </div>
            <div class="col-md-12">
                <div class="featured-carousel owl-carousel">
                    <c:forEach items="${requestScope.productByCategory}" var="p">
                        <div class="item">
<%--                            <div class="col-md-3 col-xs-6">--%>
                                <div class="product">
                                    <div class="product-img">
                                        <img src="/assets/img/${p.getProductImg()}" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">Category</p>
                                        <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                        <h4 class="product-price">$980.00
                                            <del class="product-old-price">$990.00</del>
                                        </h4>
                                        <div class="product-rating">
                                        </div>
                                        <div class="product-btns">
                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                    class="tooltipp">add to wishlist</span>
                                            </button>
                                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span
                                                    class="tooltipp">add to compare</span>
                                            </button>
                                            <button class="quick-view"><i class="fa fa-eye"></i><span
                                                    class="tooltipp">quick view</span>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add
                                            to cart
                                        </button>
                                    </div>
<%--                                </div>--%>
                            </div>
                        </div>
                    </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%--<section class="product_section womens_product bottom">--%>
<%--    <div class="container">--%>
<%--        <!-- row -->--%>
<%--        <div class="row">--%>

<%--            <div class="col-md-12">--%>
<%--                <div class="section-title text-center">--%>
<%--                    <h3 class="title">Related Products</h3>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="product_area">--%>
<%--            <div class="row">--%>
<%--                <div class="product_carousel product_three_column4 owl-carousel">--%>
<%--           --%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<%--<div class="section">--%>
<%--    <!-- container -->--%>
<%--    <div class="container">--%>
<%--        <!-- row -->--%>
<%--        <div class="row">--%>

<%--            <div class="col-md-12">--%>
<%--                <div class="section-title text-center">--%>
<%--                    <h3 class="title">Related Products</h3>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <!-- product -->--%>
<%--        <div class="row">--%>
<%--            <div class="col-xs-12 col-sm-12 col-md-12">--%>
<%--                <div class="carousel carousel-showmanymoveone slide" id="itemslider">--%>
<%--                    <div class="carousel-inner">--%>
<%--                       --%>
<%--                    </div>--%>

<%--                    <div id="slider-control">--%>
<%--                        <a class="left carousel-control" href="#itemslider" data-slide="prev"><img--%>
<%--                                src="https://cdn0.iconfinder.com/data/icons/website-kit-2/512/icon_402-512.png"--%>
<%--                                alt="Left" class="img-responsive"></a>--%>
<%--                        <a class="right carousel-control" href="#itemslider" data-slide="next"><img--%>
<%--                                src="http://pixsector.com/cache/81183b13/avcc910c4ee5888b858fe.png" alt="Right"--%>
<%--                                class="img-responsive"></a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>


<%--    </div>--%>
<%--    <!-- /row -->--%>
<%--</div>--%>
<!-- /container -->
</div>
<!-- /Section -->

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
<jsp:include page="/WEB-INF/admin/layout/footer.jsp"/>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<jsp:include page="/WEB-INF/admin/layout/script.jsp"/>

<script>
    let btnAddToModal = document.getElementById("btnAddToModal");
    btnAddToModal.addEventListener("click", function (){
        let memory = document.getElementById("memoryData").value
        let color = document.getElementById("colorData").value
        let quantity = +document.getElementById("inputNumberValue").value
        let price = document.getElementById("priceData").innerHTML
        let totalAmount = quantity * price
        document.getElementById("memoryModal").innerHTML = memory;
        document.getElementById("colorModal").innerHTML = color;
        document.getElementById("priceModal").innerHTML = price;
        document.getElementById("totalAmountModal").innerHTML = totalAmount;
        document.getElementById("quantityModal").innerHTML = quantity;
        console.log(totalAmount);
        console.log(memory);
        console.log(quantity);
        console.log(color);
        console.log(price);
    })
</script>

</body>
</html>
