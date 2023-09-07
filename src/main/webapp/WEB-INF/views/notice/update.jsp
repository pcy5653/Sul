<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<c:import url="../temp/header.jsp"></c:import>
<link rel="stylesheet" href="/resources/style/reset.css">
<link rel="stylesheet" href="/resources/style/basic.css">
<link href="/resources/css/notice/others.css">
<c:import url="../temp/bootStrap.jsp"></c:import>
<!-- include summernote css/js-->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

</head>
<body>
	
	<section class="container mt-5" style="width: 800px;"> 
	<h1 class="title my-4 text-center" style="font-size:2.5rem;">Update Page</h1>
		<form action="./update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="noticeNum" value="${dto.noticeNum}">
		<input type="hidden" name="fileNum" value="${fileDTOs.fileNum}">
		<div class="mb-3">
		  <label for="subject" class="form-label">SUBJECT</label>
		  <input type="text" name="subject" class="form-control" id="subject" value="${dto.subject}">
		</div>
		
		<div class="mb-3">
		  <label for="name" class="form-label">NAME</label>
		  <input type="text" name="name" readonly value="${member.id}" class="form-control" id="name" value="${dto.name}">
		</div>
		
		<div class="mb-3">
		  <label for="contents" class="form-label"></label>
		  <textarea name="contents" class="form-control" id="contents" placeholder="내용 입력" rows="7">${dto.contents}</textarea>
		</div>
		
		<div id="fileList" class="my-5"></div>
		<c:forEach items="${dto.fileDTOs}" var="f">
			<div>
				<img alt="" src="/resources/upload/notice/${f.fileName}" style="width:100px">
				<a>${f.originalName}</a>
			</div>
		</c:forEach>

		<div class="my-3" >
		<br>
			<a class="btn btn-outline-secondary" href="./list" style="width:80px; background-color: #f1f3f5; float : right; border: 0px;">목록</a>
			<button type="submit" class="btn btn-secondary" style='width:80px; float: left;'>수정</button>
		</div>
	</form>
	<br><br>
</section>

<script type="text/javascript">
	$("#contents").summernote('code');	
	
</script>
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>