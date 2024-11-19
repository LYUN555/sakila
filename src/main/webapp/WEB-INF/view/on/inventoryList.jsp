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
					<td>(filmId)title</td>
					<td>lastUpdate</td>
					<td>대여</td><!-- 대여가능 / 렌탈날짜(고객id) -->
					<td>customerId</td>
					<td>삭제</td>
				</tr>
				<c:forEach var="iv" items="${inventoryList}">
					<tr>
						<td>${iv.inventoryId}</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${iv.filmId}">(${iv.filmId})${iv.title}</a>
						</td>
						<td>${iv.lastUpdate}</td>
						<td>${iv.rentalDate}</td>
						<td>
							<c:if test="${iv.customerId != null }">
								<a href="${pageContext.request.contextPath}/on/customerOne?customerId=${iv.customerId}">
									${iv.customerId}
								</a>
							</c:if>
							<c:if test="${iv.customerId == null }">
								<a href="${pageContext.request.contextPath}/on/addRental?inventoryId=${iv.inventoryId}" class="btn btn-primary">대여</a>
							</c:if>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/removeInventoryByKey?inventoryId=${iv.inventoryId}&storeId=${storeId}" class="btn btn-danger">삭제</a>
						</td>
				</c:forEach>
			</table>
			<div>
			    <nav aria-label="Page navigation">
			        <ul class="pagination justify-content-center">
			
			            <li class="page-item">
			                <a class="page-link" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&currentPage=1&searchInventory=${searchInventory}">처음</a>
			            </li>
			            <c:if test="${startPage > 10}">
			                <li class="page-item">
			                    <a class="page-link" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&currentPage=${startPage-10}&searchInventory=${searchInventory}">이전</a>
			                </li>
			            </c:if>
			            <c:if test="${startPage <= 10}">
			                <li class="page-item disabled">
			                    <a class="page-link" href="#">이전</a>
			                </li>
			            </c:if>
			            <c:forEach var="i" begin="${startPage}" end="${endPage}">
			                <c:if test="${i <= lastPage}">
			                    <li class="page-item <c:if test='${i == currentPage}'>active</c:if>'">
			                        <a class="page-link" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&currentPage=${i}&searchInventory=${searchInventory}">${i}</a>
			                    </li>
			                </c:if>
			            </c:forEach>
			            <c:if test="${startPage + 10 <= lastPage}">
			                <li class="page-item">
			                    <a class="page-link" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&currentPage=${startPage+10}&searchInventory=${searchInventory}">다음</a>
			                </li>
			            </c:if>
			            <c:if test="${startPage + 10 > lastPage}">
			                <li class="page-item disabled">
			                    <a class="page-link" href="#">다음</a>
			                </li>
			            </c:if>
			            <li class="page-item">
			                <a class="page-link" href="${pageContext.request.contextPath}/on/inventoryList?storeId=${storeId}&currentPage=${lastPage}&searchInventory=${searchInventory}">마지막</a>
			            </li>
			        </ul>
			    </nav>
			</div>
			<div>
				<form id="formSearchInventory" method="get" action="${pageContext.request.contextPath}/on/inventoryList">
					<input type="hidden" name="storeId" value="${storeId}">
					<input type="text" name="searchInventory" id = "searchInventory" value="${searchInventory}">
					<button id="btnSearchInventory" type="button" class="btn btn-success">영화검색</button>
				</form>
				<a href="${pageContext.request.contextPath}/on/addInventory?storeId=${storeId}" class="btn btn-success">인벤토리추가</a>
			</div>
		</div>	
</body>
<script>
	$('#btnSearchInventory').click(function() {
		if($('#searchInventory').val()== ''){
			alert('검색어를 입력해주세요');
			return;
		}
		$('#formSearchInventory').submit();
	});
</script>
</html>