<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="container-flud">
	<div class="row">
		<div class="col-sm-2 bg-light">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-10">
			<!-- main content -->
			<h1>ADD FILM</h1>
			<form id="formAddFilm" method = "post" action="${pageContext.request.contextPath}/on/addFilm">
				<table class = "table table-striped" style="width: 80%">
					<tr>
						<td>타이틀</td>
						<td>
							<input type = "text" id = "title" name="title">
						</td>
						
					</tr>
					<tr>
						<td>개봉 날짜</td>
						<td>
							<input type="number" id="releaseYear" name="releaseYear">
						</td>
					</tr>
					<tr>
						<td>언어</td>
						<td>
							<select id="languageId" name="languageId">
								<option value="">언어선택</option>
								<c:forEach items="${languageList}" var="la">
									<option value="${la.languageId}">${la.name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>오리지널 언어</td>
						<td>
							<select id="originalLanguageId" name="originalLanguageId">
								<option value="">오리지널언어선택</option>
								<c:forEach items="${languageList}" var="la">
									<option value="${la.languageId}">${la.name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>설명</td>
						<td>
							<!-- textarea -->
							<textarea rows="3" cols="50" id = "description" name ="description"></textarea>
						</td>
					</tr>
					<tr>
						<td>대여 기간</td>
						<td>
							<!-- db기본값 : 3 -->
							<input type="number" id="rentalDuration" name="rentalDuration" value="3">
						</td>
					</tr>
					<tr>
						<td>대여 가격</td>
						<td>
							<!-- db기본값 : 4.99 -->
							<input type="number" id="rentalRate" name="rentalRate" value="4.99">
						</td>
					</tr>
					<tr>
						<td>상영 시간</td>
						<td>
							<input type="number" id="length" name="length">분
						</td>
					</tr>
					<tr>
						<td>교체 비용</td>
						<td>
							<!-- db기본값 : 19.99 -->
							<input type="number" id="replacementCost" name="replacementCost" value="19.99">
						</td>
					</tr>
					<tr>
						<td>등급</td>
						<td>
							<!-- radio, db기본값(enum(G, PG,PG-13, R, NC-17) : 'G'-->
							<input type="radio" name="rating"  class = "rating" value="G">G<br>
							<input type="radio" name="rating"  class = "rating" value="PG">PG<br>
							<input type="radio" name="rating"  class = "rating" value="PG-13">PG-13<br>
							<input type="radio" name="rating"  class = "rating" value="R">R<br>
							<input type="radio" name="rating"  class = "rating" value="NC-17">NC-17<br>
						
						</td>
					</tr>
					<tr>
						<td>특수 기능</td>
						<td>
							<!-- checkBox, SET('Trailers', 'Commentaries', 'Deleted Scenes', 'Behind the Scenes') db기본값 : null -->
							<input type="checkbox" name="specialFeatures" class="specialFeatures" value="Trailers">Trailers<br>
							<input type="checkbox" name="specialFeatures" class="specialFeatures" value="Commentaries">Commentaries<br>
							<input type="checkbox" name="specialFeatures" class="specialFeatures" value="Deleted Scenes">Deleted Scenes<br>
							<input type="checkbox" name="specialFeatures" class="specialFeatures" value="Behind the Scenes">Behind the Scenes<br>
						</td>
					</tr>
				</table>
				<button id="btnAddFilm" type="button">영화추가</button>
			</form>
		</div>
	</div>
</body>
<script>
	$('#btnAddFilm').click(function() {
		// 폼 유효성 검사(description, releaseYear, originalLanguageId, length, specialFeatures 제외)
		if($('#title').val() == ''){
			alert('제목을 입력하세요');
		} else if($('#languageId').val() == ''){
			alert('언어를 선택하세요');
		} else if(isNaN(Number($('#rentalDuration').val()))) {
	        alert('대여기간을 입력하세요');
	    } else if(isNaN(Number($('#rentalRate').val()))) {
	        alert('대여가격 숫자를 입력하세요');
	    } else if(isNaN(Number($('#replacementCost').val()))) {
	        alert('교체 비용 숫자를 입력하세요');
	    } else if($('.rating:checked').length < 1) {
	        alert('등급 을 선택하세요');
	    } else {
	        $('#formAddFilm').submit();
	    }
	});
</script>
</html>