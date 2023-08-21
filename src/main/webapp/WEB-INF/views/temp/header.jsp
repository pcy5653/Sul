<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
   
    <style>
        /* reset.css */
*   {box-sizing: border-box;}
    html, body {}
    html, body, h1, h2, h3, h4, h5, h6, dl, dt, dd,
    table, thead, tbody, tfoot, tr, td, th, span, em, p ,strong, del, s, q, blockquote, address, form, input, fieldset, legend, button, select, option, textarea, label, ul, ol, li, a, div, header, nav, aside, section, footer, article, video, img {
        font-size: 1.0em; line-height: 1.0;
        font-style: normal; font-weight: normal;
        margin: 0; padding: 0;
    }
    ul, ol, li {list-style: none;}
    table, tr, td, th {border-collapse: collapse;}
    a {text-decoration: none; color: #000;}
    fieldset {border: 0;}
    button {cursor: pointer; border: 0; background: none;}
    .skip {display: none;}


    /* header.css */
    body {margin: 0 auto;}
    .viewport {width: 100%;}

    header {
        display: flex; justify-content: space-between;
        position: fixed; left: 0; top: 0; width: 100%; height:80px; margin: 0 auto; background: rgba(255,255,255,0.6);
        padding: 1rem 5rem;
        transition: top 1s;
    }
    .main_logo {display: block;}
    .main_logo img {width: 80%; height: 80%;}
    header ul {display: flex; align-items: center;}
    header ul .login {margin-right: 1rem;}
    section {width: 100%; margin-top: 100px; text-align: center;} 
    section .main {width: 85%; background-color: rgb(136, 176, 211); margin: 0 auto;}
    </style>
</head>
<body>
    <div class="viewport">
        <header>
            <h1>
                <a href="../" class="main_logo">
                    <img src="/resources/images/main_logo.png" alt="메인로고">
                </a>
            </h1>
            <ul>
                <c:if test="${not empty member}">
	      		<li class="login"><a href="/member/logout">로그아웃</a></li>
	      		<li class="join"><a href="/member/mypage">mypage</a></li>
	      		</c:if>
				<c:if test="${empty member}">
	      		<li class="login"><a href="/member/login">로그인</a></li>
	      		<li class="join"><a href="/member/join">회원가입</a></li>
	      		</c:if>            </ul>
        </header>
        
        <section>
           <div class="main">
            
           </div>
        </section>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/ScrollTrigger.min.js"></script>
    <script src="/resources/js/main.js"></script>
</body>
</html>