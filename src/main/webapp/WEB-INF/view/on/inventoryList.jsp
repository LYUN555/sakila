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
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">

            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&currentPage=1">첫 페이지</a>
            </li>
            <c:if test="${startPage > 10}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&currentPage=${startPage-10}">이전</a>
                </li>
            </c:if>
            <c:if test="${startPage <= 10}">
                <li class="page-item disabled">
                    <a class="page-link" href="#">이전</a>
                </li>
            </c:if>
            <c:forEach var="i" begin="${startPage}" end="${startPage + 9}">
                <c:if test="${i <= lastPage}">
                    <li class="page-item <c:if test='${i == currentPage}'>active</c:if>'">
                        <a class="page-link" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&currentPage=${i}">${i}</a>
                    </li>
                </c:if>
            </c:forEach>
            <c:if test="${startPage + 10 <= lastPage}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&currentPage=${startPage+10}">다음</a>
                </li>
            </c:if>
            <c:if test="${startPage + 10 > lastPage}">
                <li class="page-item disabled">
                    <a class="page-link" href="#">다음</a>
                </li>
            </c:if>
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&currentPage=${lastPage}">마지막</a>
            </li>
        </ul>
    </nav>
</div>
		</div>
	</div>
</body>
</html>