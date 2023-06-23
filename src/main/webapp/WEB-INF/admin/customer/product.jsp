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
                    <li class="active">All Categories</li>
                </ul>
            </div>
        </div>
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
                                </label>
                            </div>
                        </c:forEach>
                        <div class="input-checkbox">
                            <label>
                                <span></span>
                                Camera
                            </label>
                        </div>
                        <div class="input-checkbox">
                            <label>
                                <span></span>
                                Accessories
                            </label>
                        </div>

                    </div>
                </div>
                <div class="aside">
                    <h3 class="aside-title">Price</h3>
                    <div class="price-filter">
                        <div id="price-slider"></div>
                        <div class="input-number price-min">
                            <input name="minPrice" id="price-min" onchange="handleRangePriceChange()" type="number" value="valueMin">
                            <span class="qty-up">+</span>
                            <span class="qty-down">-</span>
                        </div>
                        <span>-</span>
                        <div class="input-number price-max">
                            <input name="maxPrice" id="price-max" onchange="handleRangePriceChange()" type="number" value="valueMax">
                            <span class="qty-up">+</span>
                            <span class="qty-down">-</span>
                        </div>
                    </div>
                </div>
                <div class="aside">
                    <h3 class="aside-title">Brand</h3>
                    <div class="checkbox-filter">
                        <c:forEach items="${requestScope.brandData}" var="b">
                            <div class="input-checkbox">

                                <label for="${b.getBrandId()}">
                                    <span></span>
                                    <a href="product?action=listByBrand&brandId=${b.getBrandId()}">${b.getBrandName()}</a>
                                </label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <div id="store" class="col-md-9">
                <div class="store-filter clearfix">
                    <div class="store-sort">
                        <label>
                            Sort By:
                            <select class="input-select" onchange="sortProducts(this)">
                                <option value="0">..........</option>
                                <option value="1" <c:if test="${type == 'low'}">selected</c:if> >Price Low to High</option>
                                <option value="2" <c:if test="${type == 'hight'}">selected</c:if> >Price High to Low</option>
                                <option value="3" <c:if test="${type == 'a-z'}">selected</c:if> >From A To Z</option>
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
                    <!-- /product -->

                    <!-- /store products -->

                    <!-- store bottom filter -->


                    <!-- /store bottom filter -->
                </div>
                <c:set var="page" value="${requestScope.page}"/>
                <div class="store-filter clearfix">
                    <span class="store-qty">Showing 20-100 products</span>
                    <ul class="store-pagination">
                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                            <li class="${i==page?"current":""}"><a href="product?page=${i}">${i}</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <!-- /STORE -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <footer id="footer">
        <!-- top footer -->
        <jsp:include page="/WEB-INF/admin/layout/footer.jsp"/>
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
                url = "product?action=sortProductByPriceAsc&type=low";
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
        function handleRangePriceChange(){
        }
        let valuesSlider = document.getElementById("price-slider");
        valuesSlider.noUiSlider.on('end', function( values, handle ) {
            let valueMin = values[0];
            let valueMax =  values[1];
            let url = `/product?action=showlistByPrice&price-min=\${valueMin}&price-max=\${valueMax}`;
            console.log(url)
            window.location.assign(url);
        });
        var min = "<%= request.getAttribute("productPriceMin")%>";
        var max = "<%= request.getAttribute("productPriceMax")%>";
        valuesSlider.noUiSlider.set([min + "", max + ""]);
    </script>

</body>
</html>
