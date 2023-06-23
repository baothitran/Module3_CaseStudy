
<%@ page import="com.cg.case_m3.model.Product" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>DTH Store</title>
    <jsp:include page="/WEB-INF/admin/layout/head.jsp"/>
</head>
<body>
<header>
<%--    <link rel="stylesheet" href="/assets/slide/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/assets/slide/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/assets/slide/css/owl.theme.default.min.css">
    <jsp:include page="/WEB-INF/admin/layout/navbar.jsp"/>
</header>
<div class="modal fade" id="modalConfirmProduct" role="dialog">
    <c:if test="${user.getUserName() != null}">
        <form action="/cart" method="get">
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
                                <td>${user.getUserName()}</td>
                                <input hidden="hidden" id="productIdModal" name="product_id">
                                <td id="productNameModal">${productData.getProductName()}</td>
                                <c:if test="${category.getCategoryId() == productData.getCategoryId()}">
                                    <td>${category.getCategoryName()}</td>
                                </c:if>
                                <td id="memoryName"></td>
                                <input type="hidden" name="action" value="add" />
                                <input hidden="hidden" id="memoryId" name="memoryCart">
                                <td id="colorName"></td>
                                <input hidden="hidden" id="colorId" name="colorCart">
                                <td><input style="width: 50px; height: 18px"  readonly class="form-control-plaintext" id="quantityModal" name="quantityCart"></td>
                                <td id="priceModal"></td>
                                <input type="hidden" id="priceCart" name="priceCart">
                                <td id="totalAmountModal" name="totalAmountCart"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Add To Cart </button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </form>
    </c:if>
    <c:if test="${user.getUserName() == null}">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3 class="modal-title .bg-primary.bg-gradient" style="color:red; font-weight: bold ">Order Failed</h3>
                </div>
                <div class="modal-body">
                    <h3 >PLEASE LOG IN TO ORDER!!!</h3>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </c:if>
</div>
<div id="breadcrumb" class="section">
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
                            <td id="quantityModal1"></td>
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
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb-tree">
                    <li><a href="#">Home</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="section">
    <div class="container">
        <div class="row">
            <div class="col-md-5 col-md-push-2">
                <div id="product-main-img">
                    <div class="product-preview">
                        <img src="/assets/img/${productData.getProductImg()}" alt="">
                    </div>
                    <c:forEach items="${requestScope.listAvatar}" var="l">
                        <c:if test="${l.getProductId() == productData.getProductId()}">
                            <div class="product-preview">
                                <img src="/assets/img/${l.getProductImg()}" alt="">
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div class="col-md-2  col-md-pull-5">
                <div id="product-imgs">
                    <div class="product-preview">
                        <img src="/assets/img/${productData.getProductImg()}" alt="">
                    </div>
                    <c:forEach items="${requestScope.listAvatar}" var="l">
                        <c:if test="${l.getProductId() == productData.getProductId()}">
                        <div class="product-preview">
                            <img src="/assets/img/${l.getProductImg()}" alt="" style="height: 155px">
                        </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
                <div class="col-md-5">
                    <div class="product-details">
                        <input hidden="hidden" id="productId" value="${productData.getProductId()}">
                        <h2 class="product-name" name="productName">${productData.getProductName()}</h2>
                        <div>
                            <div class="product-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                        </div>
                        <div>
                            <h3 class="product-price" name="priceHTML" id="priceData">${productData.getProduct_Price(productData.getProductPrice())}</h3>
                            <input type="hidden" name="newPricePro" id="defaultPrice" value="${productData.getProductPrice()}">
                            <input type="hidden" name="price" id="priceToModal">
                        </div>
                        <p>${productData.getProductDescribe()}</p>
                        <div class="product-options">
                            <label>
                                Bộ nhớ
                                <select class="input-select" name="memory" id="memoryData" onchange="handleMemoryChange()">
                                    <c:forEach items="${requestScope.memoryData}" var="me">
                                        <option
                                                value="${me.getMemoryId()}" >${me.getMemory()}
                                        </option>
                                    </c:forEach>
                                </select>
                            </label>
                            <label>
                                Color
                                <select class="input-select" name="color" id="colorData">
                                    <c:forEach items="${requestScope.colorData}" var="cd">
                                        <option
                                                value="${cd.getColorId()}"> ${cd.getColor()}
                                        </option>
                                    </c:forEach>
                                </select>
                            </label>
                        </div>
                        <div class="add-to-cart">
                            <div class="qty-label">
                                Số lượng
                                <div class="input-number">
                                    <input name="quantity" type="number" id="inputNumberValue" min="1" value="1" max="${productData.getQuantity()}">
                                    <span class="qty-up">+</span>
                                    <span class="qty-down">-</span>
                                </div>
                            </div>
                            <button type="button" class="add-to-cart-btn" id="btnAddToModal" data-toggle="modal" data-target="#modalConfirmProduct"><i class="fa fa-shopping-cart">
                            </i> add to cart</button>
                        </div>
                    </div>
                </div>
            <div class="col-md-12">
                <div id="product-tab">
                    <ul class="tab-nav">
                        <li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
                        <li><a data-toggle="tab" href="#tab2">Details</a></li>
                        <li><a data-toggle="tab" href="#tab3">Reviews (3)</a></li>
                    </ul>
                    <div class="tab-content">
                        <!-- tab1  -->
                        <div id="tab1" class="tab-pane fade in active">
                            <div class="row">
                                <div class="col-md-12">
                                    <p>${productData.getProductDescribe()}</p>
                                </div>
                            </div>
                        </div>
                        <div id="tab2" class="tab-pane fade in">
                            <div class="row">
                                <div class="col-md-12">
                                    <p>${productData.getProductDescribe()}</p>
                                </div>
                            </div>
                        </div>
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
</div>
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
                                        <a class="primary_img"
                                           href="product?action=productDetail&product_id=${p.getProductId()}"><img
                                                src="/assets/img/${p.getProductImg()}" alt=""></a>
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">${p.getCategory().getCategoryName()}</p>
                                        <h3 class="product-name"><a
                                                href="product?action=productDetail&product_id=${p.getProductId()}">${p.getProductName()}</a>
                                        </h3>
                                        <h4 class="product-price">${p.getProduct_Price(p.getProductPrice())}</h4>
                                        <div class="product-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</div>
<footer id="footer">
    <jsp:include page="/WEB-INF/admin/layout/footer.jsp"/>
</footer>
<jsp:include page="/WEB-INF/admin/layout/script.jsp"/>
<script>
    let btnAddToModal = document.getElementById("btnAddToModal");
    btnAddToModal.addEventListener("click", function (){
        let productId = document.getElementById("productId").value
        // let memoryName = document.getElementById("memoryData").find("option:selected").text
        let memoryId = document.getElementById("memoryData").value
        let memoryName = document.getElementById("memoryData").options[document.getElementById("memoryData").selectedIndex].text
        let colorName = document.getElementById("colorData").options[document.getElementById("colorData").selectedIndex].text
        // let colorName = document.getElementById("colorData").find("option:selected").text
        let colorId = document.getElementById("colorData").value
        let quantity = +document.getElementById("inputNumberValue").value
        let newPrice = +document.getElementById("priceToModal").value
        if(newPrice === 0) {
            let newPrice2 = +document.getElementById("defaultPrice").value
            document.getElementById("priceCart").value = newPrice2;
            document.getElementById("priceModal").innerHTML = newPrice2.toLocaleString('vi', {style : 'currency', currency : 'VND'});
            let totalAmount = quantity * newPrice2
            document.getElementById("totalAmountModal").innerHTML = totalAmount.toLocaleString('vi', {style : 'currency', currency : 'VND'});
        }else {
            document.getElementById("priceCart").value = newPrice;
            document.getElementById("priceModal").innerHTML = newPrice.toLocaleString('vi', {style : 'currency', currency : 'VND'});
            let totalAmount = quantity * newPrice
            document.getElementById("totalAmountModal").innerHTML = totalAmount.toLocaleString('vi', {style : 'currency', currency : 'VND'});
        }
        document.getElementById("memoryName").innerHTML = memoryName;
        document.getElementById("memoryId").value = memoryId;
        document.getElementById("colorName").innerHTML = colorName;
        document.getElementById("colorId").value = colorId;
        document.getElementById("quantityModal").value = quantity;
        document.getElementById("productIdModal").value = productId;
    })

    const formatter = new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND',
    });
    function handleMemoryChange(){
        let price = +document.getElementById("defaultPrice").value;
        let memoryId = +document.getElementById("memoryData").value;
        let memoryName = document.getElementById("memoryData").options[document.getElementById("memoryData").selectedIndex].text
        let newPrice = 0;
        if(memoryId === 1 || memoryName == "16gb"){
            if(memoryName == "16gb") {
                newPrice = price;
            }
        }else if(memoryId === 2 || memoryId === 3 || memoryId === 4 || memoryName == "32gb" || memoryName == "64gb" || memoryName == "128gb" ) {
           if(memoryName == "32gb"){
               memoryId = 2;
           }
           if(memoryName == "64gb"){
                memoryId = 3;
            }
            if(memoryName == "128gb"){
                memoryId = 4;
            }
            newPrice = +price + ((memoryId -1) * 2000000)
        } else if(memoryId === 5 || memoryId === 6 || memoryName == "256gb" || memoryName == "512gb") {
            if(memoryName == "256gb"){
                memoryId = 5;
            }
            if(memoryName == "512gb"){
                memoryId = 6;
            }
            newPrice = +price + ((memoryId -2) * 3000000)
        } else if(memoryId === 7 || memoryName == "1TB") {
            if(memoryName == "1TB"){
                memoryId = 7;
            }
            newPrice = +price + ((memoryId -4) * 6000000)
        }
        if(newPrice !==0){
            document.getElementById("priceToModal").value = newPrice;
        }
        const formattedPrice = formatter.format(newPrice);
        document.getElementById("priceData").innerHTML = formattedPrice;
    }


    var x = 1000;
    x = x.toLocaleString('vi', {style : 'currency', currency : 'VND'});
    console.log(x);


</script>

</body>
</html>
