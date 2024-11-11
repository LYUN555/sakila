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
			<a href="${pageContext.request.contextPath}/on/storeList">지점 리스트</a>
			<!--
				StoreMapper.selectStoreList():List<Map> - store x staff x address
				StoreService.getStoreList():List<Map>
				GET - /on/storList - StoreController.storeList() - storeList.jsp	
			 -->
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/addStroe">지점 추가</a>
			<!--
				GET - /on/addStore - StoreController.addStor() : staffList 모델추가, search주소검색결과 모델추가 - addStore.jsp
				StoreMapper.insertStore(): Integer
				StoreService.addStore() : Integer
				
				POST - /on/addStore - StoreController.addStore(Store)	
									
			 -->
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
			<a href="${pageContext.request.contextPath}/on/filmList">영화 리스트</a>
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/addFilm">영화 추가</a>
		</li>
		<hr> ::: 언어 관리 :::<hr>		
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/languageList">언어 리스트</a>
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/addLanguage">언어 추가</a>
		</li>
		<hr> ::: 고객 관리 :::<hr>		
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/">고객 리스트</a>
		</li>
		<li class="list-group-item">
			<a href="${pageContext.request.contextPath}/on/">고객 추가</a>
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