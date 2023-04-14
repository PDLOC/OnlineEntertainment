<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<title>QUẢN LÝ NGƯỜI DÙNG</title>
</head>
<style>
.user {
	color: rgba(34, 179, 184, 0.975);
	display: inline-block;
	position: relative;
	left: 50%;
	transform: translateX(-50%);
	margin-bottom: 10px;
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
		<form method="POST">
			<div class="col-8 col-sm-8 mx-auto">
				<div class="card">
					<div class="card-body">
						<div class="row g-2 align-items-center">
							<div class="col-2">
								<label for="id" class="col-form-label">Username</label>
							</div>
							<div class="col-9">
								<input type="text" id="id" class="form-control" name="id"
									value="${formu.id}">
							</div>
							<div class="col-2">
								<label for="password" class="col-form-label">Password</label>
							</div>
							<div class="col-9">
								<input type="password" id="password" class="form-control"
									name="password" value="${formu.password}">
							</div>
							<div class="col-2">
								<label for="fullname" class="col-form-label">Họ và tên</label>
							</div>
							<div class="col-9">
								<input type="text" id="fullname" class="form-control"
									name="fullname" value="${formu.fullname}">
							</div>
							<div class="col-2">
								<label for="email" class="col-form-label">Email</label>
							</div>
							<div class="col-9">
								<input type="text" id="email" class="form-control" name="email"
									value="${formu.email}">
							</div>
							<div class="col-2">
								<label for="role" class="col-form-label">Role</label>
							</div>
							<div class="col-9">
								<input ${formu.admin?'checked':''} type="radio" id="admin1"
									name="admin" value="true">Admin <input
									${formu.admin?'':'checked'} type="radio" id="admin2"
									name="admin" value="false" class="ms-5">User
							</div>
							<c:if test="${!empty message}">
								<div class="text-center mb-3 text-danger fw-bolder thongbao">Chúc mừng ${message}</div>
							</c:if>
							<c:if test="${!empty message1}">
								<div class="text-center mb-3 text-danger fw-bolder thongbao">Thôi xong ${message1}</div>
							</c:if>
							<div class="d-grid gap-4 d-md-flex justify-content-md-end">
								<button class="btn btn-primary me-md-2 updateU"
									formaction="${ad}/updateUser">Update</button>
								<button class="btn btn-primary me-md-2 deleteU" 
									formaction="${ad}/deleteUser">Delete</button>
								<button class="btn btn-primary me-md-2 rsU" formaction="${ad}/resetU"
									>Reset</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card col-8 col-sm-8 mx-auto my-3">
				<div class="card-body p-0">
					<table class="table table-bordered table-hover">
						<thead class="text-center bg-warning">
							<tr>
								<th scope="col" class="align-middle">Username</th>
								<th scope="col" class="align-middle">Password</th>
								<th scope="col" class="align-middle">Fullname</th>
								<th scope="col" class="align-middle">Email</th>
								<th scope="col" class="align-middle">Role</th>
								<th scope="col" class="align-middle"></th>
							</tr>
						</thead>
						<c:forEach var="u" items="${listu}">
							<tr>
								<td scope="row">${u.id}</td>
								<td>${u.password}</td>
								<td>${u.fullname}</td>
								<td>${u.email}</td>
								<td>${u.admin?'Admin':'User'}</td>
								<td><a href="${ad}/editUser/${u.id}">Edit</a></td>
							</tr>
						</c:forEach>
					</table>
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
		</form>
	</div>
</body>
</html>