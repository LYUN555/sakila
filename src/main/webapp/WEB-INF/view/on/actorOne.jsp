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
			<h1>ACTOR ONE</h1>
			<!--
				1) actor 상세 ㅇ
				1-1) actor 수정 /on/modifyActor
				1-2) actor 삭제 /on/removeActor (actor_file 삭제 + film_actor + actor 삭제)
				
				2) actor_file 리스트 ㅇ
				2-1) actor_file 추가 o
				2-2) actor_file 삭제 /on/removeFilmCategory
				
				3) film_actor 리스트 ㅇ
				3-1) film_actor 추가 /on/addFilmByActor -> 액터 검색 후 선택 o
				3-2) film_actor 삭제 /on/removeFilmActor
			-->
			<table class="table table-striped">
				<tr>
					<td>actorId</td>
					<td>${actor.actorId}</td>
				</tr>
				<tr>
					<td>firstName</td>
					<td>${actor.firstName}</td>
				</tr>
				<tr>
					<td>lastName</td>
					<td>${actor.lastName}</td>
				</tr>
				<tr>
					<td>lastUpdate</td>
					<td>${actor.lastUpdate}</td>
				</tr>
			</table>
			<div>
				<a href="${pageContext.request.contextPath}/on/modifyActor" class="btn btn-success" >actor 수정[과제 : 입력폼, 액션, 서비스, 맵퍼]</a>
			</div>
			<!-- actor file -->
			<h2>ACTOR FILE</h2>
			<table class="table table-striped">
				<tr>
					<td>image</td>
					<td>type</td>
					<td>size</td>
					<td>createDate</td>
					<td>삭제</td>
				</tr>
				<c:forEach var="af" items="${actorFileList}">
					<tr>
						<td>
							<img src="${pageContext.request.contextPath}/upload/${af.filename}.${af.ext}" width="200" height="200">
						</td>
						<td>${af.type}</td>
						<td>${af.size} byte</td>
						<td>${af.createDate}</td>
						<td><a href="${pageContext.request.contextPath}/on/removeActorFile?actorFileId=${af.actorFileId}&actorId=${actor.actorId}" class="btn btn-danger">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
			<div>
				<a href="${pageContext.request.contextPath}/on/addActorFile?actorId=${actor.actorId}" class="btn btn-success">이미지 파일 추가</a>
			</div>
			<!-- film -->
			<h2>출연 작품</h2>
			<div>
				<!-- 출연작 추가 -->
				<form id="formSearchFilm" method="get" action="${pageContext.request.contextPath}/on/actorOne"> <!-- 영화 검색 -->
					<!-- film 검색시 actorId 도 넘긴다 -->
					<input type="hidden" name="actorId" value="${actor.actorId}">
					<input type="text" name="searchTitle">
					<button id="btnSearchFilm" type="button">영화 검색</button>
				</form>
				
				<form id="formAddFilm" method="post" action="${pageContext.request.contextPath}/on/addFilmByActor">
					<input type="hidden" name="actorId" value="${actor.actorId}">
					<select size="5" name = "filmId" >
						<c:forEach var="sf" items="${searchFilmList}">
							<option value="${sf.filmId}">${sf.title}</option>
						</c:forEach>
					</select>
					<button id="btnAddFilm" type="button">영화 추가</button>
				</form>
			</div>
			<div>
			    <table class="table table-striped">
		            <c:forEach var="fl" items="${filmList}">
		                <tr>
		                    <td>
		                        <a href="${pageContext.request.contextPath}/on/filmOne?filmId=${fl.filmId}">
		                            ${fl.title}
		                        </a>&nbsp;
		                    </td>
		                    <td>
		                        <a href="${pageContext.request.contextPath}/on/removeFilmActor?actorId=${actor.actorId}&filmId=${fl.filmId}" class="btn btn-danger">출연작품 삭제</a>
		                		<!-- fileId & actorId 필요 -->
		                	<td>
		                </tr>
		            </c:forEach>
			    </table>
			</div>
		</div>
	</div>
</body>
<script>
	// film Title 검색
	$('#btnSearchFilm').click(function() {
		$('#formSearchFilm').submit();
	});
	
	// 출연작(film) 추가
	$('#btnAddFilm').click(function() {
		$('#formAddFilm').submit();
	});
</script>
</html>