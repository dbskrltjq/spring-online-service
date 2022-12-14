<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>스프링 온라인</title>
</head>
<body>
<c:set var="menu" value="home" />
<%@ include file="common/nav.jsp" %>
<div class="container my-3">
    <div class="row mb-3">
        <div class="col">
            <div class="border p-3 bg-light">
                <h1 class="mb-4">스프링 온라인 애플리케이션 입니다.</h1>
                <p class="">스프링 온라인 교육 사이트입니다. 강의를 수강하고, 새 강좌를 등록해보세요</p>
				
				<c:if test="${empty LOGIN_USER }">
                 <div>
                     <a href="/register" class="btn btn-outline-primary btn-lg">회원가입</a>
                     <a href="/login" class="btn btn-primary btn-lg">로그인</a>
                 </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>