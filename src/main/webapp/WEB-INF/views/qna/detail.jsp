<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/style/reset.css">
<link rel="stylesheet" href="/resources/style/basic.css">
<link rel="stylesheet" href="/resources/style/detail.css">
<title>Detail Page</title>
<base href="/">
<style>
	#title {font-size: 2.5rem; margin-bottom : 2rem;}
	table {border: 1px solid black;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<section>
		<div class="wrap">
			<input type="hidden" value="${member.roleNum}" id="role" name="roleNum">
			<h1 id="title">상세 문의</h1>
			<div id="question" data-step="${dto.qnaDTO.step}" data-con="${dto.qnaDTO.contents}" data-num = "${dto.qnaDTO.num}">
				<!-- 질문내용 -->
			</div>
			<table id="comment" data-step="${dto.step}">
				<thead>
					<th class="subject">SUBJECT</th><th class="name">작성자</th><th class="date">날짜</th>
				</thead>
				<tbody>
					<tr>
						<td>${dto.subject}</td>
						<td>${dto.name}</td>
						<td>${dto.createDate}</td>
					</tr>			
				</tbody>
			</table>
			<table>
				<tr><th class="dcont">내용</th></tr>
				<tr class="dcont"><td class="dcon">${dto.contents}</td></tr>
			</table>
			<div id="detail_file">
				<c:forEach items="${dto.fileDTOs}" var="f">
					<img src="/resources/upload/qna/${f.fileName}" class="fileImg" data-file-num="${f.fileNum}"></img>
				</c:forEach>
			</div>
			
			
			<form id="frm" action="">
				<input type="hidden" name="num" value="${dto.num}">
			</form>
			
			<div class="btn_total">
				<!-- 입력 form으로 method GET -->
				<button id="update" class="c1 upBtn" data-url="qna/update">수정</button>
				
				<!-- method POST -->
				<input type="hidden" data-url="qna/delete" data-delete-name="name" data-delete-num="${member.id}">
				<button id="del" class="c1 deBtn" data-url="qna/delete" data-delete-name="num" data-delete-num="${dto.num}">삭제</button>
				
				<!-- 입력 form으로 method GET -->
				<button id="reply" class="c1 reBtn" data-url="qna/reply">답글</button>
			</div>
		</div>
	</section>
<c:import url="../temp/footer.jsp"></c:import>
<script src="/resources/js/qna_delete.js"></script>
</body>
</html>