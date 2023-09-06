<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
	<c:forEach items="${reviewList}" var="review" varStatus="i">
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
 		<c:if test="${not empty review.reviewFileDTOs[0].fileName}">
 			<td><img height="100" width="100" src="/resources/upload/product/review/${review.reviewFileDTOs[0].fileName}">
 		</c:if>
 		<c:if test="${not empty review.reviewFileDTOs[1].fileName}">
	    	<img height="100" width="100" src="/resources/upload/product/review/${review.reviewFileDTOs[1].fileName}">
		</c:if>
	</c:forEach>
