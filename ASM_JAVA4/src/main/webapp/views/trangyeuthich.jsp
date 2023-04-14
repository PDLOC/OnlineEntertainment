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
<title>TRANG YÊU THÍCH</title>
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

hr {
	height: 5px;
	border-width: 0;
	background: linear-gradient(to right, #14ffe9, #ffeb3b, #ff00e0);
	animation: rotate 1.5s linear infinite;
}

@
keyframes rotate { 
	0%
	{
		filter: hue-rotate(0deg)
	}
	100%
	{
		filter:hue-rotate(360deg)
	}
}
@keyframes animate { 
	0%	
		{
		background-position: 0%;
		}
	100%
		{
		background-position: 400%;
		}
}
</style>
<body class="bg-dark">
	<div class="container">
	<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<a class="navbar-brand tieude" href="#"><h3><i class="fas fa-film"></i> ONLINE ENTERTAINMENT</h3></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active text-warning" href="#">My
								favorites</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle active text-warning" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">My account</a>
							<ul class="dropdown-menu reserver">
								<li><a class="dropdown-item" href="#">Login</a></li>
								<li><a class="dropdown-item" href="#">Forgot Password</a></li>
								<li><a class="dropdown-item" href="#">Registration</a></li>
								<li><a class="dropdown-item" href="#">Logoff</a></li>
								<li><a class="dropdown-item" href="#">Change Password</a></li>
								<li><a class="dropdown-item" href="#">Edit Profile</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
		<hr>
		<div class="row row-cols-1 row-cols-md-4 g-4 mt-3">
			<div class="col">
				<div class="card h-100">
					<img src="/ASM_JAVA4/images/1.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Chỉ Nhân Hồi Hồn (2022)</h5>
					</div>
					<div class="card-footer">
						<div class="d-grid gap-2 d-md-flex justify-content-md-center">
							<button style="width: 100px;" class="btn btn-primary me-md-2"
								type="button">Unlike</button>
							<button style="width: 100px;" class="btn btn-primary"
								type="button">Share</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/ASM_JAVA4/images/2.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Biệt Đội Siêu Anh Hùng: Hồi Kết (2019)</h5>
					</div>
					<div class="card-footer">
						<div class="d-grid gap-2 d-md-flex justify-content-md-center">
							<button style="width: 100px;" class="btn btn-primary me-md-2"
								type="button">Unlike</button>
							<button style="width: 100px;" class="btn btn-primary"
								type="button">Share</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/ASM_JAVA4/images/3.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Đêm Của Những Tên Khốn (2022)</h5>
					</div>
					<div class="card-footer">
						<div class="d-grid gap-2 d-md-flex justify-content-md-center">
							<button style="width: 100px;" class="btn btn-primary me-md-2"
								type="button">Unlike</button>
							<button style="width: 100px;" class="btn btn-primary"
								type="button">Share</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/ASM_JAVA4/images/4.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Gấu Phê Pha (2023)</h5>
					</div>
					<div class="card-footer">
						<div class="d-grid gap-2 d-md-flex justify-content-md-center">
							<button style="width: 100px;" class="btn btn-primary me-md-2"
								type="button">Unlike</button>
							<button style="width: 100px;" class="btn btn-primary"
								type="button">Share</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/ASM_JAVA4/images/5.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Người Dơi: Ngày Tàn Của Gotham (2023)</h5>
					</div>
					<div class="card-footer">
						<div class="d-grid gap-2 d-md-flex justify-content-md-center">
							<button style="width: 100px;" class="btn btn-primary me-md-2"
								type="button">Unlike</button>
							<button style="width: 100px;" class="btn btn-primary"
								type="button">Share</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>