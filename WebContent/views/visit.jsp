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
				url:"${pageContext.request.contextPath}/visit/delete",
				type:"post",
				data:{
					id:id
				},
				success:function(data){
					alert("삭제가 완료 되었습니다.");
					location.href=
				 	"${pageContext.request.contextPath}/views/visit";
				}
			});
		}
	}
	
	function check(f) {
		if (/^.{1,2000}$/.test(f.content.value) == false) {
			alert("내용은은 2000글자 미만으로 작성하셔야 합니다.");
			f.content.focus();
			return;
		}
		
		f.submit();
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

		<!-- 방명록 폼 -->
		<h4>Leave the message</h4>
		<form action="${pageContext.request.contextPath}/visit/insert"
			method="post" class="form-inline">
			<input type="hidden" name="u_id" value="${sessionScope.id }" />
			<div class="form-group">
				<textarea class="form-control" id="name" name="content" cols="80"
					rows="2"></textarea>
				<button type="button" class="btn btn-success"
					onclick="check(this.form);">등록</button>
			</div>
		</form>
		<hr />

		<h4>Content</h4>
		<div>
			<c:forEach var="vvo" items="${visitList }">
				<div class="form-group form-inline">
					<div class="form-group">
						<label>${vvo.u_id } <small>${vvo.regdate }</small></label> 
						<label>${vvo.content } </label>
						<button type="button" class="btn btn-success btn-sm" onclick="del(${vvo.id})">삭제</button>
					</div>
				</div>
			</c:forEach>
		</div>

		<hr />
		(test : visit page)
	</div>

	<div class="footer text-center">
		<p>광고문의 : 010-3381-8934</p>
	</div>
</body>
</html>