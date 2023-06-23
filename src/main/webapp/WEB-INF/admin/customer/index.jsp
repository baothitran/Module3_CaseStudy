<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>DTH Store</title>
	<jsp:include page="/WEB-INF/admin/layout/head.jsp"/>

	<link rel="stylesheet" href="/assets/slide/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/assets/slide/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/4.5.6/css/ionicons.min.css">

<%--	<jsp:include page="/WEB-INF/admin/layout/script.jsp"/>--%>
</head>
<body>
<!-- HEADER -->
<header>
	<!-- TOP HEADER -->
	<!-- /MAIN HEADER -->
	<jsp:include page="/WEB-INF/admin/layout/navbar.jsp"/>
</header>
<!-- /HEADER -->

<!-- NAVIGATION -->
<!-- /NAVIGATION -->

<!-- SECTION -->
	<!-- container -->


<div id="owl-demo" class="owl-carousel owl-theme" >
		<div class="shop-img">
			<img src="/assets/img/anhqc3.png" alt="" style="height: 500px">
		</div>
		<div class="shop-img">
			<img src="/assets/img/anhqc6.jpg" alt="" style="height: 500px">
		</div>
		<div class="shop-img">
			<img src="/assets/img/anhqc7.jpg" alt="" style="height: 500px">
		</div>
		<div class="shop-img">
			<img src="/assets/img/anhqc5.jpg" alt="" style="height: 500px">
		</div>
		<div class="shop-img">
			<img src="/assets/img/anhqc4.jpg" alt="" style="height: 500px">
		</div>
</div>
<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">

			<!-- section title -->
			<div class="col-md-12">
				<div class="section-title">
					<h3 class="title">New Products</h3>
				</div>
			</div>
			<!-- /section title -->

			<!-- Products tab & slick -->
			<div class="col-md-12">
				<div class="row">
					<div class="products-tabs">
						<!-- tab -->
						<div id="tab1" class="tab-pane active">
							<div class="products-slick" data-nav="#slick-nav-1">
								<c:forEach items="${requestScope.productData}" var="p">
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
								</c:forEach>
							</div>
							<div id="slick-nav-1" class="products-slick-nav"></div>
						</div>
						<!-- /tab -->
					</div>
				</div>
			</div>
			<!-- Products tab & slick -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

<!-- HOT DEAL SECTION -->
<div href="/product?action=listByBrand&brandId=4" id="hot-deal" class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<div class="col-md-12">
				<div class="hot-deal">
					<ul class="hot-deal-countdown">
						<li>
							<div>
								<h3>02</h3>
								<span>Days</span>
							</div>
						</li>
						<li>
							<div>
								<h3>10</h3>
								<span>Hours</span>
							</div>
						</li>
						<li>
							<div>
								<h3>34</h3>
								<span>Mins</span>
							</div>
						</li>
						<li>
							<div>
								<h3>60</h3>
								<span>Secs</span>
							</div>
						</li>
					</ul>
					<h2 class="text-uppercase">hot deal this week</h2>
					<p>New Collection Up to 50% OFF</p>
					<a class="primary-btn cta-btn" href="#">Shop now</a>
				</div>
			</div>
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /HOT DEAL SECTION -->

<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">

			<!-- section title -->
			<div class="col-md-12">
				<div class="section-title">
					<h3 class="title">Top selling</h3>
				</div>
			</div>
			<!-- /section title -->

			<!-- Products tab & slick -->
			<div class="col-md-12">
				<div class="row">
					<div class="products-tabs">
						<!-- tab -->
						<div id="tab2" class="tab-pane fade in active">
							<div class="products-slick" data-nav="#slick-nav-2">
								<c:forEach items="${requestScope.productDataLimit5}" var="p5">
									<div class="product">
										<div class="product-img">
											<a class="primary_img"
											   href="product?action=productDetail&product_id=${p5.getProductId()}"><img
													src="/assets/img/${p5.getProductImg()}" alt=""
													style="width: 100%; height: 250px"></a>
										</div>
										<div class="product-body">
											<p class="product-category">${p5.getCategory().getCategoryName()}</p>
											<h3 class="product-name"><a
													href="product?action=productDetail&product_id=${p5.getProductId()}">${p5.getProductName()}</a>
											</h3>
											<h4 class="product-price">${p5.getProduct_Price(p5.getProductPrice())}</h4>
											<div class="product-rating">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<div id="slick-nav-2" class="products-slick-nav"></div>
						</div>
						<!-- /tab -->
					</div>
				</div>
			</div>
			<!-- /Products tab & slick -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->

<!-- /SECTION -->

<!-- NEWSLETTER -->

<!-- /NEWSLETTER -->

<!-- FOOTER -->
<footer id="footer">
	<!-- top footer -->
	<jsp:include page="/WEB-INF/admin/layout/footer.jsp"/>
</footer>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.11/sweetalert2.all.min.js"
		integrity="sha512-sZf2OK8od53udtGBBdzSqg3BGjjL3BpM5K4dQgB0mmhumO07aWOLmBK917w5cbdLWPfILjJzKgJcYm+neEBUDw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<jsp:include page="/WEB-INF/admin/layout/script.jsp"/>
</body>

<script>
	$(document).ready(function() {

		$("#owl-demo").owlCarousel({

			navigation : true, // Show next and prev buttons

			slideSpeed : 300,
			paginationSpeed : 400,

			items : 1,
			itemsDesktop : false,
			itemsDesktopSmall : false,
			itemsTablet: false,
			itemsMobile : false

		});

	});
</script>
</html>
