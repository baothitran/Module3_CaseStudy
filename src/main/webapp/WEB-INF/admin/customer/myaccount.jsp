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
		<!-- /NAVIGATION -->

		<!-- BREADCRUMB -->
<section class="main_content_area">
	<div class="container">
		<div class="account_dashboard">
			<div class="row">
				<div class="col-sm-12 col-md-3 col-lg-3">
					<!-- Nav tabs -->
					<div class="dashboard_tab_button">
						<ul role="tablist" class="nav flex-column dashboard-list ">
							<li><a href="#orders" data-toggle="tab" class="nav-link">Đơn hàng</a></li>
							<li><a href="/login?action=logout" class="nav-link">Đăng xuất</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md-9 col-lg-9">
					<!-- Tab panes -->
					<div class="tab-content dashboard_content">
						<div class="tab-pane active" id="orders">
							<h3 style="font-weight: bold;color: #D10024">Lịch sử mua hàng</h3>
							<div class="table-responsive">
								<table class="table text-center">
									<thead>
									<tr>
										<th class="text-center" scope="col">Bill ID</th>
										<th class="text-center" scope="col">Address</th>
										<th class="text-center" scope="col">Phone</th>
										<th class="text-center" scope="col">Email</th>
										<th class="text-center" scope="col">Payment</th>
										<th class="text-center" scope="col">Total</th>
										<th class="text-center" scope="col">Order Date</th>
										<th class="text-center" scope="col">Action</th>
									</tr>
									</thead>
									<tbody>
									<c:forEach items="${requestScope.bill}" var="b">
										<tr>
											<td>${b.getBillId()}</td>
											<td>${b.getAddress()}</td>
											<td>${b.getPhone()}</td>
											<td>${b.getEmail()}</td>
											<td>${b.getPayment()}</td>
											<td>${b.getBillTotal(b.getTotal())}</td>
											<td>${b.getCreateAt()}</td>
											<td><a href="login?action=billDetail&bill_id=${b.getBillId()}" class="view"><i class="fa fa-eye" aria-hidden="true"></i></a>
											</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>
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
		<!-- FOOTER -->
<footer id="footer">
	<!-- top footer -->
	<jsp:include page="/WEB-INF/admin/layout/footer.jsp"/>
</footer>
		<!-- /FOOTER -->

		<!-- jQuery Plugins -->
		<jsp:include page="/WEB-INF/admin/layout/script.jsp"/>

	</body>
</html>
