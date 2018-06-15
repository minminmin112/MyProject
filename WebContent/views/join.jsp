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
	var dualCheck = false;

	function checkPwd() {
		var password = $("#password").val();
		var passwordCheck = $("#passwordCheck").val();
		if (passwordCheck == "") {
			$("#alert").html("");
		} else if (password == passwordCheck) {
			$("#alert").html("일치합니다.");
		} else {
			$("#alert").html("비밀번호를 확인해주세요.");
		}
	}

	function checkId() {
		var id = $("#id").val();
		$.ajax({
			type : "post",
			url : "dualCheck",
			data : {
				id : id
			},
			success : function(data) {
				if (data == 'y') {
					alert("중복된 아이디입니다.");
				} else if (data == 'n') {
					alert("사용 가능한 아이디입니다.");
					dualCheck = true;
				} else {
					alert("잠시후 다시 시도해주세요.");
				}
			}
		});
	}

	function check(form) {
		if (form.id.value == "") {
			alert("아이디를 입력해주세요.");
			form.id.focus();
			return;
		}

		if (dualCheck == false) {
			alert("아이디 중복확인을 해주세요.");
			return;
		}

		if (form.password.value == "") {
			alert("패스워드를 입력해주세요.");
			form.password.focus();
			return;
		}

		if ($("#alert").html() != "일치합니다.") {
			alert("두 비밀번호가 일치하지 않습니다.");
			return;
		}

		if (form.name.value == "") {
			alert("이름을 입력해주세요.");
			form.name.focus();
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

		<!-- 회원가입 폼 -->
		<form action="${pageContext.request.contextPath }/views/join"
			class="form-horizontal cos-sm-15" method="post">
			<div class="form-group">
				<label class="col-sm-4 control-label" for="id">아이디</label>
				<div class="col-sm-4">
					<input id="id" type="text" name="id" class="form-control"
						onkeyup="dualCheck = false;" />
				</div>
				<div class="col-sm-1">
					<button type="button" class="btn btn-default" onclick="checkId()">중복확인</button>
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
				<label class="col-sm-4 control-label" for="passwordCheck">패스워드확인</label>
				<div class="col-sm-4">
					<input type="password" id="passwordCheck" class="form-control"
						onkeyup="checkPwd()" /> <span id="alert"></span>
				</div>
			</div>
			<br />

			<div class="form-group">
				<label class="col-sm-4 control-label" for="name">이름</label>
				<div class="col-sm-4">
					<input type="text" id="name" name="name" class="form-control"
						onkeyup="checkPwd()" />
				</div>
			</div>
			<br />

			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<button type="button" class="btn btn-default"
						onclick="check(this.form)">회원가입</button>
				</div>
			</div>
		</form>

		<hr />
		(test : join page)
	</div>

	<div class="footer text-center">
		<p>광고문의 : 010-3381-8934</p>
	</div>
</body>
</html>