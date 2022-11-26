<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>스프링 온라인</title>
</head>
<body>
<c:set var="menu" value="login"/>
<%@ include file="common/nav.jsp" %>
<div class="container my-3">
	<div class="row my-3">
		<div class="col">
			<h1 class="fs-5 border p-2">로그인</h1>
		</div>
	</div>
    <div class="row mb-3">
        <div class="col">
        <c:if test="${param.fail eq 'invalid'}">
        	<div class="alert alert-danger">
        		<strong>로그인 실패</strong> 아이디 혹은 비밀번호가 올바르지 않습니다.
        	</div>
        </c:if>
        <c:if test="${param.fail eq 'deny'}">
        	<div class="alert alert-danger">
        		<strong>서비스 거부</strong> 로그인이 필요한 서비스를 요청하였습니다.
        	</div>
        </c:if>
            <p>이메일과 비밀번호를 입력하세요</p>
            <form id="form-login" class="border bg-light p-3" method="post" action="login">
                <div class="mb-3">
                	<label for="email-field" class="form-label">이메일</label>
                	<input type="text" class="form-control" name="email" id="email-field" placeholder="이메일을 입력하세요"/>
                </div>
                <div class="mb-3">
                	<label for="password-field" class="form-label">비밀번호</label>
                	<input type="password" class="form-control" name="password" id="password-field" placeholder="비밀번호를 입력하세요"/>
                </div>
                <div class="text-end">
                	<a href="/" class="btn btn-secondary">취소</a>
                	<button type="submit" class="btn btn-primary">로그인</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
	$(function () {		
		$("#form-login").submit(function() {
			let emailValue = $("#email-field").val();
			if(emailValue === ""){
				alert("이메일은 필수입력값입니다.");
				return false;
			}
			let passwordValue = $("#password-field").val();
			if(passwordValue === ""){
				alert("비밀번호는 필수입력값입니다.");
				return false;
			}
			return true;
		});
	});

</script>
</body>
</html>