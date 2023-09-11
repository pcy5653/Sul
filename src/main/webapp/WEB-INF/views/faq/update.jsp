<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update page</title>
<link rel="stylesheet" href="/resources/style/reset.css">
<link rel="stylesheet" href="/resources/style/basic.css">
<link rel="stylesheet" href="/resources/style/detail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>

<body>
<c:import url="../temp/header.jsp"></c:import>
	<section id="add_view">
		<div class="wrap">
			<div class="main">
				<h1 id="title">FAQ 수정</h1>
		
				<form action="./update" class="add_frm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="num" value="${dto.num}">
					<div class="addD">
						<label class="add_name addT" for="writer">작성자</label>
						<input id="writer" class="name_in in" type="text" name="name" value="${member.id}" class="form-control">
					</div>
					<div class="addD">
						<label class="add_sub addT" for="subject">FAQ 제목</label>
						<input id="subject" class="sub_in in" type="text" name="subject" value="${dto.subject}" class="form-control">
					</div>
					<div class="addD upCon">
						<label class="add_con addT" for="contents">FAQ 내용</label>
						<textarea id="contents" name="contents" class="con_in in">${dto.contents}</textarea>
					</div>
	
					<div class="add_btn updateBtn">
						<button type="submit" class="btn btn-dark upbtn" >수정 완료</button>
					</div>
				</form>   
			</div>
		</div>
	</section>
<c:import url="../temp/footer.jsp"></c:import>
<script src="/resources/js/file.js"></script>
</body>
</html>