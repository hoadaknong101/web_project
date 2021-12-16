<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="icon" href="<c:url value="templates/img/icon.png"/>" />
<title>Giỏ hàng</title>
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
.buttonchangequantity {
	background-color: #008cba; /* Green */
	border: none;
	color: white;
	padding: 12px 12px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}

.quantitynumber {
	width: 25%;
	padding: 12px 12px;
	text-align: center;
	display: inline-block;
	border: 0px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	color: #008cba;
}
</style>
</head>
<body>
	<!-- Page Preloder -->
	<jsp:include page="header_user.jsp"></jsp:include>
	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
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
					<div class="col-lg-6">
						<div class="header__top__right">
							<div class="header__top__right__social">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-linkedin"></i></a> <a href="#"><i
									class="fa fa-pinterest-p"></i></a>
							</div>
							<div class="header__top__right__language">
								<img src="<c:url value="templates/img/language.png"/>" alt="">
								<div>Tiếng Việt</div>
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
						<a href="${pageContext.request.contextPath}/home"><img
							src="<c:url value="templates/img/logo.png"/> " alt=""></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li><a href="${pageContext.request.contextPath}/home">Home</a></li>
							<li><a href="${pageContext.request.contextPath}/shop">Sản
									phẩm</a></li>
							<li class="active"><a href="#">Trang</a>
								<ul class="header__menu__dropdown">
									<li><a href="${pageContext.request.contextPath}/shop">Sản
											phẩm</a></li>
									<li><a
										href="${pageContext.request.contextPath}/shoppingcart">Giỏ
											hàng</a></li>
								</ul></li>
							<li><a href="${pageContext.request.contextPath}/contact">Liên hệ</a></li>
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
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<section class="hero hero-normal">
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
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="<c:url value="templates/img/breadcrumb.jpg"/> ">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Giỏ Hàng</h2>
						<div class="breadcrumb__option">
							<a href="${pageContext.request.contextPath}/home">Trang chủ</a> <span>Giỏ
								Hàng</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shoping Cart Section Begin -->
	<section class="shoping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table">
						<table>
							<thead>
								<tr>
									<th class="shoping__product">Sản phẩm</th>
									<th>Giá</th>
									<th>Số lượng</th>
									<th>Tổng cộng</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="o" items="${listOrderDetails}">
									<tr>
										<td class="shoping__cart__item"><a
											href="${pageContext.request.contextPath}/chitietsanpham?pid=${o.getProductID()}"><img
												src="${o.getImagePath()}" width="100px" height="100px"
												alt=""></a>
											<h5>
												<a
													href="${pageContext.request.contextPath}/chitietsanpham?pid=${o.getProductID()}">${o.getName()}</a>
											</h5></td>
										<td class="shoping__cart__price"><fmt:formatNumber
												type="number" pattern="###,###" value="${o.getPrice()}" />
											VNĐ</td>
										<td class="shoping__cart__quantity">
											<button class="buttonchangequantity"
												onclick="decreaseQuantity('${pageContext.request.contextPath}', '${o.getId()}')">-</button>
											<input class="quantitynumber" id="quantity_${o.getId()}"
											type="text" value="${o.getQuantity()}" readonly>
											<button class="buttonchangequantity"
												onclick="increaseQuantity('${pageContext.request.contextPath}', '${o.getId()}');">+</button>
										</td>
										<td class="shoping__cart__total"><fmt:formatNumber
												type="number" pattern="###,###"
												value="${o.getPrice() * o.getQuantity()}" /> VNĐ</td>
										<td class="shoping__cart__item__close"><a
											href="deleteorderdetails?o=${o.getId()}"><span
												class="icon_close"></span></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<script>
				function increaseQuantity(path, id) {
					var quantity = document.getElementById('quantity_' + id).value;
					window.location.href = path + "/increasequantity?id=" + id;
				}
				function decreaseQuantity(path, id) {
					var quantity = parseFloat(document
							.getElementById('quantity_' + id).value);
					if (quantity == 1) {
						document.getElementById('quantity_' + id).value = 1;
					} else {
						window.location.href = path + "/decreasequantity?id="
								+ id;
					}
				}
			</script>
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__btns">
						<a href="${pageContext.request.contextPath}/shop"
							class="primary-btn cart-btn">TIẾP TỤC MUA SẮM</a> <a
							href="${pageContext.request.contextPath}/shoppingcart"
							class="primary-btn cart-btn cart-btn-right"><span
							class="icon_loading"></span> CẬP NHẬT GIỎ HÀNG</a>
					</div>
				</div>
				<div class="col-lg-6"></div>
				<div class="col-lg-6">
					<div class="shoping__checkout">
						<h5>Thanh Toán</h5>
						<ul>
							<li>Hiện tại<span><fmt:formatNumber type="number"
										pattern="###,###" value="${total}" /> VNĐ</span></li>
							<li>Tổng cộng<span><fmt:formatNumber type="number"
										pattern="###,###" value="${total}" /> VNĐ</span></li>
						</ul>
						<a href="${pageContext.request.contextPath}/checkout?oid=${oid}"
							class="primary-btn">THANH TOÁN</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shoping Cart Section End -->

	<!-- Footer Section Begin -->
	<jsp:include page="footer_user.jsp"></jsp:include>
	<!-- Footer Section End -->

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