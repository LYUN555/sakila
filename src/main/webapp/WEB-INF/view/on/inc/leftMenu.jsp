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
		<hr> ::: 지점관리 :::<hr>		
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/logout">지점 리스트</a>
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/logout">지점 추가</a>
		</li>
		<hr> ::: STAFF 관리 :::<hr>		
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/staffList">스탭 리스트</a>
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/addStaff">스탭 추가</a>
		</li>
		<hr> ::: 고객 관리 :::<hr>		
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/logout">고객 리스트</a>
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/logout">고객 추가</a>
		</li>
	</ul>
</div>