<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Danh sách sản phẩm | Quản trị Admin</title>
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

</head>

<body class="app sidebar-mini rtl">
<!-- Navbar-->
<header class="app-header">
  <!-- Sidebar toggle button-->
  <a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                  aria-label="Hide Sidebar"></a>
  <!-- Navbar Right Menu-->
  <ul class="app-nav">


    <!-- User Menu-->
    <li><a class="app-nav__item" href="dashboard"><i class='bx bxs-home-alt-2' ></i></i> </a>

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
  </ul>
</aside>
<c:if test="${requestScope.message !=null}">
  <script>
    window.onload = function () {
      Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Product update successful!',
        showConfirmButton: false,
        timer: 1500
      })
    };
  </script>
</c:if>
<main class="app-content">
  <div class="app-title">
    <ul class="app-breadcrumb breadcrumb side">
      <li class="breadcrumb-item active"><a href="#"><b>List Products</b></a></li>
    </ul>
  </div>

  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div class="tile-body">
          <div class="row element-button">
            <div class="col-sm-2">
              <a class="btn btn-add btn-sm" href="/productManager?action=insert" title="Thêm"><i
                      class="fas fa-plus"></i>Add new product</a>
            </div>
          </div>
          <c:if test="${requestScope.errors !=null}">
            <ul>
              <c:forEach items="${requestScope.errors}" var="e">
                <li STYLE="color: red">${e}</li>
              </c:forEach>
            </ul>
          </c:if>
          <table class="table table-hover table-bordered" id="sampleTable">
            <thead>
            <tr>
              <th>ID Product</th>
              <th>Category</th>
              <th>Product Name</th>
              <th>Price</th>
              <th>Color</th>
              <th>Description</th>
              <th>Quantity</th>
              <th>Img</th>
              <th>Function</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.products}" var="p">
              <tr>
                <td>${p.getProductId()}</td>
                <td>${p.getCategoryName()}</td>
                <td>${p.getProductName()}</td>
                <td>${p.getProductPrice()}</td>
                <td>${p.getColorName()}</td>
                <td>${p.getProductDescribe()}</td>
                <td>${p.getQuantity()}</td>
                <td><img src="/assets/img/${p.getProductImg()}" alt="" width="100px;"></td>
                <td>
                  <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                          value="${p.getProductId()}"><i class="fas fa-trash-alt"></i>
                  </button>

                  <a class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                          href="/productManager?action=update&id=${p.getProductId()}"
                          id="show-emp"
                          data-toggle="modal" data-target="#ModalUP${p.getProductId()}"><i class="fas fa-edit"></i>
                  </a>

                </td>
              </tr>

<%--              <!----%>
<%--              MODAL--%>
<%--              -->--%>

<%--              <div class="modal fade" id="ModalUP${p.getProductId()}" tabindex="-1" role="dialog"--%>
<%--                   aria-hidden="true" data-backdrop="static"--%>
<%--                   data-keyboard="false">--%>
<%--                <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--                  <div class="modal-content">--%>
<%--                    <form action="/productManager?action=updateProduct" method="POST">--%>
<%--                      <div class="modal-body">--%>
<%--                        <div class="row">--%>
<%--                          <div class="form-group  col-md-12">--%>
<%--                                                                <span class="thong-tin-thanh-toan">--%>
<%--                                                                    <h5>Chỉnh sửa thông tin sản phẩm</h5>--%>
<%--                                                                </span>--%>
<%--                          </div>--%>
<%--                        </div>--%>
<%--                        <div class="row">--%>
<%--                          <div class="form-group col-md-6">--%>
<%--                            <label class="control-label">Mã sản phẩm </label>--%>
<%--                            <input class="form-control" type="text" readonly--%>
<%--                                   name="product_id" value="${p.getProductId()}">--%>
<%--                          </div>--%>
<%--                          <div class="form-group col-md-6">--%>
<%--                            <label for="exampleSelect1" class="control-label">Danh--%>
<%--                              mục</label>--%>
<%--                            <select name="category_id" class="form-control"--%>
<%--                                    id="exampleSelect1">--%>
<%--                              <c:forEach items="${requestScope.CategoryData}" var="cat">--%>
<%--                                <c:if test="${p.category.getCategoryId()==cat.getCategoryId()}">--%>
<%--                                  <option>${cat.setCategoryName()}</option>--%>
<%--                                </c:if>--%>
<%--                              </c:forEach>--%>
<%--                              <c:forEach items="${requestScope.CategoryData}" var="cat">--%>
<%--                                <option value="${cat.getCategoryId()}">${cat.getCategoryName()}</option>--%>
<%--                              </c:forEach>--%>
<%--                            </select>--%>
<%--                          </div>--%>
<%--                          <div class="form-group col-md-6">--%>
<%--                            <label class="control-label">Tên sản phẩm</label>--%>
<%--                            <input class="form-control" type="text" name="product_name"--%>
<%--                                   required value="${p.getProductName()}">--%>
<%--                          </div>--%>
<%--                          <div class="form-group col-md-6">--%>
<%--                            <label class="control-label">Giá</label>--%>
<%--                            <input class="form-control" type="number" name="product_price"--%>
<%--                                   required value="${p.getProductPrice()}">--%>
<%--                          </div>--%>
<%--                          <div class="form-group col-md-6">--%>
<%--                            <label class="control-label">Màu</label>--%>
<%--                            <input class="form-control" name="product_color" type="text"--%>
<%--                                   value="<c:forEach items="${requestScope.ColorData}" var="c"><c:if test="${p.getColorId()==c.getColorId()}">${c.getColor()},</c:if></c:forEach>">--%>
<%--                          </div>--%>


<%--                          <div class="form-group col-md-6">--%>
<%--                            <label class="control-label">Thông tin</label>--%>
<%--                            <input class="form-control" type="text" name="product_describe"--%>
<%--                                   value="${p.getProductDescribe()}">--%>
<%--                          </div>--%>

<%--                          <div class="form-group col-md-6">--%>
<%--                            <label class="control-label">Số lượng</label>--%>
<%--                            <input class="form-control" type="text" name="product_quantity"--%>
<%--                                   value="${p.getQuantity()}">--%>
<%--                          </div>--%>
<%--                          <!--anh san pham-->--%>
<%--                          <div class="form-group col-md-12">--%>
<%--                            <label class="control-label">Ảnh sản phẩm</label>--%>
<%--                            <div id="myfileupload">--%>
<%--                              <input type="file" id="uploadfile" name="product_img"--%>
<%--                                     value="" onchange="readURL(this);"/>--%>
<%--                            </div>--%>
<%--                            <div id="thumbbox">--%>
<%--                              <img height="450" width="400" alt="Thumb image"--%>
<%--                                   id="thumbimage" style="display: none"/>--%>
<%--                              <a class="removeimg" href="javascript:"></a>--%>
<%--                            </div>--%>
<%--                            <div id="boxchoice">--%>
<%--                              <a href="javascript:" class="Choicefile"><i--%>
<%--                                      class="fas fa-cloud-upload-alt"></i> Chọn ảnh</a>--%>
<%--                              <p style="clear:both"></p>--%>
<%--                            </div>--%>
<%--                          </div>--%>
<%--                        </div>--%>
<%--                        <BR>--%>

<%--                        <button class="btn btn-save" type="submit">Lưu lại</button>--%>

<%--                        <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>--%>
<%--                        <BR>--%>
<%--                      </div>--%>
<%--                    </form>--%>
<%--                  </div>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--              <!----%>
<%--              MODAL--%>

            </c:forEach>
            </tbody>
          </table>

        </div>
      </div>
    </div>
  </div>
</main>


<!-- Essential javascripts for application to work-->
<script src="/assets/js/bootstrap.min.js"></script>
<script src="admin/js/plugins/jquery.dataTables.min.js"></script>
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/slide/js/popper.js"></script>
<script src="/assets/js/popper.min.js"></script>

<script src="/assets/js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="admin/js/plugins/pace.min.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->

<script src="admin/js/plugins/dataTables.bootstrap.min.js"></script>


<script>
  $(document).ready(function () {
    $("#sampleTable").on("click", ".trash", function () {
      swal({
        title: "Warning",
        text: "Are you sure you want to delete this product?",
        buttons: ["Cancel", "Yes, I'm sure"],
      }).then((willDelete) => {
        if (willDelete) {
          var productId = $(this).attr("value");
          var requestData = {
            action: "deleteProduct",
            product_id: productId
          };
          $.ajax({
            url: "/productManager?action=deleteProduct",
            type: "POST",
            data: requestData,
            success: function () {
              swal("Deleted successfully!", {
                // Các cài đặt swal khi xóa thành công
              }).then(() => {
                location.reload(); // Load lại trang
              });
            }
          });
        }
      });
    });
    // $("#sampleTable").on("click", ".edit", function () {
    //       var productId = $(this).attr("value");
    //       var requestData = {
    //         action: "insert",
    //         product_id: productId
    //       };
    //       // location.href()
    //       // $.ajax({
    //       //   url: "/productManager?action=insert",
    //       //   type: "GET",
    //       //   data: requestData,
    //       //   success: function () {
    //       //     swal("Đã xóa thành công!", {
    //       //       // Các cài đặt swal khi xóa thành công
    //       //     }).then(() => {
    //       //       location.reload(); // Load lại trang
    //       //     });
    //       //   }
    //       // });
    // });
  });
  // $(document).ready(jQuery(function () {
  //     jQuery(".trash").click(function () {
  //         swal({
  //             title: "Cảnh báo",
  //             text: "Bạn có chắc chắn là muốn xóa sản phẩm này?",
  //             buttons: ["Hủy bỏ", "Đồng ý"],
  //         })
  //                 .then((willDelete) => {
  //                     if (willDelete) {
  //                         window.location = "/productManager?action=deleteProduct&product_id=" + $(this).attr("value");
  //                         swal("Đã xóa thành công.!", {
  //                         });
  //                     }
  //                 });
  //     });
  // }));
</script>

<script>
  var myApp = new function () {
    this.printTable = function () {
      var tab = document.getElementById('sampleTable');
      var win = window.open('', '', 'height=700,width=700');
      win.document.write(tab.outerHTML);
      win.document.close();
      win.print();
    }
  }
</script>
</body>

</html>