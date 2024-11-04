<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
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
			<h1>STAFF LIST</h1>
			
			<table class="table table-striped">
				<tr>
					<td>staff_id</td>
					<td>firstName</td>
					<td>lastName</td>
					<td>addressId</td>
					<td>email</td>
					<td>storeId</td>
					<td>username</td>
					<td>lastUpdate</td>
					<td>active</td>
					<td>활성화</td>
				</tr>
				<c:forEach items="${staffList}" var="s">
					<tr>
						<td>${s.staffId}</td>
						<td>${s.firstName}</td>
						<td>${s.lastName}</td>
						<td>${s.addressId}</td>
						<td>${s.email}</td>
						<td>${s.storeId}</td>
						<td>${s.username}</td>
						<td>${s.lastUpdate}</td>
						<td>${s.active}</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/modifyStaffActive?staffId=${s.staffId}&active=${s.active}" class="btn btn-warning">
								<c:if test="${s.active==1}">비활성화</c:if>
								<c:if test="${s.active==2}">활성화</c:if>
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		<div class="text-center">
			<c:if test="${currentPage > 1}">
				<a href="${pageContext.request.contextPath}/on/staffList?currentPage=1" class="btn btn-secondary">첫페이지</a>
				<a href="${pageContext.request.contextPath}/on/staffList?currentPage=${currentPage-1}" class="btn btn-secondary">이전</a>
			</c:if>
			<span>[${currentPage}]</span>
			<c:if test="${currentPage < lastPage}">
				<a href="${pageContext.request.contextPath}/on/staffList?currentPage=${currentPage+1}" class="btn btn-secondary">다음</a>
				<a href="${pageContext.request.contextPath}/on/staffList?currentPage=${lastPage}" class="btn btn-secondary">마지막페이지</a>
			</c:if>
		</div>
		</div>
	</div>
</body>
</html>