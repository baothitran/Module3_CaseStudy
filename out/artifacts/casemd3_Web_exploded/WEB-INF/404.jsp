<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Login page</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <!-- CSS
    ========================= -->
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="assets/css/plugins.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="assets/css/style2.css">
</head>

<body>
<div class="off_canvars_overlay"></div>
<jsp:include page="/WEB-INF/admin/layout/head.jsp"/>

<!--error section area start-->
<div class="error_section">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="error_form">
                    <h1>404</h1>
                    <a href="home">Back to home page</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--error section area end-->
<!--footer area start-->
<jsp:include page="/WEB-INF/admin/layout/footer.jsp"/>
<!--footer area end-->

<!-- JS
============================================ -->


<!--map js code here-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAdWLY_Y6FL7QGW5vcO3zajUEsrKfQPNzI"></script>
<script src="https://www.google.com/jsapi"></script>
<script src="assets/js/map.js"></script>


<!-- Plugins JS -->
<script src="assets/js/plugins.js"></script>

<!-- Main JS -->
<script src="assets/js/main2.js"></script>


</body>

</html>
