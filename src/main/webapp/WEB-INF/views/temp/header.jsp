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
</head>
<body>
    <div class="viewport">
        <header>
            <h1>
                <a href="${pageContext.request.contextPath}/" class="main_logo">
					<img src="/resources/images/main_logo.png" alt="메인로고">
                </a>
            </h1>
            
            <div id="search">
				<form action="${pageContext.request.contextPath}/product/list" method="get">
					<select name="kind">
						<option value="name">이름</option>
						<option value="contents">내용</option>
					</select>
					<input type="text" name="search" placeholder="무엇을 찾고 계신가요?">
	 		  </form>
			</div>
            
            <ul>
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/">Home&nbsp;&nbsp;&nbsp;&nbsp;</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link active" href="/product/list">전체 제품&nbsp;&nbsp;&nbsp;&nbsp;</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link active" href="/product/list/takju">탁주&nbsp;&nbsp;&nbsp;&nbsp;</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link active" href="/product/list/chungju">약, 청주&nbsp;&nbsp;&nbsp;&nbsp;</a>
			        </li>			        
			        <li class="nav-item">
			          <a class="nav-link active" href="/product/list/wine">과실주&nbsp;&nbsp;&nbsp;&nbsp;</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link active" href="/product/list/soju">증류주</a>
			        </li>

		    </ul>
            <ul>
            	<c:if test="${not empty basketList}">
            		<li class="not_empty_Basket"><a href="/product/basketList">
            		<!-- <img alt="" src="/resources/basket/basketIcon_black.png"> --> </a></li>
            	</c:if>
            	<c:if test="${empty basketList}">
            		<li class="empty_Basket"><a href="/product/basketList"> 장바구니
            		<!-- <img alt="" src="/resources/basket/basketIcon_white.png"> --> </a></li>
            	</c:if>
            </ul>
            <ul>
                <c:if test="${not empty member}">
	      		<li class="login"><a href="/member/logout">로그아웃</a></li>
	      		<li class="join"><a href="/member/mypage">mypage</a></li>
	      		</c:if>
				<c:if test="${empty member}">
	      		<li class="login"><a href="/member/login">로그인</a></li>
	      		<li class="join"><a href="/member/terms">회원가입</a></li>
	      		</c:if>            </ul>
        </header>
        <br><br><br>
        <hr>
        <section>
           <div class="main">
            
           </div>
        </section>
    </div>
	
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/ScrollTrigger.min.js"></script>
    <script src="/resources/js/main.js"></script>
</body>
</html>