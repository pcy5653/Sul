<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add page</title>
<link rel="stylesheet" href="/resources/style/reset.css">
<link rel="stylesheet" href="/resources/style/basic.css">
<link rel="stylesheet" href="/resources/style/detail.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
	#k, .search {margin: 0; padding: 1rem;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
	.addCon{flex-direction: column;margin-top: 2rem;}
</style>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<section id="add_view">
	<div class="wrap">
		<div class="main">
			<h1 id="title">FAQ 작성</h1>
			<form action="./add" method="post" id="frm" class="t_frm add_frm" enctype="multipart/form-data">
				<div class="addD">
					<label for="name" class="add_name addT">작성자</label>
					<input type="text" name="name" class="name_in in" id="writer" value="${member.id}">
				</div>
				<div class="addD">
					<label for="title" class="add_sub addT">문의내역</label>
					<input type="text" name="subject" class="sub_in in" id="subject" placeholder="제목을 작성하세요">
				</div>
				<select name="kind" id="k">
					<option value="operate" class="kind">운영정책</option>
					<option value="member" class="kind">회원/인증</option>
					<option value="buy" class="kind">구매/결제</option>
					<option value="refund" class="kind">교환/환불</option>
				</select>
				<div class="addD addCon">
					<label for="contents" class="add_con addT">내용</label>
					<textarea class="con_in in" name="contents" id="contents"></textarea>
				</div>	
	
				<div class="add_btn">
					<button type="button" class="btn btn-danger" id="btn">게시글 등록</button>
				</div>
			</form>
		</div>
	</div>
</section>	
<c:import url="../temp/footer.jsp"></c:import>
<script src="/resources/js/qna_add.js"></script>
<script src="/resources/js/file.js"></script>
</body>
</html>