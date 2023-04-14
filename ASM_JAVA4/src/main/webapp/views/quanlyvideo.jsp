<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QUẢN LÝ VIDEO</title>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
</head>
<style>
/* css input number */
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

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
		<form method="POST" enctype="multipart/form-data">
			<div class="col-9 col-sm-9 mx-auto">
				<div class="card">
					<div class="card-body">
						<div class="row col-12 col-sm-12">
							<div class="hinh col-6 col-sm-6">
								<div class="col-9">
									<input type="file" name="poster">
								</div>
								<div class="card mx-auto" style="width: 27rem;">
									<img src="/ASM_JAVA4/images/${formv.poster}"
										class="card-img-top" alt="...">
								</div>
							</div>
							<div class="thongtin col-6 col-sm-6">
								<div class="mb-3">
									<label for="exampleFormControlInput1" class="form-label">VIDEO
										ID</label> <input type="text" class="form-control" name="id"
										id="exampleFormControlInput1" value="${formv.id}">
								</div>
								<div class="mb-3">
									<label for="exampleFormControlInput1" class="form-label">VIDEO
										TITLE</label> <input type="text" class="form-control" name="title"
										id="exampleFormControlInput1" value="${formv.title}">
								</div>
								<div class="mb-3">
									<label for="exampleFormControlInput1" class="form-label">VIEWS
									</label> <input type="number" class="form-control" name="views"
										id="exampleFormControlInput1" value="${formv.views}">
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"
										${formv.active?'checked':''} name="active" id="inlineRadio1"
										value="true"> <label class="form-check-label"
										for="inlineRadio1">ACTIVE</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"
										${formv.active?'':'checked'} name="active" id="inlineRadio2"
										value="false"> <label class="form-check-label"
										for="inlineRadio2">INACTIVE</label>
								</div>
							</div>
							<div class="mb-3">
								<label for="exampleFormControlTextarea1" class="form-label">DESCRIPTION</label>
								<textarea class="form-control" name="mota" id="mota" rows="3">${formv.mota}</textarea>
							</div>
						</div>
					</div>
					<div class="card-footer text-muted">
						<div class="d-grid gap-4 d-md-flex justify-content-md-end">
							<button class="btn btn-primary me-md-2"
								formaction="${ad}/createVD">Create</button>
							<button class="btn btn-primary me-md-2"
								formaction="${ad}/updateVD">Update</button>
							<button class="btn btn-primary me-md-2"
								formaction="${ad}/deleteVD">Delete</button>
							<button class="btn btn-primary" formaction="${ad}/quanlyVideo">Reset</button>
						</div>
					</div>
				</div>
			</div>
			<div class="card col-8 mx-auto my-3">
				<div class="card-body p-0">
					<table class="table table-bordered table-hover">
						<thead class="text-center bg-warning">
							<tr>
								<th scope="col" class="align-middle">Video Id</th>
								<th scope="col" class="align-middle">Video Title</th>
								<th scope="col" class="align-middle">View Count</th>
								<th scope="col" class="align-middle">Status</th>
								<th scope="col" class="align-middle">Mô tả</th>
								<th scope="col" class="align-middle"></th>
							</tr>
						</thead>
						<c:forEach var="film" items="${listfilm}">
							<tr>
								<td scope="row">${film.id}</td>
								<td>${film.title}</td>
								<td>${film.views}</td>
								<td>${film.active?'Hoạt động':'Không hoạt động'}</td>
								<td>${film.mota}</td>
								<td><a href="${ad}/editVideo/${film.id}">Edit</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="card-footer text-muted">
					<div class="row">
						<div class="col-4 col-sm-4">10 videos</div>
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
		</form>
	</div>
</body>
</html>