<%@page language="java" contentType="text/html; charset=UTF-8"
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
	<section class="container mt-5">
		<h1>LOGIN</h1>
		<form action="./login" method="post">
			<div class="mb-3">
				<label for="formId" class="form-label">아이디</label> 
				<input type="text" class="form-control" id="formId" name="id">
			</div>
			<div class="mb-3">
				<label for="formPw" class="form-label">비밀번호</label>
				<input type="password" class="form-control" id="formPw" name="pw">
			</div>
			
			<button type="submit" class="btn btn-primary">로그인</button>
		</form>
	</section>
</body>
</html>