<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Đăng nhập</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="<c:url value ="templates/login_form/css/style.css"/>">
</head>
<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-5">
					<div class="wrap">
						<div class="img"
							style="background-image: url(templates/login_form/images/bg-1.jpg);"></div>
						<div class="login-wrap p-4 p-md-5">
							<div class="d-flex">
								<div class="w-100">
									<h3 class="mb-4">Đăng nhập</h3>
								</div>
								<div class="w-100">
									<p class="social-media d-flex justify-content-end">
										<a href="#"
											class="social-icon d-flex align-items-center justify-content-center"><span
											class="fa fa-facebook"></span></a> <a href="#"
											class="social-icon d-flex align-items-center justify-content-center"><span
											class="fa fa-twitter"></span></a>
									</p>
								</div>
							</div>
							<form action="signin" method="POST" class="signin-form">
								<div class="form-group mt-3">
									<input type="email" class="form-control" name="email" required>
									<label class="form-control-placeholder" for="username">Email</label>
								</div>
								<div class="form-group">
									<input id="password" type="password" name="password"
										class="form-control" required> <label
										class="form-control-placeholder" for="password">Mật
										khẩu</label> <i class="fa fa-fw fa-eye field-icon"
										onclick="hideShowPassword()"></i>
								</div>
								<div class="form-group">
									<p class="text-center" style="color: red;">${errorMessage}</p>
								</div>
								<div class="form-group">
									<button type="submit"
										class="form-control btn btn-primary rounded submit px-3">Đăng
										nhập</button>
								</div>
								<div class="form-group d-md-flex">
									<div class="w-50 text-left">
										<label class="checkbox-wrap checkbox-primary mb-0">Ghi
											nhớ đăng nhập <input type="checkbox" checked> <span
											class="checkmark"></span>
										</label>
									</div>
									<div class="w-50 text-md-right">
										<a href="#">Quên mật khẩu</a>
									</div>
								</div>
							</form>
							<p class="text-center">
								Chưa có tài khoản? <a
									href="${pageContext.request.contextPath}/signup">Đăng ký</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		var hide = true;
		function hideShowPassword() {
			if (hide) {
				document.getElementById('password').type = "text";
				hide = false;
			} else {
				document.getElementById('password').type = "password";
				hide = true;
			}
		}
	</script>
	<script src="<c:url value ="templates/login_form/js/jquery.min.js"/>"></script>
	<script src="<c:url value ="templates/login_form/js/popper.js"/>"></script>
	<script
		src="<c:url value ="templates/login_form/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value ="templates/login_form/js/main.js/"/>"></script>

</body>
</html>

