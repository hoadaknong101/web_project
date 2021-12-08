<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Manage Customer</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
	color: #566787;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
	font-size: 13px;
}

.table-responsive {
	margin: 30px 0;
}

.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	min-width: 1000px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 15px;
	background: #435d7d;
	color: #fff;
	padding: 16px 30px;
	min-width: 100%;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

.table-title .btn-group {
	float: right;
}

.table-title .btn {
	color: #fff;
	float: right;
	font-size: 13px;
	border: none;
	min-width: 50px;
	border-radius: 2px;
	border: none;
	outline: none !important;
	margin-left: 10px;
}

.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}

.table-title .btn span {
	float: left;
	margin-top: 2px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 100px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
	outline: none !important;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: #F44336;
}

table.table td i {
	font-size: 19px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.pagination {
	float: right;
	margin: 0 0 5px;
}

.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}

.pagination li a:hover {
	color: #666;
}

.pagination li.active a, .pagination li.active a.page-link {
	background: #03A9F4;
}

.pagination li.active a:hover {
	background: #0397d6;
}

.pagination li.disabled i {
	color: #ccc;
}

.pagination li i {
	font-size: 16px;
	padding-top: 6px
}

.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}
/* Custom checkbox */
.custom-checkbox {
	position: relative;
}

.custom-checkbox input[type="checkbox"] {
	opacity: 0;
	position: absolute;
	margin: 5px 0 0 3px;
	z-index: 9;
}

.custom-checkbox label:before {
	width: 18px;
	height: 18px;
}

.custom-checkbox label:before {
	content: '';
	margin-right: 10px;
	display: inline-block;
	vertical-align: text-top;
	background: white;
	border: 1px solid #bbb;
	border-radius: 2px;
	box-sizing: border-box;
	z-index: 2;
}

.custom-checkbox input[type="checkbox"]:checked+label:after {
	content: '';
	position: absolute;
	left: 6px;
	top: 3px;
	width: 6px;
	height: 11px;
	border: solid #000;
	border-width: 0 3px 3px 0;
	transform: inherit;
	z-index: 3;
	transform: rotateZ(45deg);
}

.custom-checkbox input[type="checkbox"]:checked+label:before {
	border-color: #03A9F4;
	background: #03A9F4;
}

.custom-checkbox input[type="checkbox"]:checked+label:after {
	border-color: #fff;
}

.custom-checkbox input[type="checkbox"]:disabled+label:before {
	color: #b8b8b8;
	cursor: auto;
	box-shadow: none;
	background: #ddd;
}
/* Modal styles */
.modal .modal-dialog {
	max-width: 400px;
}

.modal .modal-header, .modal .modal-body, .modal .modal-footer {
	padding: 20px 30px;
}

.modal .modal-content {
	border-radius: 3px;
	font-size: 14px;
}

.modal .modal-footer {
	background: #ecf0f1;
	border-radius: 0 0 3px 3px;
}

.modal .modal-title {
	display: inline-block;
}

.modal .form-control {
	border-radius: 2px;
	box-shadow: none;
	border-color: #dddddd;
}

.modal textarea.form-control {
	resize: vertical;
}

.modal .btn {
	border-radius: 2px;
	min-width: 100px;
}

.modal form label {
	font-weight: normal;
}
</style>
<script>
	function testConfirmDialog(id) {
		var result = confirm("Are you sure?");
		if (result) {
			window.location.href = "deletecustomer?cid=" + id;
		} else {
			return false;
		}
	}
	$(document).ready(function() {
		// Activate tooltip
		$('[data-toggle="tooltip"]').tooltip();

		// Select/Deselect checkboxes
		var checkbox = $('table tbody input[type="checkbox"]');
		$("#selectAll").click(function() {
			if (this.checked) {
				checkbox.each(function() {
					this.checked = true;
				});
			} else {
				checkbox.each(function() {
					this.checked = false;
				});
			}
		});
		checkbox.click(function() {
			if (!this.checked) {
				$("#selectAll").prop("checked", false);
			}
		});
	});
</script>
</head>
<body>
	<div class="container-fluid p-0">
		<div class="row" id = "body-row">
		<div id="sidebar-container" class="sidebar-expanded d-none d-md-block" style="margin: 30px 5px 50px 30px;">
				<div class="d-flex flex-column flex-shrink-0 p-3 text-white" style="width: 280px; background-color:#435e7c; border-radius: 3px">
					<a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
						<span class="fs-4" style="font-size:24px; margin: 0 0 0 75px;">ADMIN</span>
					</a>
					<hr>
					<ul class="nav nav-pills flex-column mb-auto">
						<li class="nav-item">
							<a href="${pageContext.request.contextPath}/manageproduct" class="nav-link text-white" aria-current="page">
								Sản phẩm
							</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/manageorder" class="nav-link text-white">
								Đơn hàng
							</a>
						</li>
						<li>
							<a href="#" class="nav-link text-white active">
								Khách hàng
							</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/managecategory" class="nav-link text-white">
								Phân loại
							</a>
						</li>
					</ul>		
				</div>
			</div>
		<div class="col">
			<div class="table-responsive">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-6">
							<h2>
								Quản lý <b>Khách hàng</b>
							</h2>
						</div>
						<div class="col-sm-6">
							<a href="#addProduct" class="btn btn-success" data-toggle="modal"><i
								class="material-icons">&#xE147;</i> <span>Thêm</span></a>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Mã</th>
							<th>Họ và tên</th>
							<th>Email</th>
							<th>Số ĐT</th>
							<th>Mật khẩu</th>
							<th>Hành động</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="c" items="${listCustomer}">
							<tr>
								<td>${c.getId()}</td>
								<td>${c.getName()}</td>
								<td>${c.getEmail()}</td>
								<td>${c.getPhoneNumber()}</td>
								<td>${c.getPassword()}</td>
								<td><a href="editcustomer?cid=${c.getId()}"><i
										class="material-icons" title="Edit">&#xE254;</i></a> <a
									onclick="testConfirmDialog(${c.getId()});"
									href="deletecustomer?cid=${c.getId()}" class="delete"
									data-toggle="modal"><i class="material-icons"
										data-toggle="tooltip" title="Delete">&#xE872;</i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="clearfix">
					<div class="hint-text">
						Hiện tại có <b>${listCustomer.size()}</b> khách hàng.
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
		
	</div>
	<!-- Edit Modal HTML -->
	<div id="addProduct" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="insertcustomer" method="post">
					<div class="modal-header">
						<h4 class="modal-title">Thêm khách hàng</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Họ và tên</label> <input name="name" type="text"
								class="form-control" required>
						</div>						
						<div class="form-group">
							<label>Email</label> <input name="email" type="email"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Số ĐT</label> <input name="phoneNumber" type="tel"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label>Mật khẩu</label> <input type="password" name="password"
								class="form-control" required>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Hủy"> <input type="submit"
							class="btn btn-success" value="Thêm">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>