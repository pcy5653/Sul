<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/style/reset.css">
    <link rel="stylesheet" href="/resources/style/basic.css">
 	
    <title>header</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
    <div class="viewport"></div>
        <div class="headerWrap">
            <header>
                <h1>
                    <a href="${pageContext.request.contextPath}/" class="main_logo">
                        <img src="/resources/images/main/mainLogo.png" alt="메인로고">
                    </a>
                </h1>    
                <ul>
                    <c:if test="${not empty member}">
                        <li class="not_empty_Basket"><a href="/product/basketList">장바구니
                            <!-- <img alt="" src="../resources/images/basket/cart.png" style="width: 30px; height: 30px;"> --></a>
                        </li>
                        <li class="faq"><a href="/faq/list">고객센터</a></li>
                        <li class="login"><a href="/member/logout">로그아웃</a></li>
                        <li class="join"><a href="/member/mypage">${member.name}님</a></li>
                    </c:if>
                    <c:if test="${empty member}">
                        <li class="faq"><a href="/faq/list">고객센터</a></li>
                        <li class="login"><a href="/member/login">로그인</a></li>
                        <li class="join"><a href="/member/terms">회원가입</a></li>
                    </c:if>            
                </ul>
            </header>
        </div>
    </div>
	
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/ScrollTrigger.min.js"></script>
    <script src="/resources/js/main.js"></script>
</body>
</html>