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
<c:set var="menu" value="course" />
<%@ include file="../common/nav.jsp" %>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-2">
			<!-- 카테고리 리스트 -->
			<div class="list-group">
				<a href="courses" data-category="" class="list-group-item list-group-item-action py-3 ${empty param.cat ? 'active' : '' }">전체 강의</a>
			<c:forEach var="category" items="${categories }">
				<a href="courses?cat=${category.id }" data-category="${category.id }" class="list-group-item list-group-item-action py-3 ${param.cat eq category.id ? 'active' : '' }">${category.name }</a>
			</c:forEach>
			</div>
		</div>
		<div class="col-10">
			<div class="row justify-content-md-end border-bottom mb-2">
				<div class="col col-4">
					<form>
						<div class="input-group mb-3">
							<input type="text" class="form-control rounded-0"  name="keyword">
							<button class="btn btn-success btn-sm rounded-0" type="button" >검색</button>
						</div>
					</form>				
				</div>
			</div>
			<form id="form-search-courses" action="">
			<c:if test="${not empty param.cat }">	<!--전체과정인 경우 categoryId값이 안넘어가게 하려고 -->
				<input type="hidden" name="categoryId" value="${param.cat }">
			</c:if>
				<div class="row mb-3">
					<div class="col-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/courses" class="text-decoration-none">전체</a></li>
								<li class="breadcrumb-item active" aria-current="page">프로그래밍</li>
							</ol>
						</nav>
						<div id="box-buttons">
							<c:forEach var="tag" items="${tags}" varStatus="loop">
								<button type="button" class="btn btn-secondary btn-tags mb-2 ${loop.count gt 15 ? 'extend-tag d-none' : '' }" data-tag="${tag }">${tag}</button>
							</c:forEach>
							<button type="button"  class="btn btn-primary mb-2" id="btn-toggle-tags">펼치기</button>
						</div>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-10 d-flex justified-content-start">
						<div class="border p-1 me-2">
							<div class="form-check form-check-inline ">
	  							<input class="form-check-input" type="checkbox" data-pay="유료" name="pays" value="유료">
	 							<label class="form-check-label" >유료</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" data-pay="무료" name="pays" value="무료">
								<label class="form-check-label" >무료</label>
							</div>
						</div>
						<div class="border p-1">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" data-grade="입문" name="grades" value="입문">
								<label class="form-check-label" >입문</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" data-grade="초문" name="grades" value="초급">
								<label class="form-check-label" >초급</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" data-grade="중문" name="grades" value="중급">
								<label class="form-check-label" >중급</label>
							</div>
						</div>
					</div>
				</form>
				<div class="col-2">
					<select class="form-control" name="sort">
						<option value="day" selected> 최신순</option>
						<option value="score"> 평점순</option>
						<option value="price"> 가격순</option>
					</select>
				</div>
			</div>
			<div class="row mb-3" id="box-courses">
			<c:choose>
				<c:when test="${empty courses }">
					<p class="text-center">검색결과가 존재하지 않습니다.</p>
				</c:when>
				<c:otherwise>
					<c:forEach var="course" items="${courses }">
						<div class="col-3 mb-3">
							<div class="card">
								<img src="/resources/images/course/${course.imagename }">
								<div class="card-body">
									<h5 class="card-title fs-6"><strong>${course.title }</strong></h5>
									<p class="card-text m-0">${course.user.name }</p>
									<p class="card-text m-0">
										<i class="bi ${course.reviewScore gt 0 ? 'bi-star-fill' : 'bi-star'}"></i>
										<i class="bi ${course.reviewScore gt 1 ? 'bi-star-fill' : 'bi-star'}"></i>
										<i class="bi ${course.reviewScore gt 2 ? 'bi-star-fill' : 'bi-star'}"></i>
										<i class="bi ${course.reviewScore gt 3 ? 'bi-star-fill' : 'bi-star'}"></i>
										<i class="bi ${course.reviewScore gt 4 ? 'bi-star-fill' : 'bi-star'}"></i>
										(${course.reviewCount })
									</p>
									<p class="card-text m-0">
										<span class="text-muted text-decoration-line-through"><fmt:formatNumber value="${course.price }"/>원</span>
										<strong class="text-bold text-danger float-end"><fmt:formatNumber  value="${course.discountPrice }"/> 원</strong>
									</p>
									<div class="mt-2">
										<a class="btn btn-primary btn-sm" >담기</a>
										<button class="btn border-0 float-end"><i class="bi bi-heart"></i></button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	let $extendTags = $("#box-buttons .extend-tag");
	
	$("#btn-toggle-tags").click(function() {
		// this는 클릭한 버튼 엘리먼트다.
		let text = $(this).text();
		$(this).text(text === "펼치기" ? "접기" : "펼치기");
		
		$extendTags.toggleClass("d-none");
	});
	
	// 검색조건 변경시 Ajax이용하기 2022.07.22
	// 강의 검색하기////////////////////////////////////////////////////////////
	
	// 태그를 선택할 때
	$("#box-buttons").on("click", '.btn-secondary', function() {
		  // this에는 지금 클릭한 button 엘리먼트가 있다.
		  // $(this)함수의 실행결과는 jQuery객체를 반환한다.
		  // jQuey객체에는 this가 가지고 있는 엘리먼트가 포함되어 있다.
		  // 따라서, this에는 해당하는 엘리먼트 객체에 다양한 jQuey 메소드를 적용할 수 있다.
	      $(this).removeClass("btn-secondary").addClass("btn-success");
	      
		  // 히든필드정의
		  // $(this).attr("data-tag")은 <button data-tag="자바스크립트">자바스크립트</button>에서 data-tag속성값을 조회한다.
	      let hiddenField = '<input type="hidden" name="tags" value="'+$(this).attr("data-tag")+'">';
	      // 히든필드를 아이디가 box-buttons 엘리먼트 안에 추가
	      $("#box-buttons").append(hiddenField);
	      
	      searchCourses();
   });
	// 태그 선택을 해제할 때
	$("#box-buttons").on('click', '.btn-success', function() {
	      $(this).removeClass("btn-success").addClass("btn-secondary");
	      
	      // $(this).attr("data-tag")은 <button data-tag="자바스크립트">자바스크립트</button>에서 data-tag속성값을 조회한다.
	      let tag = $(this).attr("data-tag");
	      // 히든필드 중에서 $("#box-buttons input[name=tags][value='자바스크립트']")인 히든필드를 선택하고 삭제한다.
	      $("#box-buttons input[name=tags][value='" + tag+ "']").remove();		
	      
	      
	      searchCourses();
	});
	
	// 가격 유형을 체크/해제할 때
	$(":checkbox[name=pays]").change(function() {
		searchCourses();
	});
	
	// 등급 유형을 체크/해제할 때
	$(":checkbox[name=grades]").change(function() {
		searchCourses();
	});
	
	// 정렬기준을 선택할 때
	$("select[name=sort]").change(function() {
		searchCourses();
	});
	
	function searchCourses() {
		
		let queryString = $("#form-search-courses").serialize();
		let $box = $("#box-courses").empty();
		
		$.getJSON("/courses/search", queryString, function(courses) {    // courses는 JSON.parse(jsonText)한 것
			if(courses.length == 0) {
				let content = `
							<div class="col-12">
								<p class="text-center">검색결과가 존재하지 않습니다.</p>
							</div>
									`;
				$box.append(content);
			} else {
				$.each(courses, function(index, course) {
					let content = '';
					content +=		'<div class="col-3 mb-3">';
					content +=		'<div class="card">';
					content +=			'<img src="/resources/images/course/' + course.imagename+ '">';
					content +=			'<div class="card-body">';
					content +=				'<h5 class="card-title fs-6"><strong>' + course.title + '</strong></h5>';
					content +=				'<p class="card-text m-0">' + course.user.name + '</p>';
					content +=				'<p class="card-text m-0">';
					content +=					'<i class="bi ' + (course.reviewScore > 0 ? 'bi-star-fill' : 'bi-star')  + '"></i>';
					content +=					'<i class="bi ' + (course.reviewScore > 1 ? 'bi-star-fill' : 'bi-star') + '"></i>';
					content +=					'<i class="bi ' + (course.reviewScore > 2 ? 'bi-star-fill' : 'bi-star') + '"></i>';
					content +=					'<i class="bi ' + (course.reviewScore > 3 ? 'bi-star-fill' : 'bi-star') + '"></i>';
					content +=					'<i class="bi ' + (course.reviewScore > 4 ? 'bi-star-fill' : 'bi-star') + '"></i>';
					content +=					'(' + course.reviewCount + ')';
					content +=				'</p>';
					content +=				'<p class="card-text m-0">';
					content +=					'<span class="text-muted text-decoration-line-through">' + course.price.toLocaleString()  +' 원</span>';
					content +=					'<strong class="text-bold text-danger float-end">' + course.discountPrice.toLocaleString() +' 원</strong>';
					content +=				'</p>';
					content +=				'<div class="mt-2">';
					content +=				'	<a class="btn btn-primary btn-sm" >담기</a>';
					content +=				'	<button class="btn border-0 float-end"><i class="bi bi-heart"></i></button>';
					content +=				'</div>';
					content +=			'</div>';
					content +=		'</div>';
					content +=	'</div>';
					
					$box.append(content);
				})
					
			}
		})
	}
	
/*	우리가 배웠었던 Ajax 방식
	function searchCourses() {
		//alert("과정검색하기"); 항상 제대로 동작하는지 확인하자!
		// $(폼).serialize()는 폼의 모든 입력요소값을 쿼리스트링으로 변환한다.
		let queryString = $("#form-search-courses").serialize();
		//alert(queryString);
		
			// xhr 객체 생성	
		let xhr = new XMLHttpRequest();
			// xhr 객체의 readyState값이 변경될 때 마다 이벤트가 발생하는데 그때 실행되는 함수를 등록
		xhr.onreadystatechange = function () {
			// xhr객체의 readyState값이 4, xhr객체가 서버로부터 받은 http응답코드가 200일때만
			// xhr 객체의 responseText에서 서버가 보낸 응답데이터(주로json형식의 텍스트 데이터)를 조회한다.
			if(xhr.readyState === 4 && xhr.status === 200) {
				let jsonText = xhr.responseText;
				// 조회된 json 형식의 텍스트를 자바스크립트 객체나 배열로 변환한다.
				let courses = JSON.parse(jsonText);
				// HTML 컨텐츠 생성, 웹페이지에 반영
			}
				
		}
			// xhr객체 초기화, 요청방식, 요청URL을 지정
		xhr.open("GET", "courses/search?" + queryString);
			// 서버로 http요청을 보냄
		xhr.send(); 
		
		let $box = $("#box-courses").empty();			// 지운 다음에 채워넣을 것. 엘리먼트는 남아있고 자식요소들만 삭제만 삭제된다.
		
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function () {
			if(xhr.readyState === 4 && xhr.status === 200) {
				let jsonText = xhr.responseText;
				let courses = JSON.parse(jsonText);	// 자바스크립트 배열로 변환된다.
				
				if(courses.length == 0) {
					let content = `
								<div class="col-12">
									<p class="text-center">검색결과가 존재하지 않습니다.</p>
								</div>
										`;
					$box.append(content);
				} else {
						let content = `
							<div class="col-3 mb-3">
							<div class="card">
								<img src="/resources/images/course/1.png">
								<div class="card-body">
									<h5 class="card-title fs-6"><strong id="course-title"></strong></h5>
									<p class="card-text m-0" id="course-user"></p>
									<p class="card-text m-0">
										<i id="course-star-1"></i>
										<i id="course-star-2"></i>
										<i id="course-star-3"></i>
										<i id="course-star-4"></i>
										<i id="course-star-5"></i>
										(<span id="course-review-count"></span>)
									</p>
									<p class="card-text m-0">
										<span class="text-muted text-decoration-line-through" id="course-price"> 원</span>
										<strong class="text-bold text-danger float-end" id="course-discount-price"> 원</strong>
									</p>
									<div class="mt-2">
										<a class="btn btn-primary btn-sm" >담기</a>
										<button class="btn border-0 float-end"><i class="bi bi-heart"></i></button>
									</div>
								</div>
							</div>
						</div>
						`;
					
					//	courses -> [{no:6, title="리액트 연습", user={name:"홍길동"}, reviewCount:10, price:50000, ...},	
					//				{no:9, title="스프링 연습", user={name:"홍길동"}, reviewCount:54, price:80000, ...},
					//				...] 이 배열 중 하나 꺼낸 것이 course
					
					$.each(courses, function(index, course) {
						// html 컨텐츠로 생성된 엘리먼트를 포함하는 jQuery 객체 생성
						let $el = $(content);
						// 생성된 jQuery 객체에 포함된 엘리먼트를 찾아서 값을 설정하기
						$el.find("img").attr("src", "/resources/images/course/" + course.imagename);
						$el.find("#course-title").text(course.title);
						$el.find("#course-user").text(course.user.name);
						$el.find("#course-review-count").text(course.reviewCount);
						$el.find("#course-price").text(course.price.toLocaleString() + " 원");
						$el.find("#course-discount-price").text(course.discountPrice.toLocaleString() + " 원");
						for(let i = 1; i <= 5 ; i++) {
							$el.find("#course-star-" + i).addClass(course.reviewScore > (i-1) ? "bi bi-star-fill" : "bi bi-star");
						}
						// 생성된 jQuery 객체를 $box jQuery객체에 포함된 엘리먼트의 자식 엘리먼트로 추가하기
						$box.append($el);
					})
					
				}
			}
				
		}
		
		xhr.open("GET", "courses/search?" + queryString);
		xhr.send();	// form객체를 직접 생성해서 보내려면 formData객체를 생성하고 POST 방식으로 보내야 한다.
	}
*/	
	
	
	
	
	
	
	
	
	
	
	
	
})

</script>
</body>
</html>