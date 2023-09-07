<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/notice/list.css">
<link rel="stylesheet" href="/resources/style/detail.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/ScrollTrigger.min.js"></script>
<script src="/resources/js/main.js"></script>
<c:import url="../temp/header.jsp"></c:import>

</head>

<body>

	<section id="container" class="wrap">
		
		<div class="title" style="margin-right: 20px; margin-bottom: 50px;"> 
			<img alt="" src="/resources/images/notice/notice.png" style="width: 50px;" height="50px;"> 공지사항
		</div>
	
		<table class="tb">
	
		<thead class="head">
			<th width=10%>NO</th>
			<th width=50%>제목</th>
			<th width=15%>작성자</th>
			<th width=15%>작성일</th>
			<th width=10%>조회수</th>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="d" varStatus="i">
			
			<tr class="body">
				<td>${d.noticeNum}</td>
				<td><a href="./detail?noticeNum=${d.noticeNum}" class="">${d.subject}</a></td>
				<td>${d.name}</td>
				<td>${d.createDate}</td>
				<td>${d.hit}</td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
		
	<!-- 페이지 번호 -->
	<br>
	<nav >
	  <ul class="" style="text-align: center; height: 50px; margin-top: 20px; margin-left: 340px;">
	  <c:if test="${pager.pre}">
	      <a class="" href="./list?page=${pager.startNum-1}&kind=${param.kind}&search=${param.search}" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	   </c:if>
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">		    
		    	<a class="" href="./list?page=${i}&kind=${param.kind}&search=${param.search}" style="margin-left: 20px;">${i}</a>
			</c:forEach>
		<c:if test="${pager.next}">
		  	   	<a class="" href="./list?page=${pager.lastNum+1}&kind=${param.kind}&search=${param.search}" aria-label="Next">
		    	<span aria-hidden="true">&nbsp;&raquo;</span>
		      	</a>
		   </c:if>
	   <!-- 검색창 -->	
		<form action="./list" method="get" style="width: 20%; float: right; margin-right: 200px;">
			<div id="frm" style="width: 300px;">
				  <input type="hidden" value="${pager.page}" id="page" name="page">
				    <!-- 파라미터 이름 kind -->
				  <select name="kind" id="k" class="search">
					  <option class="kind" value="subject">제목</option>
					  <option class="kind" value="contents">내용</option>
				  </select>
				  
				  <input type="text" name="search" value="${pager.search}" class="search" placeholder="검색어를 입력하세요." style="text-align: center;">
				  <button class="button" type="submit" id="button-addon2" style="float: right;">
				  	<img alt="" src="/resources/images/search.png" style="width: 20px; height: 20px;">
				  </button>
			</div>
	  	   
		</form>
		 </ul>
		<c:if test="${member.roleNum == 1}">
			<a class="btn btn-outline-secondary" href="./add" style="float: right; margin-right: 100px; background-color: #f1f3f5">Add</a><br><br>				
		</c:if>
	 </nav>
</section>
</div>
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>