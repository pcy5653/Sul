<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
			<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
		<c:import url="../temp/bootStrap.jsp"></c:import>


		<title>회원정보</title>
	</head>

	<body>
		<div class="w3-content w3-container w3-margin-top">
			<div class="w3-container w3-card-4">
				<div class="w3-center w3-large w3-margin-top">
					<h3>회원정보</h3>
				</div>
				<div>
					적립금:${member.point}
				</div>
				<div>
					<form id="myForm" action="../member/updateInfo" method="post">
						<p>
							<label>아이디</label>
							<input class="w3-input" type="text" id="id" name="id" readonly value="${ member.id }">
						</p>
						<p>
							<label>휴대폰번호</label>
							<input class="w3-input" type="text" id="phone" name="phone" readonly
								value="${ member.phone }" required>
						</p>
						<p>
							<label>주소</label>
							<input class="w3-input" type="text" id="address" name="address" value="${ member.address }"
								required>
						</p>
						<p>
							<label>생년월일</label>
							<input class="w3-input" type="date" id="birth" name="birth" value="${ member.birth }"
								required>
						</p>
						<p class="w3-center">
							<button type="submit"
								class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원정보 변경</button>
						</p>
					</form>
					<br />
					<form id="pwForm" action="../member/updatePw" method="post">
						<input type="hidden" name="id" value="${ member.id }">
						<p>
							<label>기존 비밀번호</label>
							<input class="w3-input" id="old_pw" name="old_pw" data-pw="${member.pw}" type="password"
								required>
						</p>
						<p>
							<label>새 비밀번호</label>
							<input class="w3-input" id="pw" name="pw" type="password" required>
						<div id="pwMsg"></div>
						</p>
						<p>
							<label>비밀번호확인</label>
							<input class="w3-input" type="password" id="pw2" type="password" required>
						<div id="pw2Msg"></div>
						</p>
						<p class="w3-center">
							<button type="button" id="pwBtn"
								class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호 변경</button>
						</p>

					</form>
					<p class="w3-center">
						<button type="button" id="deleteBtn"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" data-bs-toggle="modal"
							data-bs-target="#removeModal">회원탈퇴</button>
					</p>
					
				</div>
			</div>
		</div>
		<!--Modal-->
		<div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 입력</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<input type="password" class="form-control" id="pw" name="accountPassword">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
						id="close">Close</button>
					<button type="button" class="btn btn-primary" data-add-num="${dto.bookNum}"
						data-total-page="${pager.totalPage}" id="add">상품가입</button>
				</div>
			</div>
		</div>
	</div>
		<script src="/resources/js/info.js"></script>

	</html>