<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	
	<style type="text/css">
		*{
			box-sizing:border-box;
		}
		
		#header{
			position:fixed;
			left:50%;
			transform:translate(-50%, 0%);
			overflow:hidden;
			z-index:1;
		}
		
		#header img{
			float:left;
		}
		
		#header ul{
			overflow:hidden;
			float:left;
		}
		
		#header li{
			list-style:none;
			float:left;
		}
	</style>
</head>
<body>
	<div id="header">
		<img src="./resources/images/main_logo.png">
		<ul>
			<li>전체 제품</li>
			<li>탁주</li>
			<li>약, 청주</li>
			<li>과실주</li>
			<li>증류주</li>
		</ul>
		<ul>
			<c:if test="${not empty member}">
				<li class="login"><a href="/member/logout">로그아웃</a></li>
				<li class="join"><a href="/member/mypage">마이페이지</a></li>
			</c:if>
			<c:if test="${empty member}">
				<li class="login"><a href="/member/login">로그인</a></li>
				<li class="join"><a href="/member/terms">회원가입</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>