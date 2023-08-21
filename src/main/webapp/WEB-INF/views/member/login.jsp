<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<c:import url="../temp/bootStrap.jsp"></c:import>	
</head>
<body>
	<section class="container mt-5">
		<h1>LOGIN</h1>
		<form action="./login" id="loginFrm" method="post">
			<div class="mb-3">
				<label for="id" class="form-label">아이디</label> 
				<input type="text" class="form-control" id="id" name="id">
			</div>
			<div class="mb-3">
				<label for="pw" class="form-label">비밀번호</label>
				<input type="password" class="form-control" id="pw" name="pw">
			</div>
			
		</form>
		<button id="btn" class="btn btn-primary">로그인</button>
	</section>
	<script src="/resources/js/login.js"></script>
</body>
</html>