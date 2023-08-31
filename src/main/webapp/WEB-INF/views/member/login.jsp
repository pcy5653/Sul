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
			<div class="login-wrapper">
				<h2>Login</h2>
				<form action="./login" id="loginFrm" method="post">
					<input type="text" id="id" name="id" placeholder="아이디" value="sunday1">

					<input type="password" placeholder="비밀번호" id="pw" name="pw" value="123456">


				</form>
				<a id="idBtn" onclick="window.open('./findId','아이디찾기','resizable=no width=600 height=500')">아이디찾기</a>
				<a id="pwBtn" onclick="window.open('./findPw','비밀번호찾기','resizable=no width=600 height=500')">비밀번호찾기</a><br>
				
				<button id="btn" class="btn btn-primary">로그인</button><br>
				<button id="btn1" class="btn btn-primary" onclick = "location.href = '/member/terms' ">회원가입</button><br>
			</div>
			<script src="/resources/js/login.js"></script>
			<script>

			</script>
		</body>

		</html>

