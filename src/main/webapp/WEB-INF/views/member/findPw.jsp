<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Find Password</title>
			<style>
				* {
					padding: 0;
					margin: auto;
					border: none;
				}

				body {
					font-size: 14px;
					font-family: 'Roboto', sans-serif;
				}

				.container {
					width: 400px;
					height: 350px;
					padding: 40px;
					box-sizing: border-box;
				}

				.container>h2 {
					font-size: 24px;
					color: #6A24FE;
					margin-bottom: 20px;
				}

				#findform>input {
					width: 100%;
					height: 48px;
					padding: 0 10px;
					box-sizing: border-box;
					margin-bottom: 16px;
					border-radius: 6px;
					background-color: #F8F8F8;
				}

				#findform>input::placeholder {
					color: #D2D2D2;
				}

				#findform>input[type="submit"] {
					color: #fff;
					font-size: 16px;
					color: #6A24FE;
					margin-top: 20px;
				}
			</style>

		</head>

		<body>
			<section class="container">
				<h2>비밀번호찾기</h2>
				<form method="post" class="form-signin" action="findPw" name="findform" id="findform">

					<input type="text" id="id" name="id" class="form-control" placeholder="아이디">


					<input type="text" id="name" name="name" class="form-control" placeholder="이름">
					<input type="text" id="phone" name="phone" class="form-control" placeholder="휴대폰번호">

					<input class="btn btn-lg btn-secondary btn-block text-uppercase" type="submit" value="check">

					<!-- 정보가 일치하지 않을 때-->
					<c:if test="${check == 1}">
						<script>
							opener.document.findform.id.value = "";
							opener.document.findform.name.value = "";
							opener.document.findform.phone.value = "";
						</script>
						<label>일치하는 정보가 존재하지 않습니다.</label>
					</c:if>


					<c:if test="${check == 0 }">
						<label>찾으시는 비밀번호는 '${pw}' 입니다.</label>
						<div class="form-label-group">
							<input class="btn btn-lg btn-secondary btn-block text-uppercase" type="button" value="OK"
								onclick="closethewindow()">
						</div>
					</c:if>

				</form>
			</section>
			<script type="text/javascript">
				function closethewindow() {
					self.close();
				}
			</script>
		</body>

		</html>