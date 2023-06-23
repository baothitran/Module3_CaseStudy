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

    <%--  <c:if test="${requestScope.message !=null}">--%>
    <%--    <script>--%>
    <%--      window.onload = function () {--%>
    <%--        Swal.fire({--%>
    <%--          position: 'top-end',--%>
    <%--          icon: 'success',--%>
    <%--          title: 'Thêm sản phẩm thành công!',--%>
    <%--          showConfirmButton: false,--%>
    <%--          timer: 1500--%>
    <%--        })--%>
    <%--      };--%>
    <%--    </script>--%>
    <%--  </c:if>--%>
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
    </ul>
</aside>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item">List Products</li>
            <li class="breadcrumb-item"><a href="#">
                Edit product information</a></li>
        </ul>
    </div>

    <form action="/productManager?action=updateProduct" method="POST" id="formInsert" >
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group  col-md-12">
                                                                <span class="thong-tin-thanh-toan">
                                                                    <h5>Edit product information</h5>
                                                                </span>
                                </div>
                            </div>
                            <div class="row">

                                <div class="form-group col-md-6" hidden="hidden">
                                    <label class="control-label">ID Product </label>
                                    <input class="form-control" type="text" readonly
                                           name="product_id" value="${p.getProductId()}">
                                </div>


                                <div class="form-group col-md-6">
                                    <label for="exampleSelect1" class="control-label">Brand</label>
                                    <select name="brand_id" class="form-control"
                                            id="exampleSelec">
                                        <c:forEach items="${requestScope.Branddata}" var="br">
                                            <c:if test="${p.getBrandId()==br.getBrandId()}">
                                                <option selected value="${br.getBrandId()}">${br.getBrandName()}</option>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${requestScope.Branddata}" var="br">
                                            <option value="${br.getBrandId()}">${br.getBrandName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                 <div class="form-group col-md-6">
                                    <label for="exampleSelect1" class="control-label">Category</label>
                                    <select name="category_id" class="form-control"
                                            id="exampleSelect1">
                                        <c:forEach items="${requestScope.CategoryData}" var="cat">
                                            <c:if test="${p.getCategoryId()==cat.getCategoryId()}">
                                                <option selected value="${cat.getCategoryId()}">${cat.getCategoryName()}</option>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${requestScope.CategoryData}" var="cat">
                                            <option value="${cat.getCategoryId()}">${cat.getCategoryName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="control-label"> Product's name</label>
                                    <input class="form-control" type="text" id="product_name" name="product_name"
                                           required value="${p.getProductName()}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Price</label>
                                    <input class="form-control" type="number"  id="product_price" name="product_price"
                                           required value="${p.getProductPrice()}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Color</label>
                                    <select name="color_id" class="form-control"
                                            id="exampleSelect2">
                                        <c:forEach items="${requestScope.ColorData}" var="c">
                                            <c:if test="${p.getColorId()==c.getColorId()}">
                                                <option selected value="${c.getColorId()}">${c.getColor()}</option>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${requestScope.ColorData}" var="c">
                                            <option value="${c.getColorId()}">${c.getColor()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                 <div class="form-group col-md-6">
                                    <label class="control-label">Memory</label>
                                    <select name="memory_id" class="form-control"
                                            id="exampleSelect">
                                        <c:forEach items="${requestScope.Memory}" var="m">
                                            <c:if test="${p.getMemoryId()== m.getMemoryId()}">
                                                <option selected value="${m.getMemoryId()}">${m.getMemory()}</option>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${requestScope.Memory}" var="m">
                                            <option value="${m.getMemoryId()}">${m.getMemory()}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group col-md-6">

                                    <label class="control-label">Description</label>

                                    <input class="form-control" type="text" name="product_describe" id="describe"

                                           value="${p.getProductDescribe()}">
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="control-label">Quantity</label>
                                    <input id="quantityProduct" class="form-control" type="number" name="product_quantity"
                                           value="${p.getQuantity()}">
                                </div>
                                <!--anh san pham-->
                                <div class="form-group col-md-12">
                                    <label class="control-label">Img</label>
<%--                                    <img height="450" width="400" alt="Thumb image"--%>
<%--                                         id="thumbimage" style="display: none"--%>
<%--                                         src="/assets/img/${p.getProductImg()}"/>--%>
<%--                                    <div id="myfileupload">--%>
<%--                                        <input type="file" id="uploadfile" name="product_img"--%>
<%--                                               value="" onchange="readURL(this);"/>--%>
<%--                                    </div>--%>
                                    <div id="thumbbox">
                                        <img height="450" width="400" alt="Thumb image"
                                             id="thumbimage" style="display: block" src="/assets/img/${p.getProductImg()}"/>
                                        <a class="removeimg" href="javascript:"></a>
                                        <input type="file" id="uploadfile" name="product_img"
                                               value="" onchange="readURL(this);"/>
                                    </div>
                                    <div id="boxchoice">
                                        <a href="javascript:" class="Choicefile"><i
                                                class="fas fa-cloud-upload-alt"></i> Choose a photo</a>
                                        <p style="clear:both"></p>
                                    </div>
                                </div>
                            </div>
                            <BR>

                            <button class="btn btn-save" type="submit">Save</button>

                            <a class="btn btn-cancel" data-dismiss="modal" href="productManager">Cancel</a>
                            <BR>
                        </div>
                    </form>

</main>

<script>
    let formInsert = document.getElementById("formInsert");
    formInsert.addEventListener("submit", function(e) {
        // Ngăn sự kiêện submit form gửi lên theo mặc định
        e.preventDefault();

        // Thường thì sẽ validate client ở đây
        let quantity = document.getElementById('quantityProduct').value;
         let price = document.getElementById('product_price').value;
        let img = document.getElementById('uploadfile').value;

        let describe = document.getElementById('describe').value;
        if (quantity <= 0 || price <= 0 || describe == ''||  img == '' ) {
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
                title: 'Update successful!',
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

<jsp:include page="/WEB-INF/admin/layout/script_db.jsp"/>
</body>
</html>
