<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>DTH Store</title>
  <jsp:include page="/WEB-INF/admin/layout/head.jsp"/>

</head>
<body>
<div class="row d-flex justify-content-center">
  <c:if test="${requestScope.message != null}">
    <script>
      window.onload = function (){
        Swal.fire({
          position: 'top-end',
          icon: 'success',
          title: '${message}',
          showConfirmButton: false,
          timer: 1500
        })
      }
    </script>
  </c:if>
</div>
<!-- HEADER -->
<header>
  <!-- TOP HEADER -->
  <!-- /MAIN HEADER -->
  <jsp:include page="/WEB-INF/admin/layout/navbar.jsp"/>
</header>
<!-- /HEADER -->

<!-- SECTION -->
<div class="section">
  <!-- container -->
  <div class="container">
    <form action="/cart?action=delete" method="post" id="deleteForm">
      <input type="hidden" name="product_id" id="product_id" value="">
      <input type="hidden" name="memory_id" id="memory_id" value="">
      <input type="hidden" name="color_id" id="color_id" value="">
    </form>
    <!-- row -->
    <form action="/bill?action=add" method="post">
    <div class="row">
      <!-- Order Details -->
      <div class="col-md-12 order-details">
        <div class="section-title text-center">
          <h3 class="title" style="color: #D10024; font-weight: bold">Your Order</h3>
        </div>

        <div>
          <table class="table">
            <thead>
            <tr>
              <th class="text-center" scope="col">Product Name</th>
              <th class="text-center" scope="col">Memory</th>
              <th class="text-center" scope="col">Color</th>
              <th class="text-center" scope="col">Price</th>
              <th class="text-center" scope="col">Quantity</th>
              <th class="text-center" scope="col">Total</th>
              <th class="text-center" scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.cartItem}" var="cItem">
              <tr class="text-center">
                <td>${cItem.getProduct().getProductName()}</td>
                <input type="hidden" name="productName" value="${cItem.getProduct().getProductName()}">
                <td>${cItem.getMemoryName()}</td>
                <input type="hidden" name="memory" value="${cItem.getMemoryName()}">
                <td>${cItem.getColorName()}</td>

                <input  type="hidden" name="color" value="${cItem.getColorName()}">
<%--                <td>${cItem.getPrice()}</td>--%>
                <input class="priceDefault" type="hidden" name="price" value="${cItem.getPrice()}">
                <td>
                  <span>${cItem.getPriceFormat(cItem.getPrice())}</span>
                </td>
                <td class="col-md-1">
                  <div class="input-number">
                    <input type="number" name="quantity" value="${cItem.getQuantity()}" onchange="handleQuantityChange(${cItem.getProduct().getProductId()}, ${cItem.getColor()},${cItem.getMemory()},${cItem.getQuantity()},${cItem.getPrice()}, this )">
                    <span class="qty-up">+</span>
                    <span class="qty-down">-</span>
                  </div>
                </td>
                <input type="hidden" class="totalDefault" name="totalCart" value="${cItem.getTotalCartItem()}">
                <td>
                  <span>${cItem.getPriceFormat(cItem.getTotalCartItem())}</span>
                </td>
                <td class="action" data-title="Remove"><a onclick="handleClick(${cItem.getProduct().getProductId()},${cItem.getColor()},${cItem.getMemory()})"><i class="fa fa-trash-o"></i></a>
<%--                <button href="/cart?action=delete"></button>--%>
              </tr>

            </c:forEach>
            </tbody>
          </table>
        </div>
          <div class="order-summary">
            <div class="order-col">
              <div><strong class="total-size">TOTAL:</strong></div>
<%--              <div><strong class="order-total" >${requestScope.cart.getTotal()}</strong></div>--%>
              <input type="hidden" name="totalBill" value="${requestScope.cart.getTotal()}">
              <div><strong class="order-total">
                <span id="totalCartDefault" hidden="true">${requestScope.cart.getTotal()}</span>
                <span id="totalCartFormat"></span>
              </strong></div>
            </div>
          </div>
      </div>
      <!-- /Order Details -->

      <div class="col-md-12">
        <!-- Billing Details -->
        <div class="billing-details">
          <div class="section-title">
            <h3 class="title">Billing address</h3>
          </div>
        </div>
        <c:if test="${requestScope.errors != null}">
          <div class="text-danger">
            <ul>
              <c:forEach items="${errors}" var="e">
                <li >${e}</li>
              </c:forEach>
            </ul>
          </div>
        </c:if>
        <!-- /Billing Details -->
        <div>
          <div class="form-group col-md-6">
            <input class="input" type="text" name="userId" value="${sessionScope.user.getUserName()}" disabled>

<%--            <input class="input" type="text" name="first-name" placeholder="Customer Name" disabled>--%>
          </div>
          <div class="form-group col-md-6">
            <input class="input" type="email" name="email" placeholder="Email" value="${sessionScope.user.getUserEmail()}" disabled>
          </div>
        </div>
        <div>
          <div class="form-group col-md-6">
            <input class="input" type="text" name="address" placeholder="Address">
          </div>
          <div class="form-group col-md-6">
            <input class="input" type="tel" name="phone" placeholder="Telephone">
          </div>
        </div>
        <div>
          <div class=" form-group order-notes col-md-6">
            <textarea class="input" placeholder="Order Notes"></textarea>
          </div>
          <div class="form-group col-md-6">
            Payment Methods
            <div class="form-check">
              <input class="form-check-input" type="radio" value="Transfer payments" name="radio"  id="flexRadioDefault1">
              <label class="form-check-label" for="flexRadioDefault1" id="radio1">
                Transfer payments
              </label>
            </div>
            <div class="form-check">
              <input class="form-check-input" type="radio"   value="Cash payments" name="radio"  id="flexRadioDefault2" checked>
              <label class="form-check-label" for="flexRadioDefault2" id="radio2" >
                Cash payments
              </label>
            </div>
            <input type="hidden" name="paymentValue">
              <div class="text-center">
                <button type="submit" style="font-size: 15px" class="btn btn-danger">Buy Now</button>
              </div>
          </div>
        </div>
      </div>
      </div>
    </form>
  </div>
    <!-- /row -->
  </div>
  <!-- /container -->
</div>
<!-- /SECTION -->

<!-- FOOTER -->
<jsp:include page="/WEB-INF/admin/layout/footer.jsp"/>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<jsp:include page="/WEB-INF/admin/layout/script.jsp"/>

<script>
  function formatCurrency(input) {
    return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(input)
  }
  function handleQuantityChange(idProduct,color, memory, quantityOld,priceCartItem, element){
    let value = +element.value;
    let action  = "";
    if(value - quantityOld === 1){
      action = 'increase';
    }else {
      if(quantityOld - value === 1){
        action = 'decrease';
      }else{
        action = 'update';
      }
    }
    let url;
    if(action === 'increase' || action === 'decrease'){
      url =  `/cart?action=\${action}&product_id=\${idProduct}&colorCart=\${color}&memoryCart=\${memory}&priceCartItem=\${priceCartItem}`;
    }else{
      url =  `/cart?action=\${action}&product_id=\${idProduct}&colorCart=\${color}&memoryCart=\${memory}&quantityCart=\${value}&priceCartItem=\${priceCartItem}`;
    }
    if(action!= ""){
      window.location.assign(url);
    }
  }

  function handleClick(idProduct, color, memory) {
    document.getElementById("product_id").value = idProduct;
    document.getElementById("color_id").value = color;
    document.getElementById("memory_id").value = memory;
    Swal.fire({
      title: "Are you sure?",
      text: "You won't be able to revert this!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes, delete it!",
      fontsize: "50px"
    }).then(function (result) {
      if (result.isConfirmed) {
        document.getElementById("deleteForm").submit();
      }
    });
  }
function handleChangeRadio1(){
  let radio1 = document.getElementById("radio1").innerHTML;

  // let colorName = document.getElementById("colorData").options[document.getElementById("colorData").selectedIndex].text
  document.getElementById("paymentValue").value = radio1;
  console.log('checkedValue11111')
  console.log(radio1)
}
  function handleChangeRadio2(){
    let radio2 = document.getElementById("radio2").innerHTML;
    // let checkedValue = radio2.find("input[name=myRadio]:checked").val();
    document.getElementById("paymentValue").value = radio2;
    console.log('checkedValue222222')
    console.log(radio2)
  }

  let TotalCart = +document.getElementById('totalCartDefault').innerText;
  let totalCartFormat = TotalCart.toLocaleString('vi', {style : 'currency', currency : 'VND'});
  document.getElementById('totalCartFormat').innerText = totalCartFormat;

</script>


</body>
</html>
