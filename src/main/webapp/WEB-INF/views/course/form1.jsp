<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>스프링 온라인</title>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container my-3">
	<div class="row my-3">
		<div class="col">
			<h1 class="fs-5 border p-2">강의 정보</h1>
		</div>
	</div>
	<div class="row mb-3 px-3">
		<div class="col border bg-light">
			<form id="form-course" class="col-8 p-3" method="post" action="form2" enctype="multipart/form-data">
				<div class="mb-3">
					<label class="form-label">카테고리</label>
					<div>
					<c:forEach items="${categories}" var="category">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" name="categoryIds" value="${category.id}">
							<label class="form-check-label" >${category.name }</label>
						</div>
					</c:forEach>
					</div>
				</div>
				<div class="mb-3">
					<label class="form-label">강의 제목</label>
					<input class="form-control " type="text" name="title">
				</div>
				<div class="mb-3">
					<label class="form-label">강의수준</label>
					<div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="grade" value="입문" checked="checked">
							<label class="form-check-label" >입문</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="grade" value="초급">
							<label class="form-check-label" >초급</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="grade" value="중급">
							<label class="form-check-label" >중급</label>
						</div>
					</div>
				</div>
				<div class="mb-3">
					<label class="form-label">수강기간</label>
					<div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="period" value="3개월" checked="checked">
							<label class="form-check-label" >3개월</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="period" value="6개월">
							<label class="form-check-label" >6개월</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="period" value="1년">
							<label class="form-check-label" >1년</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="period" value="무제한">
							<label class="form-check-label" >무제한</label>
						</div>
					</div>
				</div>
				<div class="mb-3">
					<label class="form-label">수료증 발급여부</label>
					<div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="certificate" value="발급" checked="checked">
							<label class="form-check-label" >발급</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="certificate" value="미발급">
							<label class="form-check-label" >미발급</label>
						</div>
					</div>
				</div>
				<div class="mb-3">
					<label class="form-label">가격</label>
					<input class="form-control w-50" type="number" name="price" value="50000">
				</div>
				<div class="mb-3">
					<label class="form-label">강의 대표 이미지</label>
					<input class="form-control w-50" type="file" name="imageFile">
				</div>
				
				
				
				<div class="mb-3">
					<label class="form-label">강의 설명</label>
					<textarea class="form-control" rows="5" name="description"></textarea>
				</div>
				<div class="text-end">
					<button type="submit" class="btn btn-primary px-5">다음</button>
				</div>				
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function () {
	$("#form-course").submit(function() {
		// 선택된 카테고리가 하나 이상인지 체크하기
		let checkedCategoryLength = $(":checkbox[name=categoryIds]:checked").length;
		if(checkedCategoryLength === 0) {
			alert("카테고리를 하나이상 선택하세요!");
			return false;			// submit의 기본동작을 막는다.
		}
		// 제목필드에 값이 있는지 체크하기
		let titleValue = $(":input[name=title]").val().trim();			// $.trim($(":input[name=title]").val()) 이렇게 해도 된다.
		if(titleValue === "") {
			alert("제목은 필수 입력값입니다!");
			return false;	
		}
		// 가격필드에 올바른 값이 설정되었는지 체크하기
		let priceValue = parseInt($(":input[name=price]").val());
		if(priceValue < 0) {
			alert("가격이 유효한 값이 아닙니다.");
			return false;
		}
		// 강의 이미지가 설정되어 있는지 체크하기
		let imageFileValue = $(":file[name=imageFile]").val(); // 첨부파일 필드에서 name이 imageFile인 것
		if(imageFileValue === "") {
			alert("강의 이미지를 첨부해주세요");
			return false;
		}
		// 설명필드에 값이 있는지 체크하기
		let descriptionValue = $("textarea[name=description]").val();		// textarea는 : 앞에 콜론 안붙는다!
		if(descriptionValue === "") {
			alert("내용은 필수입력값입니다!");
			return false;
		}
		
		return true;
	});
})

</script>

</body>
</html>