<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<!DOCTYPE html>
			<html lang="ko">

			<head>
				<meta charset="UTF-8">

				<link rel="stylesheet" href="/resources/css/order/common.css">
				<style>
					#reviewNotExist {
						text-align: center;
					}
				</style>
			</head>

			<body>
				<div id="outerWrap">
					<div id="title">
						<p>작성리뷰</p>
					</div>
					<div id="innerWrap">
						<div id="alignWrap">
							<c:if test="${fn:length(myReviewList)==0}">
								<div id="reviewNotExist">
									<img src="/resources/images/bubble-no-star.png" alt="리뷰없음" id="reviewImg">
									<p>작성리뷰가 없습니다.</p>
								</div>
							</c:if>
							<c:if test="${myReviewList != '[]'}">
								
							</c:if>

						</div>




					</div>
				</div>

			</body>

			</html>