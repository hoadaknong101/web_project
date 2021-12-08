<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Văn phòng phẩm PTH</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="<c:url value="templates/css/bootstrap.min.css"/>" type="text/css">
<link rel="stylesheet"
	href="<c:url value="templates/css/font-awesome.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="templates/css/elegant-icons.css"/>" type="text/css">
<link rel="stylesheet"
	href="<c:url value="templates/css/nice-select.css"/>" type="text/css">
<link rel="stylesheet"
	href="<c:url value="templates/css/jquery-ui.min.css"/>" type="text/css">
<link rel="stylesheet"
	href="<c:url value="templates/css/owl.carousel.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="templates/css/slicknav.min.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="templates/css/style.css" />"
	type="text/css">
</head>

<body>
	<jsp:include page="header_user.jsp"></jsp:include>
	<section class="hero">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>Văn phòng phẩm</span>
						</div>
						<ul>
							<c:forEach var="p" items="${listCategory}">
								<li><a href="#">${p.getName()}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="#">
								<div class="hero__search__categories">Tất cả</div>
								<input type="text" placeholder="Nhập tại đây...">
								<button type="submit" class="site-btn">Tìm</button>
							</form>
						</div>
						<div class="hero__search__phone">
							<div class="hero__search__phone__icon">
								<i class="fa fa-phone"></i>
							</div>
							<div class="hero__search__phone__text">
								<h5>+84 868 690 043</h5>
								<span>hỗ trợ 24/7</span>
							</div>
						</div>
					</div>
					<div class="hero__item set-bg"
						data-setbg="<c:url value="templates/img/hero/banner.jpg"/>">
						<div class="hero__text">
							<span>VĂN PHÒNG PHẨM</span>
							<h2>
								Sản phẩm <br />100% chính hãng
							</h2>
							<p>Miễn phí vận chuyển đến 0đ</p>
							<a href="#" class="primary-btn">MUA NGAY</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Categories Section Begin -->
	<section class="categories">
		<div class="container">
			<div class="row">
				<div class="categories__slider owl-carousel">
					<c:forEach var="p" items="${listCategory}">
						<div class="col-lg-3">
							<div class="categories__item set-bg"
								data-setbg="<c:url value="templates/img/categories/cat-1.jpg"/>">
								<h5>
									<a href="#">${p.getName()}</a>
								</h5>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<!-- Categories Section End -->

	<!-- Featured Section Begin -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>Sản Phẩm Nổi Bật</h2>
					</div>
					<div class="featured__controls"></div>
				</div>
			</div>
			<div class="row featured__filter">
				<c:forEach var="p" items="${featuredProducts}">
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="featured__item">
							<div class="featured__item__pic set-bg"
								data-setbg="${p.getImagePath()}">
								<ul class="featured__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="featured__item__text">
								<h6>
									<a href="#">${p.getName()}</a>
								</h6>
								<h5>${p.getPrice()}</h5>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- Featured Section End -->

	<!-- Banner Begin -->
	<div class="banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="banner__pic">
						<img src="<c:url value="templates/img/banner/banner-1.jpg"/>"
							alt="" width="570" height="270" />
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="banner__pic">
						<img src="<c:url value = "templates/img/banner/banner-2.jpg"/>"
							alt="" width="570" height="270" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Banner End -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title"></div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer_user.jsp"></jsp:include>
	<!-- Js Plugins -->
	<script src="<c:url value="templates/js/jquery-3.3.1.min.js"/>"></script>
	<script src="<c:url value="templates/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="templates/js/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value="templates/js/jquery-ui.min.js"/>"></script>
	<script src="<c:url value="templates/js/jquery.slicknav.js"/>"></script>
	<script src="<c:url value="templates/js/mixitup.min.js"/>"></script>
	<script src="<c:url value="templates/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value="templates/js/main.js"/>"></script>



</body>

</html>