<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="d-flex justify-content-center align-items-center vh-100 bg-light">
	<div class="card" style="width: 40rem; height: 30rem;">
        <div class="card-body">
            <h5 class="card-title text-center">Staff Login</h5>
            <div class="text-danger text-center mt-2">${msg}</div>
            <form action="${pageContext.request.contextPath}/off/login" method="post">
                <div class="mb-3">
                    <label for="staffId" class="form-label">Staff ID:</label>
                    <input type="text" class="form-control" id="staffId" name="staffId">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>
                <button type="submit" class="btn btn-success w-100">로그인</button>
            </form>
    		 <hr class="my-4">
            <button type="submit" class="btn btn-primary w-100">회원가입</button>
        </div>
    </div>
</body>
</html>