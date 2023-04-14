<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<title>ĐĂNG NHẬP</title>
</head>
<style>
/* CSS cho ICON LOGIN*/
.icon {
	color: rgba(34, 179, 184, 0.975);
	display: inline-block;
	position: relative;
	left: 50%;
	transform: translateX(-50%);
	margin-bottom: 30px;
}

/* CSS cho boder login*/
.card {
	border-radius: 5%;
}

/* CSS canh giữa cho textfield*/
.login {
	display: inline-block;
	position: relative;
	left: 50%;
	transform: translateX(-50%);
}

a {
	text-decoration: none;
}
</style>
<body>
<c:url var="layout" value="/views"></c:url>
	<div class="card col-sm-4 col-4 mt-5 m-auto shadow-lg ">
		<div class="card-body">
			<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80"
				fill="currentColor" class="icon bi-person-circle"
				viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                <path fill-rule="evenodd"
					d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
            </svg>
			<form name="" method="POST">
				<div class="login col-10 mb-4">
					<label class="visually-hidden" for="id">Tài khoản</label>
					<div class="input-group">
						<div class="input-group-text">
							<i class="icon bi-person-fill m-auto h4"></i>
						</div>
						<input type="text" name="id" class="form-control" id="id"
							placeholder="Tài khoản">
					</div>
				</div>
				<div class="login col-10 mb-4">
					<label class="visually-hidden" for="password">Mật khẩu</label>
					<div class="input-group">
						<div class="input-group-text">
							<i class="icon bi-lock-fill m-auto h4"></i>
						</div>
						<input type="password" name="password" class="form-control"
							id="password" placeholder="Mật khẩu">
					</div>
				</div>
				<c:if test="${!empty message}">
				<div class="text-center mb-3 text-danger fw-bolder">${message}</div>
				</c:if>
				<div class="d-grid gap-2 d-md-flex justify-content-center">
					<a>
						<button formaction="${layout}/sign-in" style="width: 150px;"
							class="btn btn-light btn-outline-primary mx-2">Đăng nhập</button>
					</a> <a>
						<button formaction="${layout}/sign-up" style="width: 150px;"
							class="btn btn-light btn-outline-primary mx-2 ">Đăng ký</button>
					</a>
				</div>

				<div class="forgot text-center mt-4">
					<a href="#!quenmatkhau">Quên mật khẩu?</a>
				</div>
			</form>
		</div>
	</div>
</body>

</html>