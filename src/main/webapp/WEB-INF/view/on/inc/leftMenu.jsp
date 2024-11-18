<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<ul class="list-group text-center">
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/main">홈으로</a>
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/staffOne">${loginStaff.username}님</a>
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/logout">로그아웃</a>
		</li>
		<hr> ::: 지점&인벤토리관리 :::<hr>		
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/storeList">지점 리스트</a>
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/addStore">지점 추가</a>
		</li>
		<hr> ::: STAFF 관리 :::<hr>		
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/staffList">스탭 리스트</a>
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/addStaff">스탭 추가</a>
		</li>
		<hr> ::: 영화 관리 :::<hr>		
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/categoryList">카테고리 리스트</a>
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/addCategory">카테고리 추가</a>
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/filmList">영화 리스트</a>
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/addFilm">영화 추가</a>
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/languageList">언어 리스트</a>
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/addLanguage">언어 추가</a>
		</li>
		<hr> ::: 고객 관리 :::<hr>		
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/customerList">고객 리스트</a>
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/addCustomer">고객 추가</a>
		</li>
		<hr> ::: 배우 관리 :::<hr>		
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/actorList">배우 리스트</a>
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/addActor">배우 추가</a>
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/addActor">통계</a>
		</li>
	</ul>
</div>