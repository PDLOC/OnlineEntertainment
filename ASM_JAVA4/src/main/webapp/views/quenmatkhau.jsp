<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/angular-1.8.2/angular.min.js"></script>
<script src="/angular-1.8.2/angular-route.min.js"></script>
<script src="https://kit.fontawesome.com/0e7cad46fe.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>QUÊN MẬT KHẨU</title>
</head>
<style>
	.title{
		color: rgba(34, 179, 184, 0.975);
	}

/* CSS cho ICON LOGIN*/
    .icon {
        color: rgba(34, 179, 184, 0.975);
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
	<div class="card col-sm-4 col-4 mt-5 m-auto border-0 shadow-lg ">
		<div class="card-body">
			<div class="title text-center mb-3">
				<h2 class="fw-bolder">QUÊN MẬT KHẨU</h2>
			</div>
			<form>
				<div class="login col-10 mb-4">
					<label class="visually-hidden" for="autoSizingInputGroup">Tài
						khoản</label>
					<div class="input-group">
						<div class="input-group-text">
							<i class="icon bi-person-fill m-auto h4"></i>
						</div>
						<input type="text" class="form-control" id="autoSizingInputGroup"
							placeholder="Tài khoản">
					</div>
				</div>
				<div class="login col-10 mb-4">
					<label class="visually-hidden" for="exampleInputEmail1">Email</label>
					<div class="input-group">
						<div class="input-group-text">
							<i class="icon bi-envelope-at-fill m-auto h4"></i></i>
						</div>
						<input type="email" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Email">
					</div>
				</div>
				<div class="d-grid gap-2 d-md-flex justify-content-center">
					<a href="">
						<button style="width: 150px;"
							class="btn btn-light btn-outline-primary mx-2" type="submit">
							Xác nhận</button>
					</a> <a href="trangchu.html">
						<button style="width: 150px;"
							class="btn btn-light btn-outline-primary mx-2 " type="button">
							Quay về</button>
					</a>
				</div>
				<div class="forgot text-center mt-4">
					Bạn chưa có tài khoản ?<a href="dangky.html"> Đăng ký tại đây</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>