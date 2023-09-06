<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/resources/css/member/info.css">
	<c:import url="../temp/bootStrap.jsp"></c:import>

	<title>회원정보</title>
</head>

<body>
	<div class="info_wrap">
		<div class="info">
			<div class="info_top">
				<h3>회원정보</h3>
			</div>
			<div class="member_point">
				적립금 : <span class="point_value">${member.point}</span><span class="point"></span>
			</div>
			<div class="info_frm">
				<form id="myForm" action="../member/updateInfo" method="post">
					<p>
						<label>아이디</label>
						<input class="input" type="text" id="id" name="id" readonly value="${ member.id }">
					</p>
					<p>
						<label>휴대폰번호</label>
						<input class="input" type="text" id="phone" name="phone" readonly
							value="${ member.phone }" required>
					</p>
					<p>
						<label>주소</label>
						<input class="input" type="text" id="address" name="address"
							value="${ member.address }" required>
					</p>
					<p>
						<label>생년월일</label>
						<input class="input date_input" type="date" id="birth" name="birth" value="${ member.birth }"
							required>
					</p>
					<p class="inBtn">
						<button type="button"
							class="info_btn"
							id="updateBtn">회원정보 변경</button>
					</p>
				</form>
				<br />
				<form id="pwForm" action="../member/updatePw" method="post">
					<input type="hidden" name="id" value="${ member.id }">
					<p>
						<label>기존 비밀번호</label>
						<input class="input" id="old_pw" name="old_pw" data-pw="${member.pw}" type="password"
							required>
					</p>
					<p>
						<label>새 비밀번호</label>
						<input class="input" id="pw" name="pw" type="password" required>
					</p>
					<div id="pwMsg" style="text-align:center"></div>
					<p>
						<label>비밀번호확인</label>
						<input class="input" type="password" id="pw2" type="password" required>
					</p>
					<div id="pw2Msg" style="text-align:center"></div>
					<p class="inBtn">
						<button type="button" id="pwBtn"
							class="info_btn">비밀번호
							변경</button>
					</p>
					<p class="inBtn infoDelBtn">
						<button type="button" id="deleteBtn"
							class="info_btn"
							data-bs-toggle="modal" data-bs-target="#exampleModal">회원탈퇴</button>
					</p>
				</form>

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