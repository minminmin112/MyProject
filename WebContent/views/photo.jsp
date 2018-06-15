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
function del(id){
	if(confirm('정말로 삭제하시겠습니까?')){
		$.ajax({
			url:"${pageContext.request.contextPath}/photo/delete",
			type:"post",
			data:{
				id:id
			},
			success:function(data){
				alert("삭제가 완료 되었습니다.");
				location.href=
			 	"${pageContext.request.contextPath}/views/photo";
			}
		});
	}
}

function fileCheck(obj) {
	var point = obj.value.lastIndexOf('.');
	var extension = obj.value.substring(point + 1, obj.value.length);

	if (extension != "jpg" && extension != "gif" && extension != "png") {
		alert("이미지 이외의 파일은 업로드 할 수 없습니다.");

		var parent = obj.parentNode;
		var next = obj.nextSibling;
		var tmp = document.createElement("form");
		tmp.appendChild(obj);
		tmp.reset();
		parent.insertBefore(obj, next);
	}
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

		<!-- 사진첩 폼 -->
		<form action="${pageContext.request.contextPath }/views/insert"
			class="form-horizontal" method="post" enctype="multipart/form-data">
			<input type="hidden" id="u_id" name="u_id"
				value="${sessionScope.id }" />
			<div class="form-group">
				<label class="col-sm-4 control-label"></label>
				<div class="col-sm-4 form-inline">
					<input type="file" id="content" name="content" class="form-control"
						required accept="image/gif, image/jpeg, image/png"
						onchange="fileCheck(this)" />
					<button type="submit" class="btn btn-success">등록</button>
				</div>
			</div>
			<br />
		</form>
		<hr />

		<h4>PHOTO</h4>
		<div>
			<div class="content">
				<c:forEach var="pvo" items="${photoList }">
					<div class="photo">
						<img src="../upload/${pvo.content }" alt="" />
						<div class="title text_center">${pvo.regdate }</div>
						<button type="button" class="btn btn-success btn-sm"
							onclick="del(${pvo.id })">삭제</button>
						<hr />
					</div>
				</c:forEach>
			</div>

			<hr />
			(test : photo page)
		</div>

		<div class="footer text-center">
			<p>광고문의 : 010-3381-8934</p>
		</div>
	</div>
</body>
</html>