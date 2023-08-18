<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootStrap.jsp"></c:import>
<style>
		.f{
			color:red;
		}

		.t{
			color:blue;
		}
	</style>
</head>
<body>
	<section class="container mt-5">
		<h1>회원가입</h1>

		<form action="./join" method="post"  id="frm">
		<div>
			<label for="id" class="form-label">아이디</label>
			<input type="text" name="id" class="form-control input" id="id">
			<div id="idMsg"></div>
		</div>
		<div>
			<label for="pw" class="form-label">패스워드</label>
			<input type="password" name="pw" class="form-control input" id="pw">
			<div id="pwMsg"></div>
		</div>
		<div>
			<label for="pw2" class="form-label">패스워드확인</label>
			<input type="password" name="pw2" class="form-control input" id="pw2">
			<div id="pw2Msg"></div>
		</div>
		<div>
			<label for="name1" class="form-label">이름</label>
			<input type="text" name="name" class="form-control input" id="name1">
			<div id="nameMsg"></div>
		</div>
		<div>
			<label for="phone" class="form-label">휴대폰번호</label>
			<input type="text" name="phone" class="form-control input" id="phone">
			<div id="phoneMsg"></div>
		</div>
		<div>
			<label for="address" class="form-label">주소</label>
			<input type="text" name="address" class="form-control input" id="address">
			<div id="addressMsg"></div>
		</div>
		<div class="mb-5">
			<label for="birth" class="form-label input" data-name="생년월일">생년월일</label>
			<input type="date" name="birth" id="birth">
			<div id="birthMsg"></div>
		</div>
		
		<div class="mb-5">
			<label for="pic" class="form-label">사진첨부</label>
			<input type="file" name="pic" id="pic">
		</div>
		
		
		<div>
			<button type="submit" class="btn btn-success" id="btn">회원가입</button>
		</div>

		</form>
	</section>

	<script src="/resources/js/member.js"></script>
</body>
</html>