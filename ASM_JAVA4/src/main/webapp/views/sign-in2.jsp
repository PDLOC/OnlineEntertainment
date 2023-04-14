<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/0e7cad46fe.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<title>ĐĂNG NHẬP</title>
</head>
<style>
.tieude {
	background: linear-gradient(to left, red, yellow, pink, green, blue, purple);
	background-size: 400%;
	letter-spacing: .1em;
	-webkit-background-clip: text;
	-webkit-text-stroke: 5px transparent;
	animation: animate 10s linear infinite;
}
/*CSS cho nav*/
.gach {
	width: 100%;
	height: 1px;
	background-image: linear-gradient(to right, red, orange, yellow);
}

/* CSS cho carousel */
.carousel-item {
	height: 30rem;
	position: relative;
}

hr {
	height: 5px;
	border-width: 0;
	background: linear-gradient(to right, #14ffe9, #ffeb3b, #ff00e0);
	animation: rotate 1.5s linear infinite;
}

@
keyframes rotate { 0% {
	filter: hue-rotate(0deg)
}

100












%
{
filter












:












hue-rotate










(












360deg












)












}
}
@
keyframes animate { 0% {
	background-position: 0%;
}

100












%
{
background-position












:












400










%;
}
}
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
<body class="bg-dark">
	<c:url var="Bai2" value="/Bai2"></c:url>
	<div class="container">
		<c:choose>
			<c:when test="${empty sessionScope.user}">
				<nav class="navbar navbar-expand-lg">
					<div class="container-fluid">
						<a class="navbar-brand tieude" href="${Bai2}/trangdau"><h3>
								<i class="fas fa-film"></i> ONLINE ENTERTAINMENT
							</h3></a>
						<button class="navbar-toggler bg-warning text-white" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
								<li class="nav-item"><a
									class="nav-link active text-warning" href="${Bai2}/trangdau">My
										favorites</a></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle active text-warning"
									role="button" data-bs-toggle="dropdown" aria-expanded="false">My
										account</a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="${Bai2}/sign-in">Login</a></li>
										<li><a class="dropdown-item" href="#">Forgot Password</a></li>
										<li><a class="dropdown-item" href="${Bai2}/sign-up">Registration</a></li>
										<li><a class="dropdown-item" href="${Bai2}/logOff">Logoff</a></li>
										<li><a class="dropdown-item" href="#">Change Password</a></li>
										<li><a class="dropdown-item" href="${Bai2}/edit-profile">Edit
												Profile</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
				</nav>
			</c:when>
			<c:otherwise>
				<nav class="navbar navbar-expand-lg">
					<div class="container-fluid">
						<a class="navbar-brand tieude" href="${Bai2}/trangdau"><h3>
								<i class="fas fa-film"></i> ONLINE ENTERTAINMENT
							</h3></a>
						<button class="navbar-toggler bg-warning text-white" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
								<li class="nav-item"><a
									class="nav-link active text-warning" href="${Bai2}/trangdau">My
										favorites</a></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle active text-warning"
									role="button" data-bs-toggle="dropdown" aria-expanded="false">Welcome
										${sessionScope.user.fullname}</a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="#">Forgot Password</a></li>
										<li><a class="dropdown-item" href="${Bai2}/sign-up">Registration</a></li>
										<li><a class="dropdown-item" href="${Bai2}/logOff">Logoff</a></li>
										<li><a class="dropdown-item" href="#">Change Password</a></li>
										<li><a class="dropdown-item" href="${Bai2}/edit-profile">Edit
												Profile</a></li>
										<c:if test="${sessionScope.user.admin}">
											<li><a class="dropdown-item" href="#">Quản trị</a></li>
										</c:if>
									</ul></li>
							</ul>
						</div>
					</div>
				</nav>
			</c:otherwise>
		</c:choose>
		<hr>
		<c:if test="${user == null}">
			<div class="card col-sm-4 col-4 mt-5 m-auto shadow-lg ">
				${error}
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
								<button formaction="${Bai2}/sign-in" style="width: 150px;"
									class="btn btn-light btn-outline-primary mx-2">Đăng
									nhập</button>
							</a> <a>
								<button formaction="${Bai2}/sign-up" style="width: 150px;"
									class="btn btn-light btn-outline-primary mx-2 ">Đăng
									ký</button>
							</a>
						</div>

						<div class="forgot text-center mt-4">
							<a href="#!quenmatkhau">Quên mật khẩu?</a>
						</div>
					</form>
				</div>
			</div>

		</c:if>
		<c:if test="${user != null}">
			<jsp:include page="${view}"></jsp:include>
		</c:if>
	</div>
</body>
</html>