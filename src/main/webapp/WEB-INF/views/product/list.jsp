<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" href="/resources/css/product/list.css">

</head>
<body>
	<c:import url="../temp/bootStrap.jsp"></c:import>
	<c:import url="../temp/header.jsp"></c:import>
	
	<div id="outerWrap">
		<div id="top">
			<p>
				<span>${pager.total}</span><span>건의 결과가 있어요!</span>
			</p>
			<%-- <a class="btn btn-danger" href="${pageContext.request.contextPath}/product/add">상품 등록</a> --%>
		</div>
		<p class="line">
		<div id="productList">
			<c:forEach items="${list}" var="dto" varStatus="status">
		    <c:if test="${status.index % 4 == 0}">
		        <ul>
		    </c:if>
			    <li>
			        <img src="${pageContext.request.contextPath}/resources/images/${dto.productName}.jpg"
							onclick="location.href='${pageContext.request.contextPath}/product/detail?productNum=${dto.productNum}'">
			        <div>
			            <p class="name">${dto.productName}</p>
			            <p class="price"><fmt:formatNumber value="${dto.price}" pattern="#,###" />원</p>
			            <p class="score">
			                <img src="${pageContext.request.contextPath}/resources/images/product/star.png">
			                ${dto.score}
			            </p>
			        </div>
			        <p class="line"></p>
			        <p class="contents">${dto.contents}</p>
			    </li>
		    <c:if test="${status.index % 4 == 3 or status.last}">
		        </ul>
		    </c:if>
			</c:forEach>
		</div>
		
		<div id="searchWrap">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item ${pager.pre?'':'disabled'}">
						<a class="page-link" href="./list?page=${pager.startNum - 1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
					</c:forEach>
			     	<c:if test="${pager.next}">
						<li class="page-item">
							<a class="page-link" href="./list?page=${pager.lastNum + 1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
	
	<script type="text/javascript" src="../resources/js/khj/productList.js"></script>
</body>
</html>