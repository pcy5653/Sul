<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<c:import url="../temp/bootStrap.jsp"></c:import>
			<link href="/resources/css/order/common.css" rel="stylesheet" />
			<style>
				.f {
					color: red;
				}

				.t {
					color: blue;
				}

				.viewport {
					background-color: #ffc9cc;
				}

				.headerWrap {
					position: relative !important;
					top: 0px !important;
					background-color: rgba(255, 255, 255, 0) !important;
				}

				header {
					position: relative !important;
					top: 0px !important;
					background-color: rgba(255, 255, 255, 0) !important;
				}

				footer {
					margin-top: 7rem;
				}
			</style>

		</head>

		<body>
			<c:import url="../temp/header.jsp"></c:import>
			<div id="outerWrap" class="container">
				<div id="title">
					<p>회원가입</p>
				</div>
				<div id="formWrap">
					<form action="./join" method="post" id="frm">
						<div id="idDiv">
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
						<div class="mobileNo">
							<label for="phone" class="form-label">휴대폰 번호</label><br>
							<input id="phone" type="text" name="phone" class="form-control input" title="전화번호 입력"
								value="${phone}" readonly>
							<div>
								<label for="address" class="form-label">주소</label>
								<input type="text" name="address" class="form-control input" id="address"><br>
								<button type="button" id="adrBtn">주소검색</button>
								<div id="addressMsg"></div>
							</div><br>
							<div>
								<label for="birth" class="form-label input" data-name="생년월일">생년월일</label>
								<input type="date" name="birth" id="birth">
								<div id="birthMsg"></div>
							</div><br>

							<div class="mb-5">
								<input type="checkbox" name="smsCheck" id="smsCheck" checked>&nbsp;&nbsp;SMS수신동의(이벤트문자)
								<input type="hidden" name="sms" id="sms" value="1">
							</div>
							<button type="button" id="regBtn">회원가입</button>
					</form>
				</div>
			</div>
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script src="/resources/js/join.js"></script>
		</body>

		</html>