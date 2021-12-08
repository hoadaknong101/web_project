<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Footer Section Begin -->
<footer class="footer spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="footer__about">
					<div class="footer__about__logo">
						<a href="${pageContext.request.contextPath}/home"><img
							src="<c:url value="templates/img/logo.png"/>" alt="logo"></a>
					</div>
					<ul>
						<li>Địa chỉ: Số 1 Võ Văn Ngân, Quận Thủ Đức, TP.HCM</li>
						<li>SĐT: +84 868 690 043</li>
						<li>Email: vpp@laptrinhweb.com</li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
				<div class="footer__widget">
					<h6>Thông Tin</h6>
					<ul>
						<li><a href="#">MSSV</a></li>
						<li><a href="#">19110365</a></li>
						<li><a href="#">19110426</a></li>
						<li><a href="#">19110463</a></li>
						<li><a target="_blank"
							href="https://www.google.com/maps/place/1+%C4%90.+V%C3%B5+V%C4%83n+Ng%C3%A2n,+Linh+Chi%E1%BB%83u,+Th%E1%BB%A7+%C4%90%E1%BB%A9c,+Th%C3%A0nh+ph%E1%BB%91+H%E1%BB%93+Ch%C3%AD+Minh,+Vi%E1%BB%87t+Nam/@10.8497468,106.7693993,17z/data=!3m1!4b1!4m5!3m4!1s0x317527a03a6378c5:0xb4a838949a4175c8!8m2!3d10.8497415!4d106.771588">Địa
								chỉ</a></li>
					</ul>
					<ul>
						<li><a href="#">Họ và tên</a></li>
						<li><a href="#">Phạm Đinh Quốc Hòa</a></li>
						<li><a href="#">Võ Nhật Phi</a></li>
						<li><a href="#">Phạm Văn Thắng</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4 col-md-12">
				<div class="footer__widget">
					<h6>Hãy tham gia bảng tin của chúng tôi</h6>
					<p>Hãy nhập mail để tham gia với chúng tôi</p>
					<form action="#">
						<input type="text" placeholder="Enter your mail">
						<button type="submit" class="site-btn">Đăng ký</button>
					</form>
					<div class="footer__widget__social">
						<a href="https://www.facebook.com/hoaffffff/" target="_blank"><i class="fa fa-facebook"></i></a>
						<a href="https://www.instagram.com/hoaffffffffff/" target="_blank"><i
							class="fa fa-instagram"></i></a> <a href="https://twitter.com/qhpser" target="_blank"><i
							class="fa fa-twitter"></i></a> <a href="https://www.pinterest.com/hoadaknong101/_saved/" target="_blank"><i
							class="fa fa-pinterest"></i></a>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="footer__copyright">
					<div class="footer__copyright__text">
						<p>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
					<div class="footer__copyright__payment">
						<img src="<c:url value="templates/img/payment-item.png"/>" alt=""/>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- Footer Section End -->
