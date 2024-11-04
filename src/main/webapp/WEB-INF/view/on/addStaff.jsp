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
			<h1>ADD STAFF</h1>
			
			<h2>주소 검색</h2>
			<form id="formAddress" action="${pageContext.request.contextPath}/on/addStaff" method="get">
				<input type="text" name="searchAddress" id = "searchAddress">
				<button type="submit" id = "btnAddress" class="btn btn-success">주소검색</button>
			</form>
			
			<div>
				<h2>주소 선택</h2>
				<select id ="resultAddress" size="1">
					<c:forEach items="${addressList}" var="a">
						<option value="${a.addressId}">(ADDRESS ID : ${a.addressId})${a.address}</option>
					</c:forEach>
				</select>
				<button type="button" id="btnAddrSel" class="btn btn-success">주소선택</button>
			</div>
			
			<hr>
			
			<h2>입력</h2>
			<form id="addForm" action="${pageContext.request.contextPath}/on/addStaff" method="post">
				<table class="table table-border table-sm" style="width: 80%">
					<tr>
						<td>storeId</td>
						<td>
							<select name="storeId" id="storeId">
								<option value="" >:::선택:::</option>
								<c:forEach var="s" items="${storeList}">
									<option value="${s.storeId}">${s.storeId}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					
					<tr>
						<td>addressId</td>
						<td>
							<input type="text" name="addressId" id="addressId" readonly>
						</td>
					</tr>
					<tr>
						<td>firstName</td>
						<td>
							<input type="text" name="firstName" id="firstName">
						</td>
					</tr>
					<tr>
						<td>lastName</td>
						<td>
							<input type="text" name="lastName" id="lastName">
						</td>
					</tr>
					<tr>
						<td>email</td>
						<td>
							<input type="text" name="email" id="email">
						</td>
					</tr>
					<tr>
						<td>userName</td>
						<td>
							<input type="text" name="userName" id="userName">
						</td>
					</tr>
				</table>
				<button id = "btnAddStaff" type="button" class="btn btn-success">스탭 추가</button>
			</form>
		</div>
	</div>
</body>
<script>
	// 
	$('#btnAddStaff').click(function() {
		
		if($('#storeId').val() == null || $('#storeId').val() == ''){
			alert('storeId를 입력하세요');
		} else if($('#firstName').val() == null || $('#firstName').val().length < 3){
			alert('firstName를 입력하세요(3자 이상)');
		} else if($('#lastName').val() == null || $('#lastName').val().length < 3){
			alert('lastName를 입력하세요(3자 이상)');
		} else if($('#email').val() == null || $('#email').val().length<4 || $('#email').val().indexOf('@')){
			alert('email은 4자 이상, @ 포함 되어야 합니다');
		} else if($('#userName').val() == null || $('#userName').val().length < 4){
			alert('userName를 입력하세요(4자 이상)');
		} else {
			$('#addForm').submit
		}
	});
	// 주소 선택 버튼
	$('#btnAddrSel').click(function() {
		console.log($('#resultAddress').val());
		if($('#resultAddress').val() == null || $('#resultAddress').val() =='') {
			alert('주소 선택을 먼저 하세요');
		} else {
			$('#addressId').val($('#resultAddress').val());
		}
	});
	
	$('#btnAddress').click(function(){
		if($('#searchAddress').val() == "") {
			alert('주소 검색어를 입력하세요');
		} else {
			$('#formAddress').submit();
		}
	});
</script>
</html>