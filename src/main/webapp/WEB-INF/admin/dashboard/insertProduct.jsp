<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <title>Thêm sản phẩm | Quản trị Admin</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Main CSS-->
  <link rel="stylesheet" type="text/css" href="/assets/cssDashboard/main.css">
  <!-- Font-icon css-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <!-- or -->
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
  <link rel="stylesheet" type="text/css"
        href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.5/sweetalert2.all.min.js"
          integrity="sha512-2JsZvEefv9GpLmJNnSW3w/hYlXEdvCCfDc+Rv7ExMFHV9JNlJ2jaM+uVVlCI1MAQMkUG8K83LhsHYx1Fr2+MuA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>


  <script>
    function readURL(input, thumbimage) {
      if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
        var reader = new FileReader();
        reader.onload = function (e) {
          $("#thumbimage").attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      } else { // Sử dụng cho IE
        $("#thumbimage").attr('src', input.value);

      }
      $("#thumbimage").show();
      $('.filename').text($("#uploadfile").val());
      $('.Choicefile').css('background', '#14142B');
      $('.Choicefile').css('cursor', 'default');
      $(".removeimg").show();
      $(".Choicefile").unbind('click');

    }

    $(document).ready(function () {
      $(".Choicefile").bind('click', function () {
        $("#uploadfile").click();

      });
      $(".removeimg").click(function () {
        $("#thumbimage").attr('src', '').hide();
        $("#myfileupload").html('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
        $(".removeimg").hide();
        $(".Choicefile").bind('click', function () {
          $("#uploadfile").click();
        });
        $('.Choicefile').css('background', '#14142B');
        $('.Choicefile').css('cursor', 'pointer');
        $(".filename").text("");
      });
    })
  </script>
</head>

<body class="app sidebar-mini rtl">

<%--<c:if test="${requestScope['message'] != null}">--%>

<%--  <script>--%>
<%--    window.onload = function (){--%>
<%--      Swal.fire({--%>
<%--        position: 'top-center',--%>
<%--        icon: 'success',--%>
<%--        title: 'Thêm thành công',--%>
<%--        showConfirmButton: false,--%>
<%--        timer: 1500--%>
<%--      })--%>
<%--    }--%>
<%--  </script>--%>
<%--</c:if>--%>
<style>
  .Choicefile {
    display: block;
    background: #14142B;
    border: 1px solid #fff;
    color: #fff;
    width: 150px;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
    padding: 5px 0px;
    border-radius: 5px;
    font-weight: 500;
    align-items: center;
    justify-content: center;
  }

  .Choicefile:hover {
    text-decoration: none;
    color: white;
  }

  #uploadfile,
  .removeimg {
    display: none;
  }

  #thumbbox {
    position: relative;
    width: 100%;
    margin-bottom: 20px;
  }

  .removeimg {
    height: 25px;
    position: absolute;
    background-repeat: no-repeat;
    top: 5px;
    left: 5px;
    background-size: 25px;
    width: 25px;
    /* border: 3px solid red; */
    border-radius: 50%;

  }

  .removeimg::before {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    content: '';
    border: 1px solid red;
    background: red;
    text-align: center;
    display: block;
    margin-top: 11px;
    transform: rotate(45deg);
  }

  .removeimg::after {
    /* color: #FFF; */
    /* background-color: #DC403B; */
    content: '';
    background: red;
    border: 1px solid red;
    text-align: center;
    display: block;
    transform: rotate(-45deg);
    margin-top: -2px;
  }
</style>
<!-- Navbar-->
<header class="app-header">
  <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                  aria-label="Hide Sidebar"></a>
  <!-- Navbar Right Menu-->
  <ul class="app-nav">


    <!-- User Menu-->

    <li><a class="app-nav__item" href="home"><i class='bx bxs-home-alt-2' ></i></i> </a>


    </li>
  </ul>
</header>
<!-- Sidebar menu-->
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
    <ul class="app-breadcrumb breadcrumb">
      <li class="breadcrumb-item">Product List</li>
      <li class="breadcrumb-item"><a href="#">Add Product</a></li>
    </ul>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <h3 class="tile-title">New Product</h3>
        <div class="tile-body">
          <div class="row element-button">
          </div>

          <form class="row" id="formInsert" action="/productManager?action=insertProduct" method="POST">
            <div class="form-group col-md-3">
              <label for="exampleSelect1" class="control-label">Brand</label>
              <select name="brand_id" class="form-control" id="exampleSelect4">
                <option value="Chọn hãng">Choose Brand</option>
                <c:forEach items="${requestScope.Branddata}" var="br">
                  <option value="${br.getBrandId()}">${br.getBrandName()}</option>
                </c:forEach>
              </select>
            </div>

            <div class="form-group col-md-3">
              <label for="exampleSelect1" class="control-label">Category</label>
              <select name="category_id" class="form-control" id="exampleSelect1">
                <option>Choose Category</option>
                <c:forEach items="${requestScope.CategoryData}" var="cat">
                  <option value="${cat.getCategoryId()}">${cat.getCategoryName()}</option>
                </c:forEach>
              </select>
            </div>

            <div class="form-group col-md-3">
              <label class="control-label">Product Name</label>
              <input class="form-control" id="product_name" name="product_name" type="text" value="" required>
            </div>
            <div class="form-group  col-md-3">
              <label class="control-label">Price</label>
              <input class="form-control" id ="product_price" name="product_price" type="number" value="" required>
            </div>
            <div class="form-group col-md-3">
              <label class="control-label">Color</label>
                <select name="color_id" class="form-control" id="exampleSelect2">
                  <option> Choose Color </option>
                  <c:forEach items="${requestScope.ColorData}" var="c">
                    <option value="${c.getColorId()}">${c.getColor()}</option>
                  </c:forEach>
                </select>
            </div>

            <div class="form-group col-md-3">
              <label class="control-label">Memory</label>
                <select name="memory" class="form-control" id="exampleSelect3">
                  <option> Choose Memory </option>
                  <c:forEach items="${requestScope.Memory}" var="m">
                    <option value="${m.getMemoryId()}">${m.getMemory()}</option>
                  </c:forEach>
                </select>
            </div>

            <div class="form-group  col-md-3">
              <label class="control-label">Quantity</label>
              <input class="form-control" id="quantityProduct" name="product_quantity" type="number" value="" required>
            </div>
            <div class="form-group col-md-12">
              <label class="control-label">IMG</label>
              <div id="myfileupload">
                <input type="file" id="uploadfile" name="product_img" onchange="readURL(this);" value="">
              </div>
              <div id="thumbbox">
                <img height="450" width="400" alt="Thumb image" id="thumbimage" style="display: none"/>
                <a class="removeimg" href="javascript:"></a>
              </div>
              <div id="boxchoice">
                <a href="javascript:" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i> Choose IMG</a>
                <p style="clear:both"></p>
              </div>
            </div>
            <div class="form-group col-md-12">
              <label class="control-label">Description</label>
              <textarea class="form-control" name="describe" id="describe"></textarea>
            </div>
            <c:if test="${requestScope.errors !=null}">
              <ul>
                <c:forEach items="${requestScope.errors}" var="e">
                  <li>${e}</li>
                </c:forEach>
              </ul>
            </c:if>


            <button class="btn btn-save" type="submit" >Save
            </button>
            &nbsp;
            <a class="btn btn-cancel" href="productManager">Cancel</a>
          </form>
        </div>

      </div>
    </div>
  </div>
</main>

<script>
  let formInsert = document.getElementById("formInsert");
  formInsert.addEventListener("submit", function(e) {
    // Ngăn sự kiêện submit form gửi lên theo mặc định
    e.preventDefault();

    // Thường thì sẽ validate client ở đây
    let quantity = document.getElementById('quantityProduct').value;
    let price = document.getElementById('product_price').value;
    let nameProduct = document.getElementById('product_name').value;
    let brand = document.getElementById('exampleSelect4').value;
    let color = document.getElementById('exampleSelect2').value;
    let memory = document.getElementById('exampleSelect3').value;
    let category = document.getElementById('exampleSelect1').value;
    let describe = document.getElementById('describe').value;
    let img = document.getElementById('uploadfile').value;
    // let category = $('#exampleSelect1').find('option:selected').text;
    console.log(describe)

    if(quantity < 0 || price < 0 || describe == '' ||nameProduct == null || isNaN(brand) || isNaN(color)|| isNaN(memory)|| isNaN(category) || img == '') {
      // Thông báo thất bại
      Swal.fire({
        position: 'top-end',
        icon: 'error',
        title: 'Invalid Data',
        showConfirmButton: false,
        timer: 1500
      })
    } else {
      // Thông báo thành công
      Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Add new successful product!',
        showConfirmButton: false,
        timer: 1500
      })

      // Chờ 1s sau thì submit form
      setTimeout(function() {
        formInsert.submit()
      }, 1000)
    }

  })
</script>
<script src="admin/js/jquery-3.2.1.min.js"></script>
<script src="admin/js/popper.min.js"></script>
<script src="admin/js/bootstrap.min.js"></script>
<script>
  const inpFile = document.getElementById("inpFile");
  const loadFile = document.getElementById("loadFile");
  const previewContainer = document.getElementById("imagePreview");
  const previewImage = previewContainer.querySelector(".image-preview__image");
  const previewDefaultText = previewContainer.querySelector(".image-preview__default-text");
  const object = new ActiveXObject("Scripting.FileSystemObject");
  inpFile.addEventListener("change", function () {
    const file = this.files[0];
    if (file) {
      const reader = new FileReader();
      previewDefaultText.style.display = "none";
      previewImage.style.display = "block";
      reader.addEventListener("load", function () {
        previewImage.setAttribute("src", this.result);
      });
      reader.readAsDataURL(file);
    }
  });
  console.log("123")


</script>
<script src="admin/js/main.js"></script>
<script src="admin/js/plugins/pace.min.js"></script>

</body>

</html>
