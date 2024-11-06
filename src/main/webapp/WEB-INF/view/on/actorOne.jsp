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
			<!-- actor -->
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
					<td>
						<img src="${pageContext.request.contextPath}/upload/${af.filename}.${af.ext}">
					</td>
					<td>${af.type}</td>
					<td>${af.size} byte</td>
					<td>${af.createDate}</td>
					<td><a href="">삭제</a></td>
				</c:forEach>
			</table>
			<div>
				<a href="">이미지 파일 추가</a>
			</div>
			<!-- film -->
			<h2>출연 작품</h2>
			<div>
			    <table class="table table-striped">
		            <c:forEach var="f" items="${filmList}">
		                <tr>
		                    <td>
		                        <a href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}">
		                            ${f.title}
		                        </a>
		                    </td>
		                </tr>
		            </c:forEach>
			    </table>
			</div>
		</div>
	</div>
</body>
</html>