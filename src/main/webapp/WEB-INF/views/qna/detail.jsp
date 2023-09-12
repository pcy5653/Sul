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
	#title {font-size: 2.5rem; margin-bottom : 2rem;font-weight: 900;}
	table {border: 1px solid black;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	
	<section>
		<div class ="wrap">
			<input type="hidden" value="${member.roleNum}" id="role" name="roleNum">
			<input type="hidden" id="detailNum" value="${dto.num}" data-step="${dto.step}">
			<h1 id="title">상세 문의</h1>
			<!-- files!=null이 아니라면 -->
			<c:if test="${files!=null}">
				<div id="question" data-step="${dto.qnaDTO.step}" data-con="${dto.qnaDTO.contents}" data-num = "${dto.qnaDTO.num}">
					<table>
						<tr><th id="queCus">고객님의 질문</th></tr>
						<tr><td>${dto.qnaDTO.contents}</td></tr>
					</table>
					
					<c:forEach items="${files}" var="f" begin="0" end="2">
						<img src="/resources/upload/qna/${f.fileName}" alt="고객의 파일이미지">
					</c:forEach>
				</div>
			</c:if>
			
			<table id="comment" data-step="${dto.step}">
				<thead>
					<th class="subject">제목</th><th class="name">작성자</th><th class="date">날짜</th>
				</thead>
				<tbody>
					<tr>
						<td>${dto.subject}</td>
						<td>${dto.name}</td>
						<td>${dto.createDate}</td>
					</tr>			
				</tbody>
			</table>
			
			<table id="commentCon">
				<tr><th class="dcont">내용</th></tr>
				<tr class="dcont"><td class="dcon">${dto.contents}</td></tr>
			</table>
			<div id="detail_file" data-file="${dto.fileDTOs}">
				<c:forEach items="${dto.fileDTOs}" var="f">
					<img src="/resources/upload/qna/${f.fileName}" class="fileImg" data-file-num="${f.fileNum}">
				</c:forEach>
			</div>
			
			
			<form id="frm" action="">
				<input type="hidden" name="num" value="${dto.num}">
			</form>
			
			<div class="btn_total">
				<c:if test="${dto.step != 1}">
					<!-- 입력 form으로 method GET -->
					<button id="update" class="c1 upBtn" data-url="qna/update">수정</button>
					
					<!-- method POST -->
					<input type="hidden" data-url="qna/delete" data-delete-name="name" data-delete-num="${member.id}">
					<button id="del" class="c1 deBtn" data-url="qna/delete" data-delete-name="num" data-delete-num="${dto.num}">삭제</button>

					<!-- 입력 form으로 method GET -->
				<button id="reply" class="c1 reBtn" data-url="qna/reply">답글</button>
				</c:if>
			</div>
		</div>
	</section>
<c:import url="../temp/footer.jsp"></c:import>
<script src="/resources/js/qna_delete.js"></script>
</body>
</html>