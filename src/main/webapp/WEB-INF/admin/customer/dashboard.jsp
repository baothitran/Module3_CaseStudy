         <%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Admin</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Main CSS-->
  <!-- Main CSS-->
  <link rel="stylesheet" type="text/css" href="/assets/cssDashboard/main.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <!-- or -->
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
  <!-- Font-icon css-->
  <link rel="stylesheet" type="text/css"
        href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>

<body class="app sidebar-mini rtl">
<!-- Navbar-->
<header class="app-header">
  <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                  aria-label="Hide Sidebar"></a>
  <!-- Navbar Right Menu-->
  <ul class="app-nav">


    <!-- User Menu-->
    <li><a class="app-nav__item" href="home"><i class='bx bxs-home-alt-2' ></i> </a>

    </li>
  </ul>
</header>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
  <hr>
  <ul class="app-menu">
    <li><a class="app-menu__item" href="dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span
            class="app-menu__label">Dashboard</span></a></li>
    <li><a class="app-menu__item" href="customerManager"><i class='app-menu__icon bx bx-user-voice'></i><span
            class="app-menu__label">Customer Manager</span></a></li>
    <li><a class="app-menu__item" href="productManager"><i
            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Product Manager</span></a>
    </li>
    <li>
      <a class="app-menu__item" href="/orderManager">
        <i class='app-menu__icon bx bx-task'>
        </i>
        <span
            class="app-menu__label">Order Manager
        </span>
      </a>


    </li>
<%--    <li><a class="app-menu__item" href="/revenueManager"><i class='app-menu__icon fa-solid fa-sack-dollar'></i><span--%>
<%--            class="app-menu__label">Doanh thu</span></a></li>--%>
<%--    <li><a class="app-menu__item"--%>
<%--           href="https://docs.google.com/spreadsheets/d/1elWy0LYj9ngbmywMGwy8Noe_K7WmyisQ6aHOK6RnXZI"--%>
<%--           target="_blank"><i class='app-menu__icon bx bx-task'></i><span--%>
<%--            class="app-menu__label">Kiểm tra phản hồi</span></a></li>--%>
  </ul>
</aside>
<main class="app-content">
  <div class="row">
    <div class="col-md-12">
      <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><a href="#"><b>Dashboard</b></a></li>
        </ul>
        <div id="clock"></div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12 col-lg-12">
      <div class="row">
        <!-- col-6 -->
        <div class="col-md-6">
          <div class="widget-small primary coloured-icon"><i class='icon bx bxs-user-account fa-3x'></i>
            <div class="info">
              <h4>
                  <a href="customerManager">CUSTOMER MANAGER</a>
              </h4>
<%--              <p><b>${requestScope.user} khách hàng</b></p>--%>
<%--              <p class="info-tong">Tổng số khách hàng được quản lý.</p>--%>
            </div>
          </div>
        </div>
        <!-- col-6 -->
        <div class="col-md-6">
          <div class="widget-small info coloured-icon"><i class='icon bx bxs-data fa-3x'></i>
            <div class="info">
              <h4><a href="productManager">PRODUCT MANAGER</a></h4>
<%--              <p><b>${requestScope.product} sản phẩm</b></p>--%>
<%--              <p class="info-tong">Tổng số sản phẩm được quản lý.</p>--%>
            </div>
          </div>
        </div>
        <!-- col-6 -->
        <div class="col-md-6">
          <div class="widget-small warning coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
            <div class="info">
              <h4>
                <a href="orderManager">ORDER MANAGER</a>
              </h4>
<%--              <p><b>${requestScope.bill} đơn hàng</b></p>--%>
<%--              <p class="info-tong">Tổng số hóa đơn bán hàng trong tháng.</p>--%>
            </div>
          </div>
        </div>

        <!-- col-12 -->
        <div class="col-md-12">
          <div class="tile">
            <h3 class="tile-title">TODAY ORDER</h3>
            <div>
              <table class="table table-bordered">
                <thead>
                <tr>
                  <th>ID Order</th>
                  <th>Customer</th>
                  <th>Address</th>
                  <th>Order Date</th>
                  <th>Total</th>
                  <th>Payment</th>
                  <th>Action</th>

                </tr>

                </thead>
                <tbody>
                <c:forEach items="${requestScope.billbyday}" var="b">
                  <tr>
                    <td>${b.getBillId()}</td>
                    <td>${b.user.getUserName()}</td>
                    <td>${b.getAddress()}</td>
                    <td>${b.getCreateAt()}</td>
                    <td>${b.getBillTotal(b.getTotal())}</td>
                    <td><span class="badge bg-success">${b.getPayment()}</span></td>
                    <td>
                      <a style=" color: rgb(245 157 57);background-color: rgb(251 226 197); padding: 5px;border-radius: 5px;"
                         href="orderManager?action=showDetail&bill_id=${b.getBillId()}"><i
                              class="fa"></i>Chi tiết đơn hàng</a></td>
                  </tr>
                </c:forEach>

                </tbody>
              </table>
            </div>
            <!-- / div trống-->
          </div>
        </div>
        <!-- / col-12 -->
      </div>
    </div>
  </div>


  <div class="text-center" style="font-size: 13px">
    <p><b>Copyright
      <script type="text/javascript">
        document.write(new Date().getFullYear());
      </script>
      Phần mềm quản lý Website
    </b></p>
  </div>
</main>
<script src="admin/js/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="admin/js/popper.min.js"></script>
<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
<!--===============================================================================================-->
<script src="admin/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="admin/js/main.js"></script>
<!--===============================================================================================-->
<script src="admin/js/plugins/pace.min.js"></script>
<!--===============================================================================================-->
<!--===============================================================================================-->
</body>

</html>