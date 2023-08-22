<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
			<c:import url="../temp/bootStrap.jsp"></c:import>
			<style>
				.f {
					color: red;
				}

				.t {
					color: blue;
				}
			</style>
			
		</head>

		<body>
			<section class="container mt-5">
				<h1>회원가입</h1>

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
						<label for="phone">휴대폰 번호</label><br>
						<input id="phone" type="text" name="phone" title="전화번호 입력" class="input" required />
						<div id="phoneMsg"></div>
						<button type="button" id="phoneChk" class="doubleChk">인증번호 보내기</button>
						<span class="tip"></span><br>
						<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled required />
						<button type="button" id="phoneChk2" class="doubleChk">본인인증</button>
						<span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
						<input type="hidden" id="phoneDoubleChk" />


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
					<div style="float:left;margin-right:20px;">
						<fieldset class="fieldarea f2">
							<legend><span>이용</span>약관</legend>
							<p class="agreeText">
								<label for="agreement1">아래 사항에 동의 합니다.</label>
								<input id="agreement1" class="checkboxs" type="checkbox" name="agreement1" />
								<textarea id="text1" readonly>
					이용약관
				</textarea>
							</p>
						</fieldset>
					</div>
					<div>
						<fieldset class="fieldarea f3">
							<legend><span>개인정보</span>취급방침</legend>
							<p class="agreeText">
								<label for="agreement2">아래 사항에 동의 합니다.</label>
								<input id="agreement2" class="checkboxs" type="checkbox" name="agreement2" />
								<textarea id="text2" readonly>
					개인정보 방침 및 안내
				</textarea>
							</p>
						</fieldset>
					</div>
					<div>
						<button type="button" class="btn btn-success" id="btn">회원가입</button>
					</div>

				</form>
			</section>

			<script src="/resources/js/join.js"></script>
		</body>

		</html>