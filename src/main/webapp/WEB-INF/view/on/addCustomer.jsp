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
			<h1>ADD CUSTOMER</h1>
			<div>
				<!-- 주소 검색 -->
				<form id="formSearchAddress" method="get" action="${pageContext.request.contextPath}/on/addCustomer">
					<input type="text" name="searchWord" id="searchWord" value="${searchWord}">
					<button id="btnSearchAddress" type="button" class="btn btn-success">주소 검색</button>
				</form>
			</div>
			<div>
				<!-- 고객 입력폼 -->
				<form id="formAddCustomer" method="post" action="${pageContext.request.contextPath}/on/addCustomer">
					<table class="table table-striped">
						<tr>
							<td>address</td>
							<td>
								<select name="addressId" id="addressId">
									<option value="">:::주소선택:::</option>
									<c:forEach var="a" items="${addressList}">
										<option value="${a.addressId}">(${a.addressId}) ${a.address}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>store</td>
							<td>
								<select name="storeId" id="storeId">
									<option value="">:::선택:::</option>
									<c:forEach var="s" items="${storeList}">
										<option value="${s.storeId}">${s.storeId}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>firstName</td>
							<td><input type = "text" name="firstName" id="firstName"></td>
						</tr>
						<tr>
							<td>lastName</td>
							<td><input type = "text" name="lastName" id="lastName"></td>
						</tr>
						<tr>
							<td>email</td>
							<td><input type = "text" name="email" id="email"></td>
						</tr>
					</table>
					<button id="btnAddCustomer" type="button" class="btn btn-success">추가</button>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	$('#btnSearchAddress').click(function() {
		if($('#searchWord').val() == ''){
			alert('검색어를 입력해주세요');
			return;
		}
		$('#formSearchAddress').submit();
	});
	
	$('#btnAddCustomer').click(function() {
		if($('#addressId').val() == '') {
			alert('주소를 선택해주세요');
		} else if($('#storeId').val() == '') {
			alert('storeId를 선택해주세요');
		} else if($('#firstName').val() == '' || $('#firstName').val().length<3) {
			alert('firstName을 입력해주세요');
		} else if($('#lastName').val() == '' || $('#lastName').val().length<3) {
			alert('lastName을 입력해주세요');
		} else if($('#email').val() == '' || $('#email').val().length<4 && $('#email').val().indexOf('@') == -1) {
			alert('email 입력해주세요');
		} else {
			$('#formAddCustomer').submit();
		}
	});
</script>
</html>