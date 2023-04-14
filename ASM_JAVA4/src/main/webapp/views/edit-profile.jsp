<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<title>CẬP NHẬT TÀI KHOẢN</title>
</head>
<style>
/* CSS cho ICON LOGIN*/
.user {
	color: rgba(34, 179, 184, 0.975);
	display: inline-block;
	position: relative;
	left: 50%;
	transform: translateX(-50%);
}

.card {
	border-radius: 5%;
}

.login {
	display: inline-block;
	position: relative;
	left: 50%;
	transform: translateX(-50%);
}

a {
	text-decoration: none;
}

.input-group-text {
	background: none;
	font-size: 25px;
}

.form-group {
	margin-left: 40px;
}
</style>
<body>
<c:url var="layout" value="/views"></c:url>
	<div class="card col-sm-7 col-9 my-5 m-auto border-0 shadow-lg ">
		<div class="card-body">
			<form name="" method="POST">
				<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80"
					fill="currentColor" class="user bi-person-circle"
					viewBox="0 0 16 16">
                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                    <path fill-rule="evenodd"
						d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                </svg>
				<div class="title text-center mb-3">
					<h2 class="fw-bolder">CẬP NHẬT TÀI KHOẢN</h2>
				</div>
				<div class="input-group mb-3 px-5">
					<span class="input-group-text border-0" id="basic-addon1"><i class="user bi-person"></i></span>
					<div class="form-floating">
						<input type="text" name="id" value="${user.id}"
							class="form-control" id="floatingFullName" placeholder="ID">
						<label for="floatingFullName">Tài khoản</label>
					</div>
				</div>
				<div class="input-group mb-3 px-5">
					<span class="input-group-text border-0" id="basic-addon1"><i class="user bi-lock-fill"></i></span>
					<div class="form-floating">
						<input type="password" name="password" value="${user.password}"
							class="form-control" id="floatingFullName" placeholder="Mật khẩu">
						<label for="floatingFullName">Mật khẩu</label>
					</div>
				</div>
				<div class="input-group mb-3 px-5">
					<span class="input-group-text border-0" id="basic-addon1"><i
						class="user bi-activity m-auto"></i></span>
					<div class="form-floating">
						<input type="text" name="fullname" value="${user.fullname}"
							class="form-control" id="floatingFullName" placeholder="fullName">
						<label for="floatingFullName">Họ và tên</label>
					</div>
				</div>
				<div class="input-group mb-3 px-5">
					<span class="input-group-text border-0" id="basic-addon1"><i
						class="user bi-envelope-at-fill m-auto"></i></span>
					<div class="form-floating">
						<input type="email" name="email" value="${user.email}"
							class="form-control" id="floatingEmail" placeholder="email">
						<label for="floatingEmail">Email</label>
					</div>
				</div>
				<div class="input-group mb-3 px-5">
					<div class="form-group py-2">
						<div class="form-check form-check-inline p-1">Role</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" ${user.admin?'checked':''}
								name="admin" id="inlineRadio1" value="true">
							<label class="form-check-label font-weight-bold"
								for="inlineRadio1">Admin</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" ${user.admin?'':'checked'}
								name="admin" id="inlineRadio2" value="false">
							<label class="form-check-label" for="inlineRadio2">User</label>
						</div>
					</div>
				</div>
				<c:if test="${!empty message}">
					<div class="text-center mb-3 text-danger fw-bolder">${message}</div>
				</c:if>
				<div class="d-grid gap-2 d-md-flex justify-content-center mb-2">
					<a href="">
						<button style="width: 150px;" formaction="${layout}/edit-profile"
							class="btn btn-light btn-outline-primary mx-2">Cập nhật
						</button>
					</a> <a href="">
						<button style="width: 150px;" formaction="${layout}/trangdau"
							class="btn btn-light btn-outline-primary mx-2">Quay về</button>
					</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>