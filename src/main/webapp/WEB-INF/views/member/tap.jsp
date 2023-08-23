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
	<section class="mt-5">
		<nav class="nav nav-pills flex-column flex-sm-row">
			<a class="flex-sm-fill text-sm-center nav-link" href="#">주문내역</a>
			<a class="flex-sm-fill text-sm-center nav-link" id="btn" href="#">취소/환불내역</a>
			<a class="flex-sm-fill text-sm-center nav-link" id="btn" href="#">작성리뷰</a>
			<a class="flex-sm-fill text-sm-center nav-link" id="infoBtn" href="#">회원정보</a>
			<a class="flex-sm-fill text-sm-center nav-link" id="btn" href="#">배송지관리</a>
			<a class="flex-sm-fill text-sm-center nav-link" id="btn" href="#">고객센터</a>
		</nav>
	</section>
	<script src="/resources/js/mypage.js"></script>
</body>
</html>