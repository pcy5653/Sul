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
			<h1 id="title">1:1 문의하기</h1>
			<form action="./add" method="post" id="frm" class="t_frm add_frm" enctype="multipart/form-data">
				<div class="addD">
					<label for="name" class="add_name addT">작성자</label>
					<input type="text" name="name" class="name_in in" id="writer" value="${member.id}">
				</div>
				<div class="addD">
					<label for="title" class="add_sub addT">문의내역</label>
					<input type="text" name="subject" class="sub_in in" id="subject" placeholder="제목을 작성하세요">
				</div>
				<div class="addD addCon">
					<label for="contents" class="add_con addT">내용</label>
					<textarea class="con_in in" name="contents" id="contents"></textarea>
				</div>	
				
				<div id="files">
					<div class="addF">
						<button type="button" id="add" class="add_file">File 추가</button>
					</div>
					<div id="fileList"></div>
				</div>
	
				<div class="add_btn">
					<div class="phone_total">
						<span>
							<span class="material-icons">email</span>
							답변이 작성되면 알려드립니다.
						</span><br>
						<span class="sms">SMS 발송 여부를 체크해주세요!</span><br>
						<div class="smsCheck">
							<label for="sms_yes">YES</label>
							<input type="radio" id="sms_yes" name="sms" value="1" checked>
							<label for="sms_no">NO</label>
							<input type="radio" id="sms_no" name="sms" value="0"><br>
						</div>	
					</div>
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