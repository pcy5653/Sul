<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
								<input class="w3-input" type="text" id="address" name="address"
									value="${ member.address }" required>
							</p>
							<p>
								<label>생년월일</label>
								<input class="w3-input" type="date" id="birth" name="birth" value="${ member.birth }"
									required>
							</p>
							<p class="w3-center">
								<button type="button"
									class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round"
									id="updateBtn">회원정보 변경</button>
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
									class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호
									변경</button>
							</p>

						</form>
						<p class="w3-center">
							<button type="button" id="deleteBtn"
								class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round"
								data-bs-toggle="modal" data-bs-target="#exampleModal">회원탈퇴</button>
						</p>

					</div>
				</div>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
				aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">탈퇴 확인</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							정말로 회원탈퇴 하시겠습니까?
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" id="delBtn">탈퇴하기</button>
						</div>
					</div>
				</div>
			</div>
			

		</html>