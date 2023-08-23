<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/style/detail.css">
<title>${board} List</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<section>
		<div class="wrap">
			<div class="main">
				<h1 id="title">1:1 문의 내역</h1>
				<table>
					<thead>
						<tr>
							<th>문의내역</th><th>문의일</th><th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="dto" varStatus="i">
							<tr>
								<td><a href="./detail?num=${dto.num}">${dto.subject}</a></td>
								<td>${dto.createDate}</td>
								<td>${dto.hit}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<nav class="t_page">
				<ul class="pagination">
					<c:if test="${pager.pre}">
					<li class="page-item">
						<a class="move" href="#" data-num="${pager.startNum-1}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item "><a class="page-link move" href="#" data-num="${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${pager.next}">
					<li class="page-item">
						<a class="move" href="#" data-num="${pager.lastNum+1}" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				</ul>
			</nav>

			<div class="t_search">
				<form action="./list" method="get" id="frm" class="t_frm">
					<input type="hidden" id="page" value="${pager.page}" name="page">
					<!-- parameter(name,value) -->
					<select name="kind" id="k" data-kind="${pager.kind}">
						<option value="title" class="kind" data-list-name="kind" data-list="${pager.kind}">문의내역</option>
						<option value="contents" class="kind">내용</option>
					</select>
					<!-- parameter -->
					<input type="text" name="search" value="${pager.search}" class="search">
					<div class="t_btn">
						<button type="submit" class="s_btn">검색</button>
					</div>
				</form>
				<c:if test="${not empty member}">
					<a class="btn btn-danger" href="./add">게시물 등록</a>
				</c:if>
			</div>
		</div>
    </section>
    
    
    
	<c:import url="../temp/footer.jsp"></c:import>
	<script src="/resources/js/qna_list.js"></script>
</body>
</html>