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



<div class="container">
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="home">Homepage</a></li>
      <li class="breadcrumb-item active" aria-current="page">Order history</li>
    </ol>
  </nav>

  <h3 style="font-weight: bold;color: #D10024;text-align: center">Order Detail</h3>
  <table class="table text-center">
    <thead >
    <tr>
      <th class="product-name text-center">Product Name</th>
      <th class="product-color text-center">Color</th>
      <th class="product_memory text-center">Memory</th>
      <th class="product_price text-center">Price</th>
      <th class="product_quantity text-center">Quantity</th>
      <th class="product_total text-center">Total</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${requestScope.details}" var="d">
      <tr>
        <td class="product-name">${d.getProduct().getProductName()}</td>
        <td class="product-color">${d.getProduct().getColorName()}</td>
        <td class="product-memory">${d.getProduct().getMemoryName()}</td>
        <td class="product_price">${d.getBillDetailPrice(d.getPrice())}</td>
        <td class="product_quantity">${d.getQuantity()}</td>
        <td class="product_total">${d.getBillDetailPrice(d.getTotal())}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

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
