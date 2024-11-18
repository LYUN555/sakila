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
			<h1>ADD INVENTORY</h1>
			<div>
				<form id="formSearchWord" metod="get" action="${pageContext.request.contextPath}/on/addInventory">
					<input type ="hidden" name="storeId" value="${storeId}">
					<input type = "text" name="searchWord" id="searchWord" value="${searchWord}">
					<button id="btnSearchWord" type="button">검색</button>
				</form>
			</div>

			<div>
				<form id="formAddInventory" method="post" action="${pageContext.request.contextPath}/on/addInventory">
					<table class="table table-striped">
						<tr>
							<td>storeId</td>
							<td><input type="text" name="storeId" value="${storeId}"readonly></td>
						</tr>
						<tr>
							<td>filmId</td>
							<td>
								<select size="5" name="filmId" id ="filmId">
									<c:forEach var="f" items="${filmList}">
										<option value="${f.filmId}">${f.title}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</table>	
					<button id="btnAddInventory" type="button">추가</button>		
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	$('#btnSearchWord').click(function() {
		if($('#searchWord').val() == '' || $('#searchWord').val().length<1){
			alert('제목을 입력하세요');
			return;
		}
		$('#formSearchWord').submit();
	});
	
	$('#btnAddInventory').click(function() {
		if($('#filmId').val() == null){
			alert('영화를 선택하세요');
			return;
		}
		$('#formAddInventory').submit();
	});
</script>
</html>