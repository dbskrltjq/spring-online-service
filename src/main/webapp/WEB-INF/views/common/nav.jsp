<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="tags.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<nav class="navbar navbar-expand-sm" style="background: rgb(238,174,202);
background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(148,187,233,1) 100%);">
	<div class="container">
		<ul class="navbar-nav me-auto">
			<li class="nav-item"><a class="nav-link ${menu eq 'home' ? 'active' : '' }" href="/">홈</a></li>
			<li class="nav-item"><a class="nav-link ${menu eq 'course' ? 'active' : '' }" href="/courses">강의</a></li>
		</ul>
		<ul class="navbar-nav">
			<c:if test="${not empty LOGIN_USER }">
				<li class="nav-item"><a class="nav-link ${menu eq 'cart' ? 'active' : '' }" href="/cart">수강바구니</a></li>
				<li class="nav-item"><a class="nav-link ${menu eq 'dashboard' ? 'active' : '' }" href="/user/dashboard">대시보드</a></li>
				<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
			</c:if>
			<c:if test="${empty LOGIN_USER }">
				<li class="nav-item"><a class="nav-link ${menu eq 'login' ? 'active' : '' }" href="/login">로그인</a></li>
				<li class="nav-item"><a class="nav-link ${menu eq 'register' ? 'active' : '' }" href="/register">회원가입</a></li>
			</c:if>
		</ul>
	</div>
</nav>
</script>