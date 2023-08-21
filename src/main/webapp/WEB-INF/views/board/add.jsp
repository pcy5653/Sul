<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<c:if test="${empty member}">
	<script type="text/javascript">
		alert("로그인이 필요합니다.");
		location.href="../member/login";
	</script>	
</c:if>

<c:import url="../temp/bootStrap.jsp"></c:import>
</head>
<body>

	<section class="container mt-5">
	<h1 class="my-4 text-center">Add Page</h1>
		<form action="./add" method="post" id="frm" enctype="multipart/form-data">
			<div class="mb-3">
				<label for="subject" class="form-label">SUBJECT</label>
				<input type="text" name="subject" class="form-control" id="subject" placeholder="제목을 입력하세요.">
			</div>
			
			<div class="mb-3">
				<label for="name" class="form-label">NAME</label>
				<input type="text" name="name" class="form-control" id="name" readonly value="${member.id}">
			</div>
			
			<div class="mb-3">
				<label for="contents" class="form-label">CONTENTS</label>
				<textarea class="form-control" name="contents" id="contents" rows="15" placeholder="내용을 입력하세요."></textarea>
			</div>
			
			<div class="mb-3">
				<button type="button" class="btn btn-primary" id="add">File추가</button>
			</div>
			
			<div id="fileList" class="my-5"></div>
			
			<div class="my-3">
				<a class="btn btn-outline-secondary" href="./list">BACK</a>
				<button type="button" id="btn" class="btn btn-secondary">작성완료</button>
			</div>
		</form>
	</section>
	<script src="../resources/js/file.js"></script>
	<script>
		const btn = document.getElementById("btn");
		const subject = document.getElementById("subject");
		const frm = document.getElementById("frm");

		btn.addEventListener("click",function(){
			console.log(subject.value=="");
			console.log(subject.value.length == 0);
			if(subject.value==""){
				alert("제목은 필수입니다.");
				subject.focus();
			}else{
				frm.submit();
			}
		})
	</script>

</body>
</html>