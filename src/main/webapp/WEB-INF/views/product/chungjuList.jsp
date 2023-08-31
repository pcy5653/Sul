<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootStrap.jsp"></c:import>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	
	<section class="container mt-5">	
		<h1 class="mb-4 text-center">청주 List</h1>
		<table class="table table-dark table-hover">
			<thead>
				<tr>
					<th>상품명</th>
					<th>가격</th>
					<th>평점</th>
					<th>적립금</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="p">
					<tr>
						<td><a href="../detail?productNum=${p.productNum}">${p.productName}</td>
						<td>${p.price} </td>
						<td>${p.score} </td>
						<td>${p.savePoint} </td>
					</tr>
				</c:forEach>	
			</tbody>
		</table>
		
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		  <%-- <c:if test="${pager.pre}"> --%>
		    <li class="page-item ${pager.pre?'':'disabled'}">
		      <a class="page-link" href="./chungju?page=${pager.startNum - 1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <%-- </c:if> --%>
		    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		    <li class="page-item"><a class="page-link" href="./chungju?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
		    </c:forEach>
		     <c:if test="${pager.next}">
		    <li class="page-item">
		      <a class="page-link" href="./chungju?page=${pager.lastNum + 1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		    </c:if>
		  </ul>
		</nav>
		
		<%-- <c:forEach begin="1" end="${pager.totalPage}" var="i">
			<a href="./list?page=${i}">${i}</a>
		</c:forEach> --%>
		
		<div class="input-group mb-3">
			<form action="./chungju" method="get">
			  <select name="kind" class="form-select" aria-label="Default select example">
				  <option value="name">이름</option>
				  <option value="contents">내용</option>
			  </select>
			  <input type="text" name="search" class="form-control" aria-label="Amount (to the nearest dollar)">
			  <div class="col-auto">
	    		<button type="submit" class="btn btn-primary">검색</button>
	 		  </div>
 		  </form>
		</div>
		
		<a class="btn btn-danger" href="../add">상품등록</a>
	</section>
	
	
	
</body>
</html>