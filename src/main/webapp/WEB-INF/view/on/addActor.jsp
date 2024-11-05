<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <meta charset="UTF-8">
    <title>배우 추가</title>
</head>
<body class="container-fluid">
    <div class="row">
        <div class="col-sm-2 bg-light">
            <!-- leftMenu.jsp include -->
            <c:import url="/WEB-INF/view/on/inc/leftMenu.jsp"></c:import>
        </div>
        
        <div class="col-sm-10">
            <!-- main content -->
            <h1 class="text-center my-4">배우 추가</h1>
            <form id="formActor" method="post" action="${pageContext.request.contextPath}/on/addActor" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="firstName" class="form-label">First Name</label>
                    <input type="text" name="firstName" id="firstName" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="lastName" class="form-label">Last Name</label>
                    <input type="text" name="lastName" id="lastName" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">파일 업로드</label>
                    <div id="fileDiv">
                        <div><button type="button" id="btnAddFile" class="btn btn-success mb-3">파일 추가</button></div>
                        <button type="button" id="btnRemoveFile" class="btn btn-danger mb-3">파일 삭제</button>
                    </div>
                </div>
                <button type="button" id="btnAddActor" class="btn btn-primary">배우 추가</button>
            </form>
        </div>
    </div>
</body>
<script>
    $('#btnAddActor').click(function() {
        if ($('#firstName').val() == '' || $('#lastName').val() == '') {
            alert('이름을 입력하세요');
        } else if ($('.actorFile').length > 0 && $('.actorFile').last().val() == '') {
            alert('첨부되지 않은 파일이 있습니다');
        } else {
            $('#formActor').submit();
        }
    });

    $('#btnAddFile').click(function() {
        if ($('.actorFile').last().val() == '') {
            alert('첨부하지 않은 파일이 존재합니다');
        } else {
            let html = '<input type="file" name="actorFile" class="form-control actorFile mb-2">';
            $('#fileDiv').append(html);
        }
    });

    $('#btnRemoveFile').click(function() {
        if ($('.actorFile').length == 0) {
            alert('삭제할 빈 input=file이 존재하지 않습니다');
        } else {
            $('.actorFile').last().remove();
        }
    });
</script>
</html>