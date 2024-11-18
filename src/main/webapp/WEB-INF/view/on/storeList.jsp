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
			<h1>STORE LIST</h1>
			<table class="table table-striped">
				<tr>
					<td>storeId</td>
					<td>managerStaffId</td>
					<td>managerName</td>
					<td>addressId(store)</td>
					<td>address</td>
					<td>district</td>
					<td>cityId</td>
					<td>postalCode</td>
					<td>phone</td>
					<td>inventoryList</td>
					<td>inventory관리</td>
				</tr>
				<c:forEach var="s" items="${storeList}">
					<tr>
						<td>${s.storeId}</td>
						<td>${s.managerStaffId}</td>
						<td>${s.firstName} ${s.lastName}</td>
						<td>${s.addressId}</td>
						<td>${s.address}</td>
						<td>${s.district}</td>
						<td>${s.cityId}</td>
						<td>${s.postalCode}</td>
						<td>${s.phone}</td>
						<td><a href="${pageContext.request.contextPath}/on/inventoryList?storeId=${s.storeId}">인벤토리</a></td>
						<td><a href="${pageContext.request.contextPath}/on/addInventory?storeId=${s.storeId}">인벤토리추가</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>