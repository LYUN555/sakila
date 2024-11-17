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
			<h1>ADD CATEGORY</h1>
			<form id="formAddCategory" method="post" action="${pageContext.request.contextPath}/on/addCategory">
				<table class="table table-striped">
					<tr>
						<td>category</td>
						<td><input type = "text" name="name" id="name"></td>
					</tr>
				</table>
				<button id="btnAddCategory" type="button" class ="btn btn-success">추가</button>
			</form>
		</div>
	</div>
</body>
<script>
	$('#btnAddCategory').click(function() {
		if($('#name').val() == '' || $('#name').val().length < 4){
			alert('카테고리를 입력해주세요(4자 이상)');
			return;
		}
		$('#formAddCategory').submit();
	});
</script>
</html>