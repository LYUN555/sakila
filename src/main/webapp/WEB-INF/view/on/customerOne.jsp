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
			<h1>CUSTOMER ONE</h1>
			<!-- 고객 개인정보 -->
			<div>
				<table class="table table-striped">
					<tr>
						<td>storeId</td>
						<td>${customer.storeId}</td>
					</tr>
					<tr>
						<td>customerId</td>
						<td>${customer.customerId}</td>
					</tr>
					<tr>
						<td>firstName</td>
						<td>${customer.firstName}</td>
					</tr>
					<tr>
						<td>lastName</td>
						<td>${customer.lastName}</td>
					</tr>
					<tr>
						<td>addressId</td>
						<td>${customer.addressId}</td>
					</tr>
					<tr>
						<td>email</td>
						<td>${customer.email}</td>
					</tr>
					<tr>
						<td>address</td>
						<td>${customer.address}</td>
					</tr>
					<tr>
						<td>district</td>
						<td>${customer.district}</td>
					</tr>
					<tr>
						<td>postalCode</td>
						<td>${customer.postalCode}</td>
					</tr>
					<tr>
						<td>phone</td>
						<td>${customer.phone}</td>
					</tr>
					<tr>
						<td>cityId</td>
						<td>${customer.cityId}</td>
					</tr>
					<tr>
						<td>city</td>
						<td>${customer.city}</td>
					</tr>
					<tr>
						<td>countryId</td>
						<td>${customer.countryId}</td>
					</tr>
					<tr>
						<td>country</td>
						<td>${customer.country}</td>
					</tr>
					<tr>
						<td>createDate</td>
						<td>${customer.createDate}</td>
					</tr>
				</table>
			</div>
			<div>
			<h2>RENTAL LIST</h2>
				<!-- 고객 렌탈 리스트 -->
				<table class="table table-striped">
					<tr>
						<td>rentalId</td>
						<td>inventoryId</td>
						<td>title</td>
						<td>amount</td>
						<td>rentalDate</td>
					</tr>
					<c:forEach var="r" items="${rentalList}">
						<tr>
							<td>${r.rentalId}</td>
							<td>${r.inventoryId}</td>
							<td>${r.title}</td>
							<td>${r.amount}</td>
							<td>${r.rentalDate}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>