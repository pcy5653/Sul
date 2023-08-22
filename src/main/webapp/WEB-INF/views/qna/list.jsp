<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#title {font-size: 2.5rem; margin-bottom : 2rem;}
	table {border: 1px solid black; width:100%}
</style>

<title>${board} List</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<section>
		<div class="main">
	        <h1 id="title">${board} List</h1>
	
	        <table>
	            <thead>
	                <tr>
	                    <th>No</th><th>Title</th><th>작성자</th><th>날짜</th><th>HIT</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach items="${list}" var="dto" varStatus="i">
	                    <tr>
	                        <td>${dto.num}</td>
	                        <td><a href="./detail?num=${dto.num}"> ${dto.subject}</a></td>
	                        <td>${dto.name}</td>
	                        <td>${dto.createDate}</td>
	                        <td>${dto.hit}</td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
        </div>
		<nav aria-label="Page navigation example">
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

		<div class="input-group mb-3">
			<form action="./list" method="get" id="frm" >

				  <input type="hidden" id="page" value="${pager.page}" name="page">
				  <!-- parameter(name,value) -->
				  <select name="kind" id="k" class="form-select" data-kind="${param.kind}" aria-label="Default select example">
					  <option value="name" class="kind" data-list-name="kind" data-list="${param.kind}">작성자</option>
					  <option value="title" class="kind">Title</option>
					  <option value="contents" class="kind">Contents</option>
				 </select>
				 <!-- parameter -->
				  <input type="text" name="search" value="${param.search}" class="form-control" aria-label="Amount (to the nearest dollar)">
				  <div class="col-auto">
				    <button type="submit" class="btn btn-primary">검색</button>
				  </div>
			</form>
		</div>
        
        <a class="btn btn-danger" href="./add">게시물 등록</a>
        <%-- <c:if test="${not empty member}">
			
		</c:if> --%>
    </section>
    
    
    
	<c:import url="../temp/footer.jsp"></c:import>
	<script src="/resources/js/qna_list.js"></script>
</body>
</html>