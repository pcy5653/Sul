<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" href="/resources/css/product/list.css">
<Style>
/* header.css */
.viewport {}
.headerWrap {
    position: relative !important; top:0px !important;
    background-color: rgba(255,255, 255,0) !important;
}
header {position: absolute !important;left:0px !important; top:0px !important;
background-color: rgba(255,255, 255,0) !important;}

</Style>

</head>
<body>
	<c:import url="../temp/bootStrap.jsp"></c:import>
	<c:import url="../temp/header.jsp"></c:import>
	<div id="outerWrap">
		<div id="top">
		<c:choose>
			<c:when test="${not empty pagerk}">
			<p>
				<span>${pagerk.total}</span><span>건의 결과가 있어요!</span>
			</p>
			</c:when>
			<c:otherwise>
			<p>
				<span>${pager.total}</span><span>건의 결과가 있어요!</span>
			</p>
			</c:otherwise>
		</c:choose>
			<%-- <a class="btn btn-danger" href="${pageContext.request.contextPath}/product/add">상품 등록</a> --%>
		</div>
		<p class="line">
		<div id="productList">
			<c:forEach items="${list}" var="dto" varStatus="status">
		    <c:if test="${status.index % 4 == 0}">
		        <ul>
		    </c:if>
			    <li>
			        <img src="${pageContext.request.contextPath}/resources/images/product/${dto.productName}.jpg"
							onclick="location.href='${pageContext.request.contextPath}/product/detail?productNum=${dto.productNum}'">
			        <div>
			            <p class="name" onclick="location.href='${pageContext.request.contextPath}/product/detail?productNum=${dto.productNum}'">${dto.productName}</p>
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

		<c:if test="${not empty pagerk}">
		<div id="navWrap">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item ${pagerk.pre?'':'disabled'}">
						<a class="page-link" href="./list?page=${pagerk.startNum - 1}&kind=${pagerk.kind}&search=${pagerk.search}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<c:forEach begin="${pagerk.startNum}" end="${pagerk.lastNum}" var="i">
						<li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pagerk.kind}&search=${pagerk.search}">${i}</a></li>
					</c:forEach>
			     	<c:if test="${pagerk.next}">
						<li class="page-item">
							<a class="page-link" href="./list?page=${pagerk.lastNum + 1}&kind=${pagerk.kind}&search=${pagerk.search}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
		</c:if>
	</div>
	
</body>
</html>