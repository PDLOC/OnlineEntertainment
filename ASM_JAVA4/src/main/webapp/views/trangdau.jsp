<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<title>Insert title here</title>
</head>
<style>

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
</style>
<body>
	<div id="carouselExampleInterval" class="carousel slide carousel-fade"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleInterval"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleInterval"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleInterval"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="3000">
				<img src="/ASM_JAVA4/images/banner1.jpg" class="d-block w-100"
					alt="...">
			</div>
			<div class="carousel-item" data-bs-interval="3000">
				<img src="/ASM_JAVA4/images/banner2.jpg" class="d-block w-100"
					alt="...">
			</div>
			<div class="carousel-item" data-bs-interval="3000">
				<img src="/ASM_JAVA4/images/banner3.jpg" class="d-block w-100"
					alt="...">
			</div>
		</div>
	</div>
	<hr>
	<article>
		<div class="row row-cols-1 row-cols-md-4 g-4 mt-3">
			<c:forEach var="item" items="${videolist}">
				<div class="col">
					<div class="card h-100">
						<img src="/ASM_JAVA4/images/${item.poster}" class="card-img-top"
							alt="...">
						<div class="card-body">
							<h5 class="card-title">${item.title}</h5>
						</div>
						<div class="card-footer">
							<div class="d-grid gap-2 d-md-flex justify-content-md-center">
								<button style="width: 100px;"
									class="btn btn-outline-primary me-md-2" type="button">Like</button>
								<button style="width: 100px;" class="btn btn-outline-primary"
									type="button">Share</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</article>
</body>
</html>