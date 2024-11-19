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
			<h1>ADD RENTAL</h1>
			<div>
				<form id="formSearchName" method="get" action="${pageContext.request.contextPath}/on/addRental">
					<input type="hidden" name="inventoryId" value="${inventoryId}">
					<div>
						이름 검색 : <input type ="text" name="searchName" id="searchName" value="${searchName}">
					</div>
					<button id="btnSearchName" type="button">검색</button>
				</form>
			</div>
			<form id="formAddRental" method="post" action="${pageContext.request.contextPath}/on/addRental">
				<table class= "table table-striped">
					<tr>
						<td>customerId</td>
						<td>
							<select name ="customerId" id="customerId" size ="5">
								<c:forEach var="c" items="${customerList}">
									<option value="${c.customerId}">
									${c.firstName}
									${c.lastName}
									${c.email}
									</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>InventoryId</td>
						<td><input type="text" name ="inventoryId" id="inventoryId" value="${inventoryId}" readonly></td>
					</tr>
					<tr>
						<td>staffId</td>
						<td><input type="text" name ="staffId" id="staffId" value="${loginStaff.staffId}" readonly></td>
					</tr>
					<tr>
						<td>rentalDate</td>
						<td><input type="datetime-local" name ="rentalDate" id="rentalDate"></td>
					</tr>
				</table>
				<button id="btnAddRental" type="button">대여</button>
			</form>
		</div>
	</div>
</body>
<script>
	$('#btnSearchName').click(function() {
		if($('#searchName').val() == ''){
			alert('검색어를 입력하세요');
			return;
		}
		$('#formSearchName').submit();
	});
	
	$('#btnAddRental').click(function() {
		if($('#customerId').val() == null){
			alert('아이디를 선택하세요');
		} else if ($('#rentalDate').val() == ''){
			alert('렌탈 날짜를 입력하세요');
		} else {
			$('#formAddRental').submit();
		}
		
	});
</script>
</html>