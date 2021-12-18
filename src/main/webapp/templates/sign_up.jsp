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
<script>
	function matchPassword() {
		var pw1 = document.getElementById("password-field");
		var pw2 = document.getElementById("password-field1");
		if (pw1 != pw2) {
			alert("Passwords did not match");
			return false;
		}
		return true;
	}
	var hide = true;
	function hideShowPassword() {
		if (hide) {
			document.getElementById('password-field').type = "text";
			hide = false;
		} else {
			document.getElementById('password-field').type = "password";
			hide = true;
		}
	}
	function hideShowPassword1() {
		if (hide) {
			document.getElementById('password-field1').type = "text";
			hide = false;
		} else {
			document.getElementById('password-field1').type = "password";
			hide = true;
		}
	}
</script>

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
									<h3 class="mb-4">Đăng ký</h3>
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
							<form action="signup" class="signin-form" method="POST">
								<div class="form-group mt-3">
									<input type="text" name="name" class="form-control" required>
									<label class="form-control-placeholder" for="username">Họ
										và tên</label>
								</div>
								<div class="form-group mt-3">
									<input type="email" name="email" class="form-control" required>
									<label class="form-control-placeholder" for="username">Email</label>
								</div>
								<div class="form-group mt-3">
									<input type="tel" name="phone" class="form-control" required>
									<label class="form-control-placeholder" for="username">Số
										điện thoại</label>
								</div>
								<div class="form-group">
									<input id="password-field" type="password" name="password"
										class="form-control" required> <label
										class="form-control-placeholder" for="password">Mật
										khẩu</label> <span class="fa fa-fw fa-eye field-icon toggle-password"
										onclick="hideShowPassword();"></span>
								</div>
								<div class="form-group">
									<input id="password-field1" type="password"
										name="passwordConfirm" class="form-control" required>
									<label class="form-control-placeholder" for="password">Nhập
										lại mật khẩu</label> <span
										class="fa fa-fw fa-eye field-icon toggle-password"
										onclick="hideShowPassword1();"></span>
								</div>
								<div class="form-group">
									<p class="text-center" style="color: red;">${errorMessage}</p>
								</div>
								<div class="form-group">
									<input type="submit"
										class="form-control btn btn-primary rounded submit px-3"
										value="Đăng ký" />
								</div>

							</form>
							<p class="text-center">
								Đã có tài khoản? <a
									href="${pageContext.request.contextPath}/signin">Đăng nhập</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="<c:url value ="templates/login_form/js/jquery.min.js"/>"></script>
	<script src="<c:url value ="templates/login_form/js/popper.js"/>"></script>
	<script
		src="<c:url value ="templates/login_form/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value ="templates/login_form/js/main.js/"/>"></script>

</body>
</html>

