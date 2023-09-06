<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<c:import url="../temp/bootStrap.jsp"></c:import>
			<link rel="stylesheet" href="/resources/css/member/login.css">
		</head>

		<body>
			<c:import url="../temp/header.jsp"></c:import>
			<div class="login-wrapper">
				<h2>Login</h2>
				<form action="./login" id="loginFrm" method="post">
					<input type="text" id="id" name="id" placeholder="아이디">

					<input type="password" placeholder="비밀번호" id="pw" name="pw">


				</form>
				<a id="idBtn" onclick="window.open('./findId','아이디찾기','resizable=no width=600 height=500')">아이디찾기</a>
				<a id="pwBtn"
					onclick="window.open('./findPw','비밀번호찾기','resizable=no width=600 height=500')">비밀번호찾기</a><br>

				<button id="btn" class="btn btn-primary">로그인</button><br>
				<button id="btn1" class="btn btn-primary" onclick="location.href = '/member/terms' ">회원가입</button><br>
			</div>
			<br>
			<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
			<!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
			<div id="naver_id_login" style="text-align:center"><a href="${url}">
				<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
			<br>




			<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
				charset="utf-8"></script>
			<script src="/resources/js/login.js"></script>
			<script>

			</script>
		</body>

		</html>