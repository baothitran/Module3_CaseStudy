<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="/assets/cssLogin/style.css">
</head>

<body>
<div class="form-container">
  <h2>DTH STORE: Sign up Form</h2>
</div>
<div class="row d-flex justify-content-center">
  <c:if test="${requestScope.message != null}">
    <script>
      window.onload = function (){
        Swal.fire({
          position: 'top-end',
          icon: 'success',
          title: '${message}',
          showConfirmButton: false,
          timer: 2500
        })
      }
    </script>
  </c:if>
</div>

<div class="container" id="container">
  <div class="form-container sign-in-container">
    <form class="formCss" action="/login?action=create" method="post">
      <h1>Create Account</h1>
      <c:if test="${requestScope.errors != null}">
        <div class="text-danger">
          <ul>
            <c:forEach items="${errors}" var="e">
              <li >${e}</li>
            </c:forEach>
          </ul>
        </div>
      </c:if>
      <span class="spanText">or use your email for registration</span>
      <input type="text" name="userName" id="userName" placeholder="Name" />
      <input type="email" name="userEmail" id="userEmail" placeholder="Email" />
      <input type="password" name="password" id="password" placeholder="Password" />
      <button type="submit">Register</button>
    </form>
  </div>
  <div class="overlay-container">
    <div class="overlay">
      <div class="overlay-panel overlay-right">
        <h1>Welcome Back!</h1>
        <p>To keep connected with us please login with your personal info</p>
        <a href="/login?action=login">
          <button class="ghost" type="submit">Sign In</button>
        </a>
      </div>
    </div>
  </div>
</div>
<script src="/assets/js/login.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.11/sweetalert2.all.min.js"
        integrity="sha512-sZf2OK8od53udtGBBdzSqg3BGjjL3BpM5K4dQgB0mmhumO07aWOLmBK917w5cbdLWPfILjJzKgJcYm+neEBUDw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>

</html>