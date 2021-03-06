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
<title>${p.getName()}</title>

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
										href="${pageContext.request.contextPath}/manageproduct">Qu???n
											l??</a></li>
								</c:if>
								<c:if
									test="${sessionScope.user.getEmail() != 'hoadaknong101@gmail.com'}">
									<li><i class="fa fa-envelope"></i>${sessionScope.user.getEmail()}</li>
									<li>Mi???n ph?? v???n chuy???n cho ????n h??ng tr??n 500k</li>
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
									<li><a href="#">Ti???ng Vi???t</a></li>
									<li><a href="#">English</a></li>
								</ul>
							</div>
							<div class="header__top__right__auth">
								<c:if test="${sessionScope.user != null }">
									<a href="${pageContext.request.contextPath}/signout"><i
										class="fa fa-user"></i> ????ng xu???t</a>
								</c:if>
								<c:if test="${sessionScope.user == null }">
									<a href="${pageContext.request.contextPath}/signin"><i
										class="fa fa-user"></i> ????ng nh???p</a>
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
								href="${pageContext.request.contextPath}/shop">S???n ph???m</a></li>
							<li><a href="#">Trang</a>
								<ul class="header__menu__dropdown">
									<li><a href="${pageContext.request.contextPath}/shop">S???n
											ph???m</a></li>
									<li><a
										href="${pageContext.request.contextPath}/shoppingcart">H??a
											????n</a></li>
								</ul></li>
							<li><a href="${pageContext.request.contextPath}/contact">Li??n
									h???</a></li>
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
							<i class="fa fa-bars"></i> <span>V??n ph??ng ph???m</span>
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
								<div class="hero__search__categories">T???t c???</div>
								<input type="text" name="search" placeholder="Nh???p t???i ????y...">
								<button type="submit" class="site-btn">T??m</button>
							</form>
						</div>
						<div class="hero__search__phone">
							<div class="hero__search__phone__icon">
								<i class="fa fa-phone"></i>
							</div>
							<div class="hero__search__phone__text">
								<h5>+84 868 690 043</h5>
								<span>h??? tr??? 24/7</span>
							</div>
						</div>
					</div>
					<div class="hero__item set-bg"
						data-setbg="<c:url value="templates/img/hero/banner.jpg"/>">
						<div class="hero__text">
							<span>V??N PH??NG PH???M</span>
							<h2>
								S???n ph???m <br />100% ch??nh h??ng
							</h2>
							<p>Mi???n ph?? v???n chuy???n ?????n 0??</p>
							<a href="#" class="primary-btn">MUA NGAY</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="breadcrumb-section set-bg"
		data-setbg="<c:url value="templates/img/breadcrumb.jpg"/>">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>${p.getName()}</h2>
						<div class="breadcrumb__option">
							<a href="${pageContext.request.contextPath}/home">Trang ch???</a> <a
								href="${pageContext.request.contextPath}/category?cid=${p.getCatagory().getId()}">${p.getCatagory().getName()}</a>
							<span>${p.getName()}</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="${p.getImagePath()}" alt="">
						</div>
						<div class="product__details__pic__slider owl-carousel"></div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>${p.getName()}</h3>
						<div class="product__details__price">
							<fmt:formatNumber type="number" pattern="###,###"
								value="${p.getPrice()}" />
							VN??
						</div>
						<p>100% h??ng ch??nh h??ng</p>
						<div class="product__details__quantity">
							<div class="quantity">
								<div class="pro-qty">
									<input id="quantityproduct" name="quantity" type="text"
										value="1">
								</div>
							</div>
						</div>
						<button class="primary-btn"
							onclick="addtocart('${pageContext.request.contextPath}', '${p.getId()}');">Th??m
							v??o gi??? h??ng</button>
						<ul>
							<li><b>Chia s??? : </b>
								<div class="share">
									<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
										class="fa fa-twitter"></i></a> <a href="#"><i
										class="fa fa-instagram"></i></a> <a href="#"><i
										class="fa fa-pinterest"></i></a>
								</div></li>
						</ul>
					</div>
				</div>

				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">M??
									t???</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>Th??ng Tin Chi Ti???t</h6>
									<p>M?? s???n ph???m : ${p.getId()}</p>
									<p>T??n s???n ph???m : ${p.getName()}</p>
									<p>Lo???i s???n ph???m : Lo???i s???n ph???m</p>
									<p>Nh?? cung c???p : Nh?? cung c???p</p>
									<p>${p.getDescription()}</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->

	<!-- Related Product Section Begin -->
	<section class="related-product">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title related__product__title">
						<h2>S???n Ph???m Li??n Quan</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach var="r" items="${relatedProducts}">
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="product__item">
							<div class="product__item__pic set-bg"
								data-setbg="${r.getImagePath()}">
								<ul class="product__item__pic__hover">
									<li><a><i class="fa fa-heart"></i></a></li>
									<li><a><i class="fa fa-retweet"></i></a></li>
									<li><a><i class="fa fa-shopping-cart"
											onclick="addtocart('${pageContext.request.contextPath}','${r.getId()}');"></i></a></li>
								</ul>
							</div>
							<div class="product__item__text">
								<h6>
									<a href="chitietsanpham?pid=${r.getId()}">${r.getName()}</a>
								</h6>
								<h5>
									<fmt:formatNumber type="number" pattern="###,###"
										value="${r.getPrice()}" />
									VN??
								</h5>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</section>
	<!-- Related Product Section End -->
	<script>
		function addtocart(path, id) {
			var quantity = document.getElementById('quantityproduct').value;
			var currentpath = window.location;
			window.location.href = path + "/addtocart?pid=" + id + "&quantity="
					+ quantity + "&currentpath=" + currentpath;
		}
	</script>
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