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
<body class="container-fluid">
	<div class ="row">
		<div class="col-sm-2 bg-light">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		<div class="col-sm-10 text-center">
			<!-- maincontent -->
			<div class="container mt-3">
				<h1>staffOne</h1>
				<table class="table table-bordered">
					<thead class="table-secondary">
						<tr>
							<td>staffId</td>
							<td>${staff.staffId}</td>
						</tr>
						<tr>
							<td>firstName</td>
							<td>${staff.firstName}</td>
						</tr>
						<tr>
							<td>staffAddress</td>
							<td>${staff.staffAddress}</td>
						</tr>
						<tr>
							<td>staffAddress2</td>
							<td>${staff.staffAddress2}</td>
						</tr>
						<tr>
							<td>staffDistrict</td>
							<td>${staff.staffDistrict}</td>
						</tr>
						<tr>
							<td>staffPostCode</td>
							<td>${staff.staffPostCode}</td>
						</tr>
						<tr>
							<td>staffPhone</td>
							<td>${staff.staffPhone}</td>
						</tr>
						<tr>
							<td>staffCity</td>
							<td>${staff.staffCity}</td>
						</tr>
						<tr>
							<td>staffCountry</td>
							<td>${staff.staffCountry}</td>
						</tr>
					</thead>
					<thead class="table-success">
						<tr>
							<td>storeId</td>
							<td>${staff.storeId}</td>
						</tr>
						<tr>
							<td>managerStaffId</td>
							<td>${staff.managerStaffId}</td>
						</tr>
						<tr>
							<td>managerName</td>
							<td>${staff.managerName}</td>
						</tr>
						<tr>
							<td>storeAddress</td>
							<td>${staff.storeAddress}</td>
						</tr>
						<tr>
							<td>storeAddress2</td>
							<td>${staff.storeAddress2}</td>
						</tr>
						<tr>
							<td>storeDistrict</td>
							<td>${staff.storeDistrict}</td>
						</tr>
						<tr>
							<td>storePostCode</td>
							<td>${staff.storePostCode}</td>
						</tr>
						<tr>
							<td>storePhone</td>
							<td>${staff.storePhone}</td>
						</tr>
						<tr>
							<td>storeCity</td>
							<td>${staff.storeCity}</td>
						</tr>
						<tr>
							<td>storeCountry</td>
							<td>${staff.storeCountry}</td>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</body>
</html>