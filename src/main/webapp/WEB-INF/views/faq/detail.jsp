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
			<h1 id="title">상세 문의</h1>
			<!-- files!=null이 아니라면 -->
			<table>
				<c:forEach items="${list}" var="dto" varStatus="i">
					<tr>
						<td class="listTitle"  data-num="${dto.num}"name="num" >
							<input type="hidden" value="${dto.num}"  name="ref" class="listRef">
							<a href="#">
								<span class="faqQ">Q.</span>
								${dto.subject}
							</a>
						</td>
						<td>${dto.kind}</td>
						<td><button id="underBtn">+</button></td>
					</tr>
					<tr><td>${dto.contents}</td></tr>
				</c:forEach>
			</table>
			
			
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