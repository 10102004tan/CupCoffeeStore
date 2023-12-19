<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Entiny.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add product</title>
<!-- start include font and link framework -->
<%@ include file="link-css-font-include.jsp"%>

<!-- end include font and link framework -->
<link rel="stylesheet" href="css/admin-style.css" type="text/css" />
<script src="./resources/ckeditor/ckeditor.js"></script>

</head>
<body>

	<!-- start include header -->
	<%@ include file="nav-manage-admin.jsp"%>
	<!-- end include header -->
	<div class="container mt-4"
		style="display: flex; justify-content: center;">
		<div class="main-content">
			<form id="product-form" method="POST" action="ThemSanPham" enctype="multipart/form-data">
				<div class="wrap-field">
					<label>Tên sản phẩm</label> <input type="text" name="ten" value="" />
					<div class="clear-both"></div>
				</div>
				<div class="wrap-field">

					<label>Giá</label> 
					<input type="number" name="gia"
						class="price" />
					<div class="clear-both"></div>
				</div>
				
				<div class="wrap-field">

					<label>Xuất xứ</label> <input type="text" name="xuatXu"
						class="origin" />
					<div class="clear-both"></div>
				</div>



				<div class="wrap-field mt-4">
					<label>Danh mục </label>
					<div class="d-flex flex-column box-categories">
						<% ArrayList<DanhMuc> listDanhMuc =(ArrayList<DanhMuc>)request.getAttribute("listDanhMuc");
						for(DanhMuc danhMuc : listDanhMuc){
						%>
						<div class="form-check">
						<input class="form-check-input" type="radio" name="maDanhMuc" required
							id="flexRadioDefault1" value="<%=danhMuc.getMa()%>"> 
							<label
							class="form-check-label" for=""><%=danhMuc.getTen() %></label>
					</div>
					<% } %>
					</div>
					<div class="clear-both"></div>
				</div>
				
				<div class="wrap-field mt-3">
                <label>Ảnh : </label>
                <div class="right-wrap-field">
                    <img class="image" 
                        src="https://cdn.vectorstock.com/i/preview-1x/65/30/default-image-icon-missing-picture-page-vector-40546530.jpg" /><br />
                    <input type="file" name="hinh" class="input-image"/>
                </div>
                <div class="clear-both"></div>
            	</div>


				<div class="wrap-field mt-5">
					<label>Mô tả</label>
					<textarea id="product-content" name="moTa"></textarea>
					<div class="clear-both"></div>
				</div>




				<button class="btn btn-primary my-5"
					style="margin-left: 142px;">Thêm</button>
			</form>
			<div class="clear-both"></div>
		</div>
	</div>
	</div>

	<!-- start include script -->
	<%@ include file="link-script-include.jsp"%>
	<!-- end include script -->

	<script>
           
            CKEDITOR.replace('product-content');
    </script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
	
	//function regex image
	const imageFileRegex = /\.(webp|jpg|jpeg|png|gif|bmp)$/i;
    const inputImage = document.querySelector('.input-image');
    const imageMain = document.querySelector('.image')
    inputImage.addEventListener('change', function () {
        const file = this.files[0]; // Lấy tệp tin được chọn
        if (file) {
            const fileName = file.name;
            if (imageFileRegex.test(fileName)) {
                //set image when up success
                const imageUrl = URL.createObjectURL(file);
                imageMain.setAttribute('src', imageUrl);
            } else {
                inputImage.value = '';
                alert("File image invalid")
                imageMain.setAttribute('src', 'https://cdn.vectorstock.com/i/preview-1x/65/30/default-image-icon-missing-picture-page-vector-40546530.jpg');
            }
        }
    })
	
	
	/*---------------------
	js for avata nav admin
	------------------------- */
	const avata = document.querySelector('.avata');
	const boxAdmin = document.querySelector('.box-admin');
	avata.addEventListener('click', () => {
		boxAdmin.classList.toggle('d-none');
	});
	</script>
	
	</script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
			crossorigin="anonymous">

  
  </script>
</body>
</html>