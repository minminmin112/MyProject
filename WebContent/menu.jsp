<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul class="menu">
	<c:if test="${sessionScope.id == null }">
		<a href="${pageContext.request.contextPath}/views/main" class="btn">MAIN</a>
		<a href="${pageContext.request.contextPath}/views/visit" class="btn">VISIT</a>
		<a href="${pageContext.request.contextPath}/views/photo" class="btn">PHOTO</a>
		<a href="${pageContext.request.contextPath}/views/login" class="btn">LOGIN</a>
		<a href="${pageContext.request.contextPath}/views/join" class="btn">JOIN</a>
		<hr />
	</c:if>
	<c:if test="${sessionScope.id != null }">
		<a href="${pageContext.request.contextPath}/views/main" class="btn">MAIN</a>
		<a href="${pageContext.request.contextPath}/views/visit" class="btn">VISIT</a>
		<a href="${pageContext.request.contextPath}/views/photo" class="btn">PHOTO</a>
		<a href="${pageContext.request.contextPath}/views/logout" class="btn">LOGOUT</a>
		<hr />
	</c:if>
</ul>