<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>
	<h1>작성리뷰</h1>
	<c:forEach items="${myReviewList}" var="review" varStatus="i">
		<c:choose>
			<c:when test="${i.first}">
				<tr id="totalPage" data-totalPage="${pager.totalPage}">
			</c:when>
			<c:otherwise>
				<tr>
			</c:otherwise>
		</c:choose>
	
		
		<td>아이디 ${review.id}</td><br>
		<td>별점 ${review.reviewStar}</td>
		<td>작성시간 ${review.reviewTime}</td><br>
		<tr><td> </td>
		<tr>
		<td>내용 ${review.reviewContents}</td>	
		<tr>			
 		<td><img height="100" width="100" src="/resources/upload/product/review/${review.reviewFileDTOs[0].fileName}">		
	    <img height="100" width="100" src="/resources/upload/product/review/${review.reviewFileDTOs[1].fileName}"></td>
		
	</c:forEach>

</body>
</html>