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
			<h1>CUSTOMER LIST</h1>
			<div>
				<a href="${pageContext.request.contextPath}/on/customerList" class="btn btn-primary">전체</a>
			</div>
			<table class="table table-striped">
				<tr>
					<th>customerId</th>
					<th>storeId</th>
					<th>name</th>
					<th>email</th>
					<th>addressId</th>
					<th>createDate</th>
					<th>lastUpdate</th>
				</tr>
				<c:forEach var="c" items="${customerList}">
					<tr>
						<td><a href="${pageContext.request.contextPath}/on/customerOne?customerId=${c.customerId}">${c.customerId}</a></td><!-- 렌탈 x 지불 조인 -->			
						<td>${c.storeId }</td>			
						<td>${c.firstName} ${c.lastName}</td>			
						<td>${c.email}</td>			
						<td>${c.addressId}</td>			
						<td>${c.createDate}</td>			
						<td>${c.lastUpdate}</td>			
					</tr>
				</c:forEach>
			</table>
			<div>
				<nav aria-label="Page navigation">
			        <ul class="pagination justify-content-center">
			
			            <li class="page-item">
			                <a class="page-link" href="${pageContext.request.contextPath}/on/customerList?currentPage=1&searchName=${searchName}">처음</a>
			            </li>
			            <c:if test="${startPage > numPerPage}">
			                <li class="page-item">
			                    <a class="page-link" href="${pageContext.request.contextPath}/on/customerList?currentPage=${startPage-numPerPage}&searchName=${searchName}">이전</a>
			                </li>
			            </c:if>
			            <c:if test="${startPage < numPerPage}">
			                <li class="page-item disabled">
			                    <a class="page-link" href="#">이전</a>
			                </li>
			            </c:if>
			            <c:forEach var="i" begin="${startPage}" end="${endPage}">
			                <c:if test="${i <= lastPage}">
			                    <li class="page-item">
			                        <a class="page-link" href="${pageContext.request.contextPath}/on/customerList?currentPage=${i}&searchName=${searchName}">${i}</a>
			                    </li>
			                </c:if>
			            </c:forEach>
			            <c:if test="${startPage + numPerPage <= lastPage}">
			                <li class="page-item">
			                    <a class="page-link" href="${pageContext.request.contextPath}/on/customerList?currentPage=${startPage+numPerPage}&searchName=${searchName}">다음</a>
			                </li>
			            </c:if>
			            <c:if test="${startPage + numPerPage > lastPage}">
			                <li class="page-item disabled">
			                    <a class="page-link" href="#">다음</a>
			                </li>
			            </c:if>
			            <li class="page-item">
			                <a class="page-link" href="${pageContext.request.contextPath}/on/customerList?currentPage=${lastPage}&searchName=${searchName}">마지막</a>
			            </li>
			        </ul>
			    </nav>
			</div>
			<div>
				<form id="formSearchName" method="get" action="${pageContext.request.contextPath}/on/customerList">
					<input type="text" name="searchName" id = "searchName" value="${searchName}">
					<button id="btnSearchName" type="button" class="btn btn-success">이름검색</button>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	$('#btnSearchName').click(function() {
		if($('#searchName').val()== ''){
			alert('검색어를 입력해주세요');
			return;
		}
		$('#formSearchName').submit();
	});
</script>
</html>