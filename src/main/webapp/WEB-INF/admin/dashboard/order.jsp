<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Order List | Admin Dashboard</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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

    <style>
        .store-pagination li {
            display: inline-block;
            width: 40px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            background-color: #cccdd2;
            border: 1px solid #cccdd2;
            webkit-transition: 0.2s all;
            transition: 0.2s all;
        }
    </style>
</head>

<body class="app sidebar-mini rtl">
<!-- Navbar-->
<header class="app-header">
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                    aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">


        <!-- User Menu-->
        <li><a class="app-nav__item" href="dashboard"><i class='bx bxs-home-alt-2' ></i></a>

        </li>
    </ul>
</header>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <hr>
    <ul class="app-menu">
        <li><a class="app-menu__item" href="/dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span
                class="app-menu__label">Dashboard</span></a></li>
        <li><a class="app-menu__item" href="/customerManager"><i class='app-menu__icon bx bx-user-voice'></i><span
                class="app-menu__label">Customer Manager</span></a></li>
        <li><a class="app-menu__item" href="/productManager"><i
                class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Product Manager</span></a>
        </li>
        <li><a class="app-menu__item" href="/orderManager"><i class='app-menu__icon bx bx-task'></i><span
                class="app-menu__label">Order Manager</span></a></li>
        <%--        <li><a class="app-menu__item" href="/revenueManager"><i class='app-menu__icon fa-solid fa-sack-dollar'></i><span--%>
        <%--                class="app-menu__label">Doanh thu</span></a></li>--%>
        <%--        <li><a class="app-menu__item"--%>
        <%--               href="https://docs.google.com/spreadsheets/d/1elWy0LYj9ngbmywMGwy8Noe_K7WmyisQ6aHOK6RnXZI"--%>
        <%--               target="_blank"><i class='app-menu__icon bx bx-task'></i><span--%>
        <%--                class="app-menu__label">Kiểm tra phản hồi</span></a></li>--%>
    </ul>
</aside>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Order List</b></a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th>ID Order</th>
                            <th>Customer</th>
                            <th>Phone</th>
                            <th>Addres</th>
                            <th>Purchase date</th>
                            <th>Total</th>
                            <th>Pay</th>
                            <th>Function</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope.bill}" var="b">
                            <tr>
                                <td>${b.getBillId()}</td>
                                <td>${b.user.getUserName()}</td>
                                <td>${b.getPhone()}</td>
                                <td>${b.getAddress()}</td>
                                <td>${b.getCreateAt()}</td>
                                <td>${b.getBillTotal(b.getTotal())}</td>
                                <td><span class="badge bg-success">${b.getPayment()}</span></td>
                                <td>
                                    <a style=" color: rgb(245 157 57);background-color: rgb(251 226 197); padding: 5px;border-radius: 5px;"
                                       href="/orderManager?action=showDetail&bill_id=${b.getBillId()}"><i
                                            class="fa"></i> Order details</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <c:set var="page" value="${requestScope.page}"/>
                    <div class="store-filter clearfix">
                        <span class="store-qty"></span>
                        <ul class="store-pagination">
                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                <li class="${i==page?"current":""}"><a href="orderManager?page=${i}">${i}</a></li>
                            </c:forEach>
                        </ul>
                    </div>


                </div>
            </div>
        </div>
    </div>
</main>
<!-- Essential javascripts for application to work-->
<script src="admin/js/jquery-3.2.1.min.js"></script>
<script src="admin/js/popper.min.js"></script>
<script src="admin/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="admin/js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="admin/js/plugins/pace.min.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="admin/js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="admin/js/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
</body>

</html>
