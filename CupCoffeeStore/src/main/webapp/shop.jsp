<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- import -->
<%@page import="Entiny.*"%>
<%@page import="java.util.ArrayList"%>
<%
ArrayList<DanhMuc> listDanhMuc = (ArrayList<DanhMuc>)request.getAttribute("listDanhMuc");
ArrayList<SanPham> listSanPham = (ArrayList<SanPham>)request.getAttribute("listSanPham");
%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<%@include file="link-css-font-include.jsp"%>
<link rel="stylesheet" href="css/card-style.css" type="text/css" />
<title>Shop</title>
<style type="text/css">
.radio-item {
	border: 1px solid #000;
	border-radius: 99px;
	width: 30px;
	height: 30px;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	text-decoration: none;
	color: #000;
	margin: 0 8px;
}

.radio-item:hover {
	color: #000;
}

.actived {
	background: #000;
	color: #fff;
}

.actived:hover {
	color: #fff;
}
</style>

</head>

<body>

	<%@include file="header-include.jsp"%>
	<!-- Header Section End -->

	<div class="alert-custom d-flex bg-success px-4 py-4 " >
		<svg style="width: 20px; margin-right: 5px" xmlns="http://www.w3.org/2000/svg"
			fill="none" viewBox="0 0 24 24" stroke-width="1.5"
			stroke="currentColor" class="w-6 h-6">
  <path stroke-linecap="round" stroke-linejoin="round"
				d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
</svg>
		<span>Add to cart success</span>

	</div>

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4>Shop</h4>
						<div class="breadcrumb__links">
							<a href="./Shop">Home</a> <span>Shop</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shop Section Begin -->
	<section class="shop spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="shop__sidebar">
						<div class="shop__sidebar__accordion">
							<div class="accordion" id="accordionExample">
								<div class="card">
									<div class="card-heading">
										<a data-toggle="collapse" data-target="#collapseOne">Categories</a>
									</div>
									<div id="collapseOne" class="collapse show"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="shop__sidebar__categories">
												<ul class="nice-scroll">
													<li><a href="Shop">All</a></li>
													<%
													for (DanhMuc danhMuc : listDanhMuc) {
													%>
													<li><a href="Shop?maDanhMuc=<%=danhMuc.getMa()%>"><%=danhMuc.getTen()%></a></li>
													<%
													}
													%>
												</ul>
											</div>
										</div>
									</div>
								</div>

								



							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="shop__product__option">
						<div class="row gutter">
							<%
							
							for (SanPham sanPham : listSanPham) {
							%>
							<div class="col-sm-12 col-lg-4 col-md-6 mb-3 ">
								<div class="el-wrapper w-100 bg-white"
									style="border-radius: 12px; box-shadow: 0 0 19px 9px #eee;">
									<a href="ChiTietSanPham?ma=<%=sanPham.getMa()%>">
										<div class="box-up">
										<img class="img w-100" src="images/<%=sanPham.getHinh()%>"
											alt="<%=sanPham.getHinh()%>">
										<div class="img-info">
											<div class="info-inner p-3 bg-white">
												<span class="p-name"><%=sanPham.getTen()%></span> <span
													class="p-company"></span>
											</div>
										</div>
									</div>
									</a>

									<div class="box-down">
										<div class="h-bg">
											<div class="h-bg-inner"></div>
										</div>
										<div class="cart">
										<span class="price format-price"><%=sanPham.getGia()%></span>
            							<span class="add-to-cart">
              							<a class="txt btn-add-cart" style="cursor: pointer; white-space: nowrap;"
											href="AddToCart?ma=<%=sanPham.getMa()%>">Add in cart</a>
           								 
										</div>
									</div>
								</div>
							</div>
							<%
							}
							%>
							
						</div>
					</div>

					<!-- pati -->
					<div class="w-100 d-flex justify-content-center">
						<div class="d-flex mt-2 ">

							<%
							String url = (String) request.getAttribute("url");
							int currentPageforPre = 0;
							int currentPageNext = 0;
							int currentPage = 1;
							int endPage = Integer.parseInt(request.getAttribute("endPage").toString());
							if (request.getParameter("currentPage") != null) {
								currentPage = Integer.parseInt(request.getParameter("currentPage"));
							}
							currentPageforPre = (currentPage == 1) ? 1 : currentPage - 1;
							currentPageNext = (currentPage == endPage) ? endPage : currentPage + 1;
							%>
							<!-- xu ly -->
							<%
							if (endPage != 1) {
							%>
							<%
							if (currentPage != 1) {
							%>
							<a class="me-4 text-center d-flex radio-item" style=""
								href="<%=url%>currentPage=<%=1%>"><<</a> <a
								class="me-4 text-center d-flex radio-item" style=""
								href="<%=url%>currentPage=<%=currentPageforPre%>"><</a>
							<%}%>
							<%
							for (int i = 1; i <= endPage; i++) {

								if (i >= (currentPage - 2) && i <= (currentPage + 2)) {
							%>
							<a
								class="me-4 text-center d-flex radio-item <%=(i == currentPage) ? "actived" : ""%> "
								style="" href="<%=url%>currentPage=<%=i%>"><%=i%></a>
							<%
							}
							%>
							<%
							}
							%>

							<%
							if (currentPage != endPage) {
							%>
							<a class="me-4 text-center d-flex radio-item" style=""
								href="<%=url%>currentPage=<%=currentPageNext%>">></a> <a
								class="me-4 text-center d-flex radio-item" style=""
								href="<%=url%>currentPage=<%=endPage%>">>></a>
							<%}%>
							<%
							}
							%>
						</div>
					</div>
				</div>
					
			</div>
		</div>
	</section>
	<!-- Shop Section End -->

	<!-- Footer Section Begin -->
	<%@include file="footer-include.jsp"%>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<%@include file="link-script-include.jsp"%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		
	</script>

</body>
</html>
