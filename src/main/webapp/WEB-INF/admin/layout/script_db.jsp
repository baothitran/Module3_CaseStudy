<script>
  let formInsert = document.getElementById("formInsert");
  formInsert.addEventListener("submit", function(e) {
    // Ngăn sự kiêện submit form gửi lên theo mặc định
    e.preventDefault();

    // Thường thì sẽ validate client ở đây
    let quantity = document.getElementById('quantityProduct').value;
    if(quantity < 0) {
      // Thông báo thất bại
      Swal.fire({
        position: 'top-end',
        icon: 'error',
        title: 'Dữ liệu không hợp lệ',
        showConfirmButton: false,
        timer: 1500
      })
    } else {
      // Thông báo thành công
      Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Thêm sản phẩm thành công!',
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
  // const inpFile = document.getElementById("inpFile");
  // const loadFile = document.getElementById("loadFile");
  // const previewContainer = document.getElementById("imagePreview");
  // const previewImage = previewContainer.querySelector(".image-preview__image");
  // const previewDefaultText = previewContainer.querySelector(".image-preview__default-text");
  // const object = new ActiveXObject("Scripting.FileSystemObject");
  // inpFile.addEventListener("change", function () {
  //   const file = this.files[0];
  //   if (file) {
  //     const reader = new FileReader();
  //     previewDefaultText.style.display = "none";
  //     previewImage.style.display = "block";
  //     reader.addEventListener("load", function () {
  //       previewImage.setAttribute("src", this.result);
  //     });
  //     reader.readAsDataURL(file);
  //   }
  // });
  // console.log("123")


</script>
<script src="admin/js/main.js"></script>
<script src="admin/js/plugins/pace.min.js"></script>