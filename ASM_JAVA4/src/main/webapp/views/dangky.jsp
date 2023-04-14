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
<title>ĐĂNG KÝ</title>
</head>
<style>
/* CSS cho ICON LOGIN*/
    .icon {
        color: rgba(34, 179, 184, 0.975);
        display: inline-block;
        position: relative;
        left: 50%;
        transform: translateX(-50%);
        margin-bottom: 10px;
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

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }
</style>
<body>
	 <div class="card col-sm-5 col-5 my-5 m-auto border-0 shadow-lg ">
        <div class="card-body">
            <form name="frmDK">
                <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor"
                    class="icon bi-person-circle" viewBox="0 0 16 16">
                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                    <path fill-rule="evenodd"
                        d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                </svg>
                <div class="title text-center mb-3">
                    <h2 class="fw-bolder">ĐĂNG KÝ</h2>
                </div>
                <div class="input-group mb-3 px-5">
                    <span class="input-group-text border-0" id="basic-addon1"><i
                            class="icon bi-person-fill m-auto mt-2"></i></span>
                    <div class="form-floating">
                        <input name="user" type="text" class="form-control" id="floatingUserName" placeholder="tk">
                        <label for="floatingUserName">Tên đăng nhập</label>
                    </div>
                </div>
                <div class="input-group mb-3 px-5">
                    <span class="input-group-text border-0" id="basic-addon1"><i
                            class="icon bi-lock-fill m-auto mt-2"></i></span>
                    <div class="form-floating">
                        <input name="pass" type="password" class="form-control" id="floatingPassword" placeholder="mk">
                        <label for="floatingPassword">Mật khẩu</label>
                    </div>
                </div>
                <div class="input-group mb-3 px-5">
                    <span class="input-group-text border-0" id="basic-addon1"><i
                            class="icon bi-activity m-auto"></i></span>
                    <div class="form-floating">
                        <input name="ten" type="text" ng-model="dk.fullname" class="form-control" id="floatingFullName" placeholder="fullName">
                        <label for="floatingFullName">Họ và tên</label>
                    </div>
                </div>
                <div class="input-group mb-3 px-5">
                    <span class="input-group-text border-0" id="basic-addon1"><i
                            class="icon bi-gender-ambiguous m-auto"></i></span>
                    <div class="form-group py-2">
                        <div class="form-check form-check-inline p-1">Giới tinh</div>
                        <div class="form-check form-check-inline">
                            <input name="gender" class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1"
                                value="option1">
                            <label class="form-check-label" for="inlineRadio1">Nam</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input name="gender" class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2"
                                value="option2">
                            <label class="form-check-label" for="inlineRadio2">Nữ</label>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3 px-5">
                    <span class="input-group-text border-0" id="basic-addon1"><i
                            class="icon bi-telephone-fill m-auto mt-2"></i></span>
                    <div class="form-floating">
                        <input name="phone" type="number" class="form-control" id="floatingPhone" placeholder="phone">
                        <label for="floatingPhone">Số điện thoại</label>
                    </div>
                </div>
                <div class="input-group mb-3 px-5">
                    <span class="input-group-text border-0" id="basic-addon1"><i
                            class="icon bi-envelope-at-fill m-auto mt-2"></i></span>
                    <div class="form-floating">
                        <input name="email" type="email" class="form-control"
                            id="floatingEmail" placeholder="email">
                        <label for="floatingEmail">Email</label>
                    </div>
                </div>
                <div class="d-grid gap-2 col-10 m-auto">
                    <button class="btn btn-light btn-outline-primary">
                        Đăng ký
                    </button>
                </div>
                <div class="forgot text-center mt-4">
                    Bạn đã có tài khoản ?<a href="#!dangnhap"> Đăng nhập tại đây</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>