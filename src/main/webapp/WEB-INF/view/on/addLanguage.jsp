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
<body class="container-flud">
	<div class="row">
		<div class="col-sm-2 bg-light">
			<!-- leftMenu.jsp include -->
			<c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
		</div>
		
		<div class="col-sm-10">
			<!-- main content -->
			<h1>ADD LANGUAGE</h1>
			<form id= "formAddLanguage" method="post" action="${pageContext.request.contextPath}/on/addLanguage">
				<table class ="table table-bordered" style="width: 80%">
					<tr>
						<td>language</td>
						<td><input type = "text" id = "name" name = "name" required></td>
					</tr>
				</table>
				<button id ="btnAddLanguage" type = "button" class ="btn btn-success">언어 추가</button>
			</form>
		</div>
	</div>
</body>
<script>
	$('#btnAddLanguage').click(function() {
		let language = $('#name').val();
		if(language == null || language == ''){
			alert('언어를 입력하세요');
			return;
		}
		$('#formAddLanguage').submit();
	});
</script>
</html>