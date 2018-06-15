<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
body {
	margin: 0;
}

.header, .footer {
	color: white;
	height: 100px;
	background: #088A29;
}

.header {
	padding-top: 10px;
}

.footer {
	padding: 35px;
	margin-top: 30px;
}

.main {
	margin-top: 30px;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function check(form) {
		if (form.id.value == "") {
			alert("아이디를 입력해 주세요.");
			form.id.focus();
			return;
		}

		if (form.password.value == "") {
			alert("패스워드를 입력해 주세요.");
			form.password.focus();
			return;
		}

		form.submit();
	}
</script>
</head>
<body>
	<div class="header">
		<h1 class="text-center">The Mean Greens</h1>
	</div>
	<div class="main container text-center">
		<!-- 메뉴 -->
		<jsp:include page="../menu.jsp" />

		<!-- 로그인 폼 -->
		<form action="login" class="form-horizontal" method="post">
			<div class="form-group">
				<label class="col-sm-4 control-label" for="id">아이디</label>
				<div class="col-sm-4">
					<input type="text" id="id" name="id" class="form-control" />
				</div>
			</div>
			<br />

			<div class="form-group">
				<label class="col-sm-4 control-label" for="password">패스워드</label>
				<div class="col-sm-4">
					<input type="password" id="password" name="password"
						class="form-control" />
				</div>
			</div>
			<br />

			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<button type="button" class="btn btn-default"
						onclick="check(this.form)">로그인</button>
				</div>
			</div>
		</form>

		<hr />
		(test : login page)
	</div>

	<div class="footer text-center">
		<p>광고문의 : 010-3381-8934</p>
	</div>
</body>
</html>