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
			<!--
				1) film 상세 ㅇ
				1-1) film 수정 /on/modifyActor
				1-2) film 삭제 /on/removeActor (inventory rental 정보 확인 + film_category 삭제 + film_actor + film 삭제)
				
				2) film_category 리스트
				2-1) film_category 추가
				2-2) film_category 삭제 /on/removeActorFile
				
				3) film_actor 리스트 ㅇ
				3-1) film_actor 추가 /on/addFilmActorByActor -> 검색후 선택 
				3-2) film_actor 삭제 /on/removeFilmActor
				
				4) inventory 정보
				
			-->
		<div class="col-sm-10">
			<!-- main content -->
			<h1>FILM ONE</h1>
			<table class="table table-striped">
			    <tbody>
			        <tr>
			            <td><strong>타이틀:</strong></td>
			            <td>${film.title}</td>
			        </tr>
			        <tr>
			            <td><strong>설명:</strong></td>
			            <td>${film.description}</td>
			        </tr>
			        <tr>
			            <td><strong>상영 시간:</strong></td>
			            <td>${film.length} 분</td>
			        </tr>
			        <tr>
			            <td><strong>등급:</strong></td>
			            <td>${film.rating}</td>
			        </tr>
			        <tr>
			            <td><strong>대여 가격:</strong></td>
			            <td>${film.rentalRate} USD</td>
			        </tr>
			        <tr>
			            <td><strong>발매 연도:</strong></td>
			            <td>${film.releaseYear}</td>
			        </tr>
			        <tr>
			            <td><strong>언어:</strong></td>
			            <td>${film.language}</td>
			        </tr>
			        <tr>
			            <td><strong>특별 기능:</strong></td>
			            <td>${film.specialFeatures}</td>
			        </tr>
			    </tbody>
			</table>
			<div>
				<a href="" class="btn btn-success">영화 수정</a>			
				<a href="" class="btn btn-danger">영화 삭제</a><!--  -->			
			</div>
			<hr>
			<h2>작품에 출연한 배우</h2>
			<div>
				<table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">배우 이름</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="a" items="${actorList}">
                            <tr>
                                <td>
                                    <a href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}">
                                        ${a.firstName} ${a.lastName}
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
			</div>
		</div>
	</div>
</body>
</html>