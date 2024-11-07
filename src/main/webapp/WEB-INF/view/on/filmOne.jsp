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