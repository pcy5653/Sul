<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail Page</title>

<style>
	section {text-align: center;}
	#title {font-size: 2.5rem; margin-bottom : 2rem;}
	table {border: 1px solid black;}
</style>

</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<section>
	<div class="main">
		<h1 id="title">${board} Detail Page</h1>
	<!-- Getter 이름 : 메서드에서 get을 제외하고 첫번째글자를 소문자로 바꾼것 -->
	<!-- DB & GETTER 이름 동일 -->
	
		<table>
			<thead>
				<th>SUBJECT</th><th>작성자</th><th>날짜</th><th>HIT</th>
			</thead>
			<tbody>
				<!-- Controller에서 속성명=items를 해서  -->
				<tr>
					<td>${dto.subject}</td>
					<td>${dto.name}</td>
					<td>${dto.createDate}</td>
					<td>${dto.hit}</td>
				</tr>			
				<tr><td colspan=4>${dto.contents}</td></tr>
			</tbody>
		</table>
		

<%-- 		<div>
			<!-- Controller에서 작성한 키 이름과 동일하게 적기 -->
			<c:forEach items="${dto.fileDTOs}" var="f">
				<a href="./fileDown?fileNum=${f.fileNum}">${f.originalName}</a>
			</c:forEach>
		</div>
		 --%>
		
		<form id="frm">
			<input type="hidden" name="num" value="${dto.num}">
		</form>
		
		
		<a href="./update?num=${dto.num}" class="btn btn-danger">수정</a>
		<!-- 입력 form으로 method GET -->
		<!-- <button id="update" class="c1" data-url="update">수정</button> -->
		
		<!-- parameterName = data-delete-name 속성에 넣기 -->
		<!-- method POST -->
		<input type="hidden" data-url="delete" data-delete-name="name" data-delete-num="${member.id}">
		<button id="del"  class="c1" data-url="delete" data-delete-name="num" data-delete-num="${dto.num}">삭제</button>


		<c:if test="${board ne 'notice'}">
			<!-- <a href="./reply?num=${dto.num}" class="btn btn-danger">답글달기</a> -->
			<!-- 입력 form으로 method GET -->
			<button id="reply" class="btn btn-danger c1" data-url="reply">답글</button>
		</c:if>
	</div>
</section>
<c:import url="../temp/footer.jsp"></c:import>
<!-- <script src="../resources/js/delete.js"></script> -->
</body>
</html>