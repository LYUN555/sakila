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
			<h1>ACTOR LIST</h1>
			<table class="table table-striped">
				<tr>
					<td>actorId</td>
					<td>name</td>
				</tr>
				<c:forEach var="a" items="${actorList}">
					<tr>
						<td>${a.actorId}</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/actorOne?actorId=${a.actorId}">
								${a.firstName} ${a.lastName}
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			<form id="formSearch" action="${pageContext.request.contextPath}/on/actorList" method="get">
				<input type="text" name="searchWord" id="searchWord" value="${searchWord}">
				<button id="btnSearch" class="btn btn-success">이름검색</button>
			</form>
		</div>
		<div>
			<nav aria-label="Page navigation">
			    <ul class="pagination justify-content-center">
			    
			        <li class="page-item">
			            <a class="page-link" href="${pageContext.request.contextPath}/on/actorList?currentPage=1&searchWord=${searchWord}">첫 페이지</a>
			        </li>
			        
			        <c:if test="${currentPage > 1}">
			            <li class="page-item">
			                <a class="page-link" href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
			            </li>
			        </c:if>
			        <c:if test="${currentPage <= 1}">
			            <li class="page-item disabled">
			                <a class="page-link" href="#">이전</a>
			            </li>
			        </c:if>
					<li class="page-item">
		                <span class="page-link">${currentPage}</span>
		            </li>
			        <c:if test="${currentPage < lastPage}">
			            <li class="page-item">
			                <a class="page-link" href="${pageContext.request.contextPath}/on/actorList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
			            </li>
			        </c:if>
			        <c:if test="${currentPage >= lastPage}">
			            <li class="page-item disabled">
			                <a class="page-link" href="#">다음</a>
			            </li>
			        </c:if>
			
			        <li class="page-item">
			            <a class="page-link" href="${pageContext.request.contextPath}/on/actorList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>
			        </li>
			    </ul>
			</nav>
		</div>
	</div>
</body>
<script>
	$('#btnSearch').click(function(){
		if($('#searchWord').val() == '') {
			alert('검색어를 입력하세요');
			return;
		} 
		$('#formSearch').submit();
	});
</script>
</html>