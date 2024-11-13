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
			<h1>ADD STORE</h1>
			
			<h2>주소 검색</h2>
			<form id="formAddress" action="${pageContext.request.contextPath}/on/addStore" method="get">
				<input type="text" name="searchAddress" id="searchAddress">
				<button type="submit" id="btnAddress" class="btn btn-success">주소검색</button>
			</form>

			<h2>검색된 주소 목록</h2>
			<select id="resultAddress" name="addressId" >
				<c:forEach items="${addressList}" var="a">
					<option value="${a.addressId}">(ADDRESS ID: ${a.addressId}) ${a.address}</option>
				</c:forEach>
			</select>
			<button type="button" id="btnAddrSel" class="btn btn-success">주소선택</button>
			
			<h2>매니져 선택</h2>
			
			<form id ="formAddStore" method ="post" action="${pageContext.request.contextPath}/on/addStore">
				<table class = "table table-bordered" style="width: 80%">
					<tr>
						<td>addressId</td>
						<td>
							<input type="text" name="addressId" id="addressId" readonly>
						</td>
					</tr>
					<tr>
						<td>managerStaffId</td>
						<td>
							<select id="managerStaffId" name="managerStaffId" >
							<option value="">:::선택:::</option>
								<c:forEach items="${storeList}" var="s">
									<option value="${s.managerStaffId}">${s.managerStaffId}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
				</table>
				<button id = "btnAddStore" type="button" class="btn btn-success">스토어 추가</button>
			</form>
		</div>
	</div>
</body>
<script>
	// 주소 검색
	$('#btnAddress').click(function() {
		if($('#searchAddress').val() == "") {
			alert('주소 검색어를 입력하세요');
		} else {
			$('#formAddress').submit();
		}
	});
	// 주소 선택
	$('#btnAddrSel').click(function() {
		let result = $('#resultAddress').val();
		if(result == null || result ==''){
			alert('주소 선택을 먼저 하세요');
			return;
		}
		$('#addressId').val(result);
	});
	// store 추가
	$('#btnAddStore').click(function() {
		if($('#addressId').val() == null || $('#addressId').val() == ''){
			alert('주소를 입력하세요');
		} else if($('#managerStaffId').val() == null || $('#managerStaffId').val() == ''){
			alert('매니저를 선택하세요');
		} else{
			$('#formAddStore').submit();
		}
	});
</script>
</html>