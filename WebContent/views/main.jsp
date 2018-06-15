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

.img {
	padding-top: 10px;
	padding-bottom: 10px;
	width: 500px;
	height: 300px;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="header">
		<h1 class="text-center">The Mean Greens</h1>
	</div>
	<div class="main container text-center">
		<!-- 메뉴 -->
		<jsp:include page="../menu.jsp" />

		<!-- 대표 이미지 -->
		<div class="row">
			<div>
				<img src="../img/greens.jpg" class="img img-responsive img-circle"
					style="margin-left: auto; margin-right: auto; display: block;" />
			</div>
		</div>
		
		<hr />
		(test : main page)
	</div>

	<div class="footer text-center">
		<p>광고문의 : 010-3381-8934</p>
	</div>
</body>
</html>