<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${user.name}님의 프로필</title>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container">
	<div class="row mt-5">
		<div class="col-4 me-5">
			<div class="d-flex justify-content-between my-2">
				<h2>${user.name}</h2>
				<img class="rounded-circle" src="/resources/images/profile/${not empty user.profileImage ? user.profileImage : 'profile-default-img.png'}" alt="프로필사진" width="50">
			</div>
		</div>
		<div class="col-7">
			<h3 class="fw-bold">소개</h3>
		</div>
		
	</div>
</div>
</body>
</html>