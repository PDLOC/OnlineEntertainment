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
<title>TRANG CHỦ</title>
</head>
<style>
.tieude {
	background: linear-gradient(to left, red, yellow, pink, green, blue, purple);
	background-size: 400%;
	letter-spacing: .1em;
	cursor: default;
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
</style>
<body class="bg-dark">
	<c:url var="layout" value="/views"></c:url>
	<c:url var="ad" value="/views"></c:url>
	<div class="container">
		<c:choose>
			<c:when test="${isAdmin == true}">
				<nav class="navbar navbar-expand-lg">
					<div class="container-fluid">
						<a class="navbar-brand tieude"><h3>ADMINISTRATION TOOL</h3></a>
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
								<li class="nav-item"><a
									class="nav-link active text-warning" aria-current="page"
									href="${ad}/trangdauAdmin">HOME</a></li>
								<li class="nav-item"><a
									class="nav-link active text-warning" aria-current="page"
									href="${ad}/quanlyVideo">VIDEOS</a></li>
								<li class="nav-item"><a
									class="nav-link active text-warning" aria-current="page"
									href="${ad}/quanlyUser">USERS</a></li>
								<li class="nav-item"><a
									class="nav-link active text-warning" aria-current="page"
									href="${ad}/report">REPORTS</a></li>
								<li class="nav-item"><a
									class="nav-link active text-warning" aria-current="page"
									href="${ad}/adminOff">LOGOFF</a></li>
							</ul>
						</div>
					</div>
				</nav>
				<hr>
			</c:when>
			<c:otherwise>
				<nav class="navbar navbar-expand-lg">
					<div class="container-fluid">
						<a class="navbar-brand tieude"><h3>
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
									class="nav-link active text-warning" href="${layout}/trangdau">Home</a></li>
								<li class="nav-item"><a
									class="nav-link active text-warning" href="#">My
										favorites</a></li>
								<li class="nav-item dropdown"><c:if test="${user != null}">
										<a class="nav-link dropdown-toggle active text-warning"
											role="button" data-bs-toggle="dropdown" aria-expanded="false">Welcome ${sessionScope.user.fullname}</a>
										<ul class="dropdown-menu">
											<li><a class="dropdown-item" href="${layout}/changePass">Change
													Password</a></li>
											<li><a class="dropdown-item"
												href="${layout}/edit-profile">Edit Profile</a></li>
											<li><a class="dropdown-item" href="${layout}/logOff">Logoff</a></li>
										</ul>
									</c:if> <c:if test="${user == null}">
										<a class="nav-link dropdown-toggle active text-warning"
											role="button" data-bs-toggle="dropdown" aria-expanded="false">My
											account</a>
										<ul class="dropdown-menu">
											<li><a class="dropdown-item" href="${layout}/sign-in">Login</a></li>
											<li><a class="dropdown-item" href="${layout}/forgotPass">Forgot
													Password</a></li>
											<li><a class="dropdown-item" href="${layout}/sign-up">Registration</a></li>
										</ul>
									</c:if></li>
							</ul>
						</div>
					</div>
				</nav>
				<hr>
			</c:otherwise>
		</c:choose>
		<jsp:include page="${view}"></jsp:include>
	</div>
</body>
</html>