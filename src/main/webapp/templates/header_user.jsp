<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Page Preloder -->
<div id="preloder">
	<div class="loader"></div>
</div>

<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
	<div class="humberger__menu__logo">
		<a href="#"><img src="<c:url value="templates/img/logo.png"/>" alt=""></a>
	</div>
	<div class="humberger__menu__cart">
		<ul>
			<li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
			<li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
		</ul>
	</div>
	<div class="humberger__menu__widget">
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
			<a href="#"><i class="fa fa-user"></i> Login</a>
		</div>
	</div>
	<nav class="humberger__menu__nav mobile-menu">
		<ul>
			<li class="active"><a href="${pageContext.request.contextPath}/home">Home</a></li>
			<li><a href="${pageContext.request.contextPath}/shop">Sản phẩm</a></li>
			<li><a href="#">Trang</a>
				<ul class="header__menu__dropdown">
					<li><a href="${pageContext.request.contextPath}/shop">Sẩn phẩm</a></li>
					<li><a href="${pageContext.request.contextPath}/order_details?cid=?">Hóa đơn</a></li>
					<li><a href="${pageContext.request.contextPath}/check_out?">Thanh toán</a></li>
				</ul></li>
			<li><a href="${pageContext.request.contextPath}/contact">Liên hệ</a></li>
		</ul>
	</nav>
	<div id="mobile-menu-wrap"></div>
	<div class="header__top__right__social">
		<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
			class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a>
		<a href="#"><i class="fa fa-pinterest-p"></i></a>
	</div>
	<div class="humberger__menu__contact">
		<ul>
			<li><i class="fa fa-envelope"></i> vpp@laptrinhweb.com</li>
			<li>Miễn phí vận chuyển cho đơn hàng trên 200k</li>
		</ul>
	</div>
</div>
<!-- Header Section Begin -->
<header class="header">
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="header__top__left">
						<ul>
							<li><i class="fa fa-envelope"></i>vpp@laptrinhweb.com</li>
							<li>Miễn phí vận chuyển cho đơn hàng trên 200k</li>
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
							<a href="#"><i class="fa fa-user"></i> Đăng nhập</a>
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
					<a href="#"><img src="<c:url value="templates/img/logo.png"/>"/></a>
				</div>
			</div>
			<div class="col-lg-6">
				<nav class="header__menu">
					<ul>
						<li class="active"><a href="./index.html">Home</a></li>
						<li><a href="./shop-grid.html">Sản phẩm</a></li>
						<li><a href="#">Trang</a>
							<ul class="header__menu__dropdown">
								<li><a href="./shop-details.html">Sản phẩm</a></li>
								<li><a href="./shoping-cart.html">Hóa đơn</a></li>
								<li><a href="./checkout.html">Thanh toán</a></li>
							</ul></li>
						<li><a href="./contact.html">Liên hệ</a></li>
					</ul>
				</nav>
			</div>
			<div class="col-lg-3">
				<div class="header__cart">
					<ul>
						<li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
						<li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="humberger__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
</header>
