<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<title>THỐNG KÊ</title>
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
	<c:url var="ad" value="/views"></c:url>
	<div class="container">
		<div class="col-7 col-sm-7 mx-auto">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="home-tab" data-bs-toggle="tab"
						data-bs-target="#home-tab-pane" type="button" role="tab"
						aria-controls="home-tab-pane" aria-selected="false">FAVORITE</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="profile-tab" data-bs-toggle="tab"
						data-bs-target="#profile-tab-pane" type="button" role="tab"
						aria-controls="profile-tab-pane" aria-selected="true">FAVORITE
						USERS</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="shared-tab" data-bs-toggle="tab"
						data-bs-target="#shared-tab-pane" type="button" role="tab"
						aria-controls="shared-tab-pane" aria-selected="false">SHARED
						FRIENDS</button>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade " id="home-tab-pane"
					role="tabpanel" aria-labelledby="home-tab" tabindex="0">
					<div class="card">
						<div class="card-body">
							<table class="table table-bordered table-hover">
								<thead class="text-center bg-warning">
									<tr>
										<th scope="col" class="align-middle">VIDEO TITLE</th>
										<th scope="col" class="align-middle">FAVORITE COUNT</th>
										<th scope="col" class="align-middle">LASTEST DATE</th>
										<th scope="col" class="align-middle">OLDEST DATE</th>
									</tr>
								</thead>
								<c:forEach var="l" items="${reportlist}">
									<tr>
										<td>${l.group}</td>
										<td>${l.likes}</td>
										<td>${l.newest}</td>
										<td>${l.oldest}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<div class="tab-pane fade show active" id="profile-tab-pane" role="tabpanel"
					aria-labelledby="profile-tab" tabindex="0">
					<div class="card">
						<div class="card-body p-0">
							<form>
								<div class="m-3 row">
									<label for="inputPassword" class="col-sm-2 col-form-label">VIDEO
										TITLE</label>
									<div class="col-sm-10">
										<select class="form-select"
											aria-label="Default select example" id="select_box" name="videoTitle">
											<c:forEach var="v" items="${listTitle}">
												<option value="${v.id}">${v.title}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-auto mx-auto mt-3">
										<button formaction="${ad}/findByVideo" class="btn btn-primary mb-3">Search</button>
									</div>
								</div>
								<table class="table table-bordered table-hover">
									<thead class="text-center bg-warning">
										<tr>
											<th scope="col" class="align-middle">USERNAME</th>
											<th scope="col" class="align-middle">FULLNAME</th>
											<th scope="col" class="align-middle">EMAIL</th>
											<th scope="col" class="align-middle">ROLE</th>
										</tr>
									</thead>
									<c:forEach var="u" items="${reportU}">
										<tr>
											<td>${u.id}</td>
											<td>${u.fullname}</td>
											<td>${u.email}</td>
											<td>${u.admin?'Admin':'User'}</td>
										</tr>
									</c:forEach>
								</table>
							</form>
						</div>
						<div class="card-footer text-muted">
							<div class="row">
								<div class="col-4 col-sm-4">5 users</div>
								<div
									class="d-grid gap-4 d-md-flex justify-content-end col-8 col-sm-8">
									<button class="btn btn-primary">|<</button>
									<button class="btn btn-primary"><<</button>
									<button class="btn btn-primary">>></button>
									<button class="btn btn-primary">>|</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="shared-tab-pane" role="tabpanel"
					aria-labelledby="shared-tab" tabindex="0">
					<div class="card">
						<div class="card-body p-0">
							<div class="m-3 row">
								<label for="inputPassword" class="col-sm-2 col-form-label">VIDEO
									TITLE</label>
								<div class="col-sm-10">
									<select class="form-select" aria-label="Default select example">
										<option selected>Open this select menu</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
								</div>
							</div>
							<table class="table table-bordered table-hover">
								<thead class="text-center bg-warning">
									<tr>
										<th scope="col" class="align-middle">SENDER NAME</th>
										<th scope="col" class="align-middle">SENDER EMAIL</th>
										<th scope="col" class="align-middle">RECEIVER EMAIL</th>
										<th scope="col" class="align-middle">SENT DATE</th>
									</tr>
								</thead>
								<tr>
									<td scope="row">Nguyễn Văn Tèo</td>
									<td>teonv@gmail.com</td>
									<td>poly@gmail.com</td>
									<td>01/01/2020</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>