<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>

			<c:import url="../temp/bootStrap.jsp"></c:import>
			<link rel="stylesheet" href="/resources/css/login.css">
		</head>

		<body>
			<div class="login-wrapper">
				<h2>Login</h2>
				<form action="./login" id="loginFrm" method="post">
					<input type="text" id="id" name="id" placeholder="아이디">

					<input type="password" placeholder="비밀번호" id="pw" name="pw">
					

				</form>
				<button id="btn" class="btn btn-primary">로그인</button><br><br>
				<button id="idBtn" class="btn btn-primary"
					onclick="window.open('./findId','아이디찾기','resizable=no width=600 height=500')">아이디찾기</button>
				<button id="pwBtn" class="btn btn-primary"
					onclick="window.open('./findPw','비밀번호찾기','resizable=no width=600 height=500')">비밀번호찾기</button>
			</div>
			<script src="/resources/js/login.js"></script>
			<script>
				
			</script>
		</body>

		</html>