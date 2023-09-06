<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<input type="hidden" id="reviewTotal" value="${pager.total}">
<input type="hidden" id="totalPage" data-totalPage="${pager.totalPage}">

<c:forEach items="${reviewList}" var="review" varStatus="i">
	<div class="review">
		<div class="title">
			<p class="id">${review.id}</p>
			<p class="createDate">${review.reviewTime}</p>
			<p class="score">
				<img src="../resources/images/product/star-icon.svg">
				<span>${review.reviewStar}</span>
			</p>
		</div>
		<div class="contents">
			<div>
				${review.reviewContents}
			</div>
			<div class="images">
				<c:if test="${not empty review.reviewFileDTOs[0].fileName}">
					<img height="100" width="100" src="/resources/upload/product/review/${review.reviewFileDTOs[0].fileName}">
				</c:if>
				<c:if test="${not empty review.reviewFileDTOs[1].fileName}">
					<img height="100" width="100" src="/resources/upload/product/review/${review.reviewFileDTOs[1].fileName}">
				</c:if>
			</div>
		</div>
	</div>
</c:forEach>
