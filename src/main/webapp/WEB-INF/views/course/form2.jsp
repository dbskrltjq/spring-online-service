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
			<form id="form-course" class="col-8 p-3" method="post" action="insert">
				<div class="mb-3">
					<label class="form-label">이런 것을 배울 수 있어요.(최대 5개)</label>
					<input class="form-control mb-2" type="text" name="learnings">
					<button type="button" class="btn btn-success btn-sm mb-3 w-100" id="btn-add-learning">추가</button>
				</div>
				<div class="mb-3">
					<label class="form-label">이런 분들에게 추천해요.(최대 5개)</label>
					<input class="form-control  mb-2" type="text" name="targets">
					<button type="button" class="btn btn-success btn-sm mb-3 w-100" id="btn-add-target">추가</button>
				</div>
				<div class="mb-3">
					<label class="form-label">태그를 추가하세요.(최대 5개)</label>
					<div class="d-flex justify-content-start">
						<input class="form-control w-25 me-3" type="text" id="input-tag">
						<button type="button" class="btn btn-success btn-sm" id="btn-add-tag">추가</button>
					</div>
					<div class="mb-3 mt-2">
						<span class="badge text-bg-secondary rounded-1 p-2">자바스크립트</span>
						<div id="tag-box">
							<input type="hidden" name="tags" value="자바스크립트">
						</div>
					</div>
				</div>
				<div class="text-end">
					<button type="submit" class="btn btn-primary px-5">등록</button>
				</div>				
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$("#btn-add-learning").click(function() {
		let learningFieldLength = $(":input[name=learnings]").length;
		if(learningFieldLength >= 5) {
			alert("최대 5개까지만 가능합니다.");
			return;
		}
		let content = '<input class="form-control mb-2" type="text" name="learnings">';
		$(this).before(content);
	});
	
	$("#btn-add-target").click(function() {
		let targetFieldLength = $(":input[name=targets]").length;
		if(targetFieldLength >= 5) {
			alert("최대 5개까지만 가능합니다.");
			return;
		}
		let content = '<input class="form-control  mb-2" type="text" name="targets">';
		$(this).before(content);
	});
	
	
	$("#btn-add-tag").click(function() {
		let $div = $("#tag-box");		
		let $input = $("#input-tag");	
		
		let tagLength = $(":input[name=tags]").length;
		if(tagLength >= 5) {
			alert("최대 5개까지만 가능합니다.");
			$input.val("");
			return;
		}
		
		let value = $input.val().trim();            
		if(value != "") {
			let spanContent = '<span class="badge text-bg-secondary rounded-1 p-2 me-2">' + value +'</span>'
			let hiddenContent = '<input type="hidden" name="tags" value="' + value + '">'
			
			$div.before(spanContent);
			$div.append(hiddenContent);
			
			$input.val("");
		}
	});
	
	$("#form-course").submit(function() {
		
		let existEmptyLearning = false;
		$(":input[name=learnings]").each(function (index, element) {
			if($(element).val() === "") {
				existEmptyLearning = true;
			}
		});
		if(existEmptyLearning) {
			alert("배울 수 있는 것 항목에 빈 값이 있습니다.");
			return false;
		}
		
		let existEmptyTarget = false;
		$(":input[name=target]").each(function () {
			if($(this).val() === "") {
				existEmptyTarget = true;
			}
		});
		if(existEmptyTarget) {
			alert("추천 항목에 빈 값이 있습니다.");
			return false;
		}
		
		if($("#tag-box input").length === 0){
			alert("태그는 하나 이상 등록해야 합니다.");
			return false;
		}
		
		return true;
		
	});
	
})


</script>
</body>
</html>