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
<title>TRANG QUẢN TRỊ</title>
</head>
<style>
h3 {
	background: linear-gradient(to left, red, yellow, pink, green, blue, purple);
	background-size: 400%;
	letter-spacing: .1em;
	-webkit-background-clip: text;
	-webkit-text-stroke: 5px transparent;
	animation: animate 10s linear infinite;
}

hr {
	height: 5px;
	border-width: 0;
	background: linear-gradient(to right, #14ffe9, #ffeb3b, #ff00e0);
	animation: rotate 1.5s linear infinite;
}

@
keyframes rotate { 0%{
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
keyframes animate { 0%{
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
	<c:url var="ad" value="/admin"></c:url>
	<div class="container">
		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<a class="navbar-brand tieude"><h3>ADMINISTRATION TOOL</h3></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active text-warning"
							aria-current="page" href="#">HOME</a></li>
						<li class="nav-item"><a class="nav-link active text-warning"
							aria-current="page" href="${ad}/quanlyVideo">VIDEOS</a></li>
						<li class="nav-item"><a class="nav-link active text-warning"
							aria-current="page" href="#">USERS</a></li>
						<li class="nav-item"><a class="nav-link active text-warning"
							aria-current="page" href="#">REPORTS</a></li>
						<li class="nav-item"><a class="nav-link active text-warning"
							aria-current="page" href="${ad}/trangdau">LOGOFF</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<hr>
		<jsp:include page="${ad}"></jsp:include>
	</div>
	
</body>
</html>