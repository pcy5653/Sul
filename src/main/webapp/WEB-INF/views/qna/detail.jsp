<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail Page</title>

<style>
	#title {font-size: 2.5rem; margin-bottom : 2rem;}
	table {border: 1px solid black;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<section>
	<div class="main">
		<h1 id="title">${board} Detail Page</h1>
		<table>
			<thead>
				<th>SUBJECT</th><th>작성자</th><th>날짜</th><th>HIT</th>
			</thead>
			<tbody>
				<tr>
					<td>${dto.subject}</td>
					<td>${dto.name}</td>
					<td>${dto.createDate}</td>
					<td>${dto.hit}</td>
				</tr>			
			</tbody>
		</table>
		<table>
			<tr><td>내용</td></tr>
			<tr><td>${dto.contents}</td></tr>
		</table>
		

		<div>
			<c:forEach items="${dto.fileDTOs}" var="f">
				<img class="fileImg" data-file-num="${f.fileNum}">${f.originalName}</img>
			</c:forEach>
		</div>
		
		
		<form id="frm" action="">
			<input type="hidden" name="num" value="${dto.num}">
		</form>
		
		
		<!-- <a href="./update?num=${dto.num}" class="btn btn-danger">수정</a> -->
		<!-- 입력 form으로 method GET -->
		<button id="update" class="c1" data-url="update">수정</button>
		
		
		<!-- parameterName = data-delete-name 속성에 넣기 -->
		<!-- method POST -->
		<input type="hidden" data-url="delete" data-delete-name="name" data-delete-num="${member.id}">
		<button id="del" class="c1" data-url="delete" data-delete-name="num" data-delete-num="${dto.num}">삭제</button>
		


		<c:if test="${board ne 'notice'}">
			<!-- <a href="./reply?num=${dto.num}" class="btn btn-danger">답글달기</a> -->
			<!-- 입력 form으로 method GET -->
			<button id="reply" class="c1" data-url="reply">답글</button>
		</c:if>
	</div>
</section>
<c:import url="../temp/footer.jsp"></c:import>
<script src="/resources/js/qna_delete.js"></script>
</body>
</html>