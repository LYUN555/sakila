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
			<h1>FILM LIST</h1>
			<!-- 카테코리 선택 -->
			<form id="formCategory" action="${pageContext.request.contextPath}/on/filmList" method = "get">
				<select name = "categoryId" id = "categoryId">
					<option value = "0">전체</option>
					<c:forEach var="c" items="${categoryList}">
						<c:if test="${c.categoryId == currentCategoryId}">
							<option selected value="${c.categoryId}">${c.name}</option>
						</c:if>
						<c:if test="${c.categoryId != currentCategoryId}">
							<option value="${c.categoryId}">${c.name}</option>
						</c:if>
					</c:forEach>
				</select>
			</form>
			<br>
			<table class= "table table-striped">
				<tr>
					<td>filmId</td>
					<td>title</td>
					<td>releaseYear</td>
					<td>rentalDuration</td>
					<td>rentalRate</td>
					<td>length</td>
					<td>replacementCost</td>
					<td>rating</td>
				</tr>
				<c:forEach var="f" items="${filmList}">
					<tr>
						<td>${f.filmId}</td>
						<td>
							<a href="${pageContext.request.contextPath}/on/filmOne?filmId=${f.filmId}">
								${f.title}
							</a>
						</td>
						<td>${f.releaseYear}</td>
						<td>${f.rentalDuration}</td>
						<td>${f.rentalRate}</td>
						<td>${f.length}</td>
						<td>${f.replacementCost}</td>
						<td>${f.rating}</td>
					</tr>
				</c:forEach>
			</table>
		<div>
			<nav aria-label="Page navigation">
			    <ul class="pagination justify-content-center">
			    
			        <li class="page-item">
			            <a class="page-link" href="${pageContext.request.contextPath}/on/filmList?currentPage=1&categoryId=${currentCategoryId}&searchFilm=${searchFilm}">첫 페이지</a>
			        </li>
			        
			        <c:if test="${startPage > 10}">
			            <li class="page-item">
			                <a class="page-link" href="${pageContext.request.contextPath}/on/filmList?currentPage=${startPage - 10}&categoryId=${currentCategoryId}&searchFilm=${searchFilm}">이전</a>
			            </li>
			        </c:if>
			        <c:if test="${startPage < 10}">
			            <li class="page-item disabled">
			                <a class="page-link" href="#">이전</a>
			            </li>
			        </c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
		                <c:if test="${i <= lastPage}">
		                    <li class="page-item">
		                        <a class="page-link" href="${pageContext.request.contextPath}/on/filmList?currentPage=${i}&searchFilm=${searchFilm}">${i}</a>
		                    </li>
		                </c:if>
		            </c:forEach>
			        <c:if test="${startPage + 10 < lastPage}">
			            <li class="page-item">
			                <a class="page-link" href="${pageContext.request.contextPath}/on/filmList?currentPage=${startPage + 10}&categoryId=${currentCategoryId}&searchFilm=${searchFilm}">다음</a>
			            </li>
			        </c:if>
			        <c:if test="${startPage + 10 > lastPage}">
			            <li class="page-item disabled">
			                <a class="page-link" href="#">다음</a>
			            </li>
			        </c:if>
			
			        <li class="page-item">
			            <a class="page-link" href="${pageContext.request.contextPath}/on/filmList?currentPage=${lastPage}&categoryId=${currentCategoryId}&searchFilm=${searchFilm}">마지막</a>
			        </li>
			    </ul>
			</nav>
		</div>
		<div>
			<form id="formSearchFilm" method="get" action="${pageContext.request.contextPath}/on/filmList">
				<input type="text" name="searchFilm" id = "searchFilm" value="${searchFilm}">
				<button id="btnSearchFilm" type="button" class="btn btn-success">영화검색</button>
			</form>
		</div>
		</div>
	</div>
</body>
<script>
	$('#categoryId').change(function() {
		//alert('change');
		$('#formCategory').submit();
	});
	$('#btnSearchFilm').click(function() {
		if($('#searchFilm').val()== ''){
			alert('검색어를 입력해주세요');
			return;
		}
		$('#formSearchFilm').submit();
	});
</script>
</html>