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
<body class="container-fluid">
	<div class="row">
		<div class="col-sm-2 bg-light">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-10">
			<!-- main content -->
			<h1>${storeId}지점 INVENTORY LIST</h1>
			<table class="table table-striped">
				<tr>
					<td>inventoryId</td>
					<td>filmId</td>
					<td>title</td>
					<td>lastUpdate</td>
				</tr>
				<c:forEach var="iv" items="${inventoryList}">
					<tr>
						<td>${iv.inventoryId}</td>
						<td>${iv.filmId}</td>
						<td>${iv.title}</td>
						<td>${iv.lastUpdate}</td>
				</c:forEach>
			</table>
		<div>
			<c:if test="${currentPage<10}">
				<a href="#">이전</a>
			</c:if>
			<c:if test="${currentPage>10}">
				<a href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&currentPage=${currentPage-9}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${currentPage}" end="">
			
			</c:forEach>
		</div>
		</div>
	</div>
</body>
</html>