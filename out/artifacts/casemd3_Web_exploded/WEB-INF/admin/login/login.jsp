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
<h2>DTH STORE: Sign in Form</h2>
<div class="container" id="container">
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
  <div class="form-container sign-in-container">
    <form class="formCss" action="/login?action=login" method="post">
      <h1>Sign in</h1>
      <span class="spanText">or use your account</span>
      <c:if test="${requestScope.errors != null}">
        <div class="text-danger">
          <ul>
            <c:forEach items="${errors}" var="e">
              <li >${e}</li>
            </c:forEach>
          </ul>
        </div>
      </c:if>
      <input type="email" name="userEmail" id="userEmail" placeholder="Email" />
      <input type="password" name="password" id="password" placeholder="Password" />
      <a href="#">Forgot your password?</a>
      <button type="submit">Sign In</button>
    </form>
  </div>
  <div class="overlay-container">
    <div class="overlay">
      <div class="overlay-panel overlay-right">
        <h1>Hello, Friend!</h1>
        <p>Enter your personal details and start journey with us</p>
        <a href="/login?action=create">
          <button class="ghost" type="submit" id="signUp">Sign Up</button>
        </a>
      </div>
    </div>
  </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.11/sweetalert2.all.min.js"
        integrity="sha512-sZf2OK8od53udtGBBdzSqg3BGjjL3BpM5K4dQgB0mmhumO07aWOLmBK917w5cbdLWPfILjJzKgJcYm+neEBUDw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/assets/js/login.js"></script>
</body>

</html>