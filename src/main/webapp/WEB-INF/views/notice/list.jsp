<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<c:import url="../temp/bootStrap.jsp"></c:import>
</head>

<body>
	
	<section class="container mt-5">
	
		<h1 class="mb-3 text-center">공지사항</h1> <br><br>
	
		<table class="table">
	
		<thead>
			<th scope="col" width=10%>NO</th>
			<th scope="col" width=50%>SUBJECT</th>
			<th scope="col" width=15%>NAME</th>
			<th scope="col" width=15%>DATE</th>
			<th scope="col" width=10%>HIT</th>
		</thead>
		<tbody class="table-group-divider">
		<c:forEach items="${list}" var="d" varStatus="i">
			
			<tr>
				<td>${d.num}</td>
				<td><a href="./detail?num=${d.num}" class="link-offset-2 link-underline link-underline-opacity-0 text-black">${d.subject}</a></td>
				<td>${d.name}</td>
				<td>${d.createDate}</td>
				<td>${d.hit}</td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
		
	<!-- 페이지 번호 -->
	<br>
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	  <c:if test="${pager.pre}">
	    <li class="page-item">
	      <a class="page-link link-offset-2 link-underline link-underline-opacity-0 text-black" href="./list?page=${pager.startNum-1}&kind=${param.kind}&search=${param.search}" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	   </c:if>
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">		    
		    	<li class="page-item">
		    	<a class="page-link link-offset-2 link-underline link-underline-opacity-0 text-black" href="./list?page=${i}&kind=${param.kind}&search=${param.search}">${i}</a>
		    	<li>
			</c:forEach>
		<c:if test="${pager.next}">
		    <li class="page-item">
		  	   	<a class="page-link link-offset-2 link-underline link-underline-opacity-0 text-black" href="./list?page=${pager.lastNum+1}&kind=${param.kind}&search=${param.search}" aria-label="Next">
		    	<span aria-hidden="true">&raquo;</span>
		      	</a>
		   	</li>
		   </c:if>
		 </ul>
	 </nav>
	<!-- 검색창 -->	
	<form action="./list" method="get">
		<div class="input-group mb-3" id="frm">
			  <input type="hidden" value="${pager.page}" id="page" name="page">
			    <!-- 파라미터 이름 kind -->
			  <select name="kind" id="k" class="form-select form-select-sm" aria-label="Small select example">
				  <option class="kind" value="subject">Subject</option>
				  <option class="kind" value="contents">Contents</option>
			  </select>
			  
			  <input type="text" name="search" value="${pager.search}" class="form-control" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="button-addon2">
			   <div class="col-auto">
			  	<button class="btn btn-secondary" type="submit" id="button-addon2">Search</button>
		  	   </div>
		</div>
		</form>
		
	<a class="btn btn-outline-secondary" href="./add">Add</a>
</section>

</body>
</html>