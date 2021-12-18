<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Cửa hàng</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
<link rel="icon" href="<c:url value="templates/img/icon.png"/>" />
<!-- Css Styles -->
<link rel="stylesheet"
	href="<c:url value="templates/css/bootstrap.min.css"/>" type="text/css" />
<link rel="stylesheet"
	href="<c:url value="templates/css/font-awesome.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<c:url value="templates/css/elegant-icons.css"/>" type="text/css" />
<link rel="stylesheet"
	href="<c:url value="templates/css/nice-select.css"/>" type="text/css" />
<link rel="stylesheet"
	href="<c:url value="templates/css/jquery-ui.min.css"/>" type="text/css" />
<link rel="stylesheet"
	href="<c:url value="templates/css/owl.carousel.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<c:url value="templates/css/slicknav.min.css"/>" type="text/css" />
<link rel="stylesheet" href="<c:url value="templates/css/style.css" />"
	type="text/css" />
<style>
.categoytag:hover {
	color: #002eff;
}
</style>
</head>

<body>
	<jsp:include page="header_user.jsp"></jsp:include>
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="header__top__left">
							<ul>
								<c:if
									test="${sessionScope.user.getEmail() == 'hoadaknong101@gmail.com'}">
									<li><i class="fa fa-envelope"></i>hoadaknong101@gmail.com</li>
									<li><a
										href="${pageContext.request.contextPath}/manageproduct">Quản
											lý</a></li>
								</c:if>
								<c:if
									test="${sessionScope.user.getEmail() != 'hoadaknong101@gmail.com'}">
									<li><i class="fa fa-envelope"></i>${sessionScope.user.getEmail()}</li>
									<li>Miễn phí vận chuyển cho đơn hàng trên 500k</li>
								</c:if>
							</ul>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">
							<div class="header__top__right__social">
								<a href="https://www.facebook.com/hoaffffff/" target="_blank"><i
									class="fa fa-facebook"></i></a> <a
									href="https://www.youtube.com/channel/UCBU9tA7jC921AeFHGtXQLUw"
									target="_blank"><i class="fa fa-youtube"></i></a> <a
									href="https://github.com/hoadaknong101/web_project"
									target="_blank"><i class="fa fa-github"></i></a>
							</div>
							<div class="header__top__right__language">
								<img src="<c:url value="templates/img/language.png"/>" alt="">
								<div>English</div>
								<span class="arrow_carrot-down"></span>
								<ul>
									<li><a href="#">Tiếng Việt</a></li>
									<li><a href="#">English</a></li>
								</ul>
							</div>
							<div class="header__top__right__auth">
								<c:if test="${sessionScope.user != null }">
									<a href="${pageContext.request.contextPath}/signout"><i
										class="fa fa-user"></i> Đăng xuất</a>
								</c:if>
								<c:if test="${sessionScope.user == null }">
									<a href="${pageContext.request.contextPath}/signin"><i
										class="fa fa-user"></i> Đăng nhập</a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="#"><img src="<c:url value="templates/img/logo.png"/>" /></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li><a href="${pageContext.request.contextPath}/home">Home</a></li>
							<li class="active"><a
								href="${pageContext.request.contextPath}/shop">Sản phẩm</a></li>
							<li><a href="#">Trang</a>
								<ul class="header__menu__dropdown">
									<li><a href="${pageContext.request.contextPath}/shop">Sản
											phẩm</a></li>
									<li><a
										href="${pageContext.request.contextPath}/shoppingcart">Giỏ
											hàng</a></li>
								</ul></li>
							<li><a href="${pageContext.request.contextPath}/contact">Liên
									hệ</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__cart">
						<ul>
							<li><a href="#"><i class="fa fa-heart"></i> <span>0</span></a></li>
							<c:if test="${sessionScope.order != null}">
								<li><a
									href="${pageContext.request.contextPath}/shoppingcart"><i
										class="fa fa-shopping-bag"></i> <span>${sessionScope.order.getAmount()}</span></a></li>
							</c:if>
							<c:if test="${sessionScope.order == null}">
								<li><a
									href="${pageContext.request.contextPath}/shoppingcart"><i
										class="fa fa-shopping-bag"></i> <span>0</span></a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
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
								<li><a href="category?cid=${p.getId() }">${p.getName()}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="search" method="POST">
								<div class="hero__search__categories">Tất cả</div>
								<input type="text" name="search" placeholder="Nhập tại đây...">
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
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="<c:url value="templates/img/breadcrumb.jpg"/>">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>VĂN PHÒNG PHẨM</h2>
						<div class="breadcrumb__option">
							<a href="${pageContext.request.contextPath}/home">Trang chủ</a> <span>Cửa
								hàng</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>Văn phòng phẩm</h4>
							<ul>
								<c:forEach var="p" items="${listCategory}">
									<li><a class="categoytag"
										href="category?cid=${p.getId() }">${p.getName()}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-7">
					<div class="filter__item">
						<div class="row">
							<div class="col-lg-4 col-md-5">
								<div class="filter__sort">
									<span>Sắp xếp</span> <select>
										<option value="0">Mặc định</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row" id="product">
						<c:forEach var="p" items="${listProducts}">
							<div class="product col-lg-4 col-md-6 col-sm-6">
								<div class="product__item">
									<div class="product__item__pic set-bg"
										data-setbg="${p.getImagePath() }">
										<ul class="product__item__pic__hover">
											<li><a><i class="fa fa-heart"></i></a></li>
											<li><a><i class="fa fa-retweet"></i></a></li>
											<li><a><i class="fa fa-shopping-cart"
													onclick="addtocart('${pageContext.request.contextPath}','${p.getId()}');"></i></a></li>
										</ul>
									</div>
									<div class="product__item__text">
										<h6>
											<a href="chitietsanpham?pid=${p.getId()}">${p.getName() }</a>
										</h6>
										<h5>
											<fmt:formatNumber type="number" pattern="###,###"
												value="${p.getPrice()}" />
											VNĐ
										</h5>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="product__pagination">
						<button onclick="loadMore()" class="primary-btn"
							style="border: none;">Tải thêm</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Section End -->

	<!-- Footer Section Begin -->
	<jsp:include page="footer_user.jsp"></jsp:include>
	<!-- Footer Section End -->
	<script>
		function loadMore() {
			var amount = document.getElementsByClassName("product").length - 1;
			console.log(amount);
			$.ajax({
				url : "/project_cuoi_ky/loadmore",
				type : "get",
				data : {
					exist : amount
				},
				success : function(data) {
					var row = document.getElementById("product");
					row.innerHTML += data;
				},
				error : function(xhr) {

				}
			});
		}
		function addtocart(path, id) {
			var currentpath = window.location;
			document.location.href = path + "/addtocart?pid=" + id
					+ "&currentpath=" + currentpath;
		}
	</script>
	<!-- Js Plugins -->
	<script src="<c:url value="templates/js/jquery-3.3.1.min.js"/>">
		
	</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script src="<c:url value="templates/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="templates/js/jquery.nice-select.min.js"/>"></script>
	<script src="<c:url value="templates/js/jquery-ui.min.js"/>"></script>
	<script src="<c:url value="templates/js/jquery.slicknav.js"/>"></script>
	<script src="<c:url value="templates/js/mixitup.min.js"/>"></script>
	<script src="<c:url value="templates/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value="templates/js/main.js"/>"></script>



</body>

</html>