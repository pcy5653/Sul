<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> -->

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
        position: fixed; left: 0; width: 100%; height:80px; margin: 0 auto; background: rgba(255,255,255,0.6);
        padding: 1rem 5rem;
        transition: top 1s;
    }
    .main_logo {display: block;}
    .main_logo img {width: 80%; height: 80%;}
    header ul {display: flex; align-items: center;}
    header ul .login {margin-right: 1rem;}
    section {width: 100%;} 
    section .main {width: 50%; background-color: rgb(136, 176, 211); margin: 0 auto;}
    footer {
        width:100%; font-size: 0.8rem; color: #494949;
        background-color: #f2f2f2;
    }
    .f_total {width: 90%; margin: 0 auto; padding: 2rem;}
    .f_top {display: flex; justify-content: space-between; margin-bottom: 1.5rem;}
    .f_top .f_top_left > p { margin-bottom: 0.2rem;}
    .f_top .f_top_left .company {
        font-size: 1.1rem; font-weight: 700; color:black; 
        margin-bottom: 0.8rem; 
    }
    .f_top ul {display: flex;}
    .f_top ul > li {width: 45px; margin-right: 1rem;}
    .f_top ul > li > a {display: block;}
    .f_top ul > li > a img {width: 100%;}
    .f_middle {margin-bottom: 1.5rem;}
    .f_middle > span {margin-right: 0.8rem ; font-weight: 600;}
    .f_middle > span::after {
        content: ''; display: inline-block;
        width: 1px; height: 10px; margin-left: 15px; background-color: black;
    }
    .f_middle > .last::after{display: none;}
    .f_bottom > p {color: black; margin-bottom: 0.2rem;}
    .f_bottom > p:last-of-type {margin-bottom: 2rem;}
    .f_bottom > span {line-height: 1.5;}
    </style>
</head>
<body>
    <div class="viewport">
        <header>
            <h1>
                <a href="/index" class="main_logo">
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
            3. 깃허브: 동찬님
            4. 디자인: 메인 쿠켓, 페이징 술담화
            https://www.cookat.co/
            https://www.sooldamhwa.com/
            결제API, 인증API, 주소API, 배송API
            로그인/회원가입/my page
            상품리스트/디테일, 리뷰
            qna, 질문, 공지게시판
            주문, 장바구니, 배송,
            기간
            1째주 8/18~8/30 1차 완료
            2째주 8/31~9/8 관리자 완료
            4째주 9/11~9/12 최종점검
            9/13~14 PPT 완료
            9/15 발표
            학원시간 이후는 각자 알아서, 연락은 디스코드, 슬랙, 카톡
            평일 12시 까지 연락 가능
            주말 12시 지나서 연락 가능1. 페키지명: com.alcohol.sul.main
            2. 프로젝트명: alcohol
            2. DB: 세은님
            3. 깃허브: 동찬님
            4. 디자인: 메인 쿠켓, 페이징 술담화
            https://www.cookat.co/
            https://www.sooldamhwa.com/
            결제API, 인증API, 주소API, 배송API
            로그인/회원가입/my page
            상품리스트/디테일, 리뷰
            qna, 질문, 공지게시판
            주문, 장바구니, 배송,
            기간
            1째주 8/18~8/30 1차 완료
            2째주 8/31~9/8 관리자 완료
            4째주 9/11~9/12 최종점검
            9/13~14 PPT 완료
            9/15 발표T 완료
            9/15 발표
            학원시간 이후는 각자 알아서, 연락은 디스코드, 슬랙, 카톡
            평일 12시 까지 연락 가능
            주말 12시 지나서 연락 가능1. 페키지명: com.alcohol.sul.main
            2. 프로젝트명: alcohol
            2. DB: 세은님
            3. 깃허브: 동찬님
            4. 디자인: 메인 쿠켓, 페이징 술담화
            https://www.cookat.co/
            https://www.sooldamhwa.com/
            결제API, 인증API, 주소API, 배송API
            로그인/회원가입/my page
            상품리스트/디테일, 리뷰
            qna, 질문, 공지게시판
            주문, 장바구니, 배송,
            기간
            1째주 8/18~8/30 1차 완료
            2째주 8/31~9/8 관리자 완료
            4째주 9/11~9/12 최종점검
            9/13~14 PPT 완료
            9/15 발표
            학원시간 이후는 각자 알아서, 연락은 디스코드, 슬랙, 카톡
            평일 12시 까지 연락 가능
            주말 12시 지나서 연락 가능1. 페키지명: com.alcohol.sul.main
            2. 프로젝트명: alcohol
            2. DB: 세은님
            3. 깃허브: 동찬님
            4. 디자인: 메인 쿠켓, 페이징 술담화
            https://www.cookat.co/
            https://www.sooldamhwa.com/
            결제API, 인증API, 주소API, 배송API
            로그인/회원가입/my page
            상품리스트/디테일, 리뷰
            qna, 질문, 공지게시판
            주문, 장바구니, 배송,
            기간
            1째주 8/18~8/30 1차 완료
            2째주 8/31~9/8 관리자 완료
            4째주 9/11~9/12 최종점검
            9/13~14 PPT 완료
            9/15 발표
            9/13~14 PPT 완료
            9/15 발표
            학원시간 이후는 각자 알아서, 연락은 디스코드, 슬랙, 카톡
            평일 12시 까지 연락 가능
            주말 12시 지나서 연락 가능1. 페키지명: com.alcohol.sul.main
            2. 프로젝트명: alcohol
            2. DB: 세은님
            3. 깃허브: 동찬님
            4. 디자인: 메인 쿠켓, 페이징 술담화
            https://www.cookat.co/
            https://www.sooldamhwa.com/
            결제API, 인증API, 주소API, 배송API
            로그인/회원가입/my page
            상품리스트/디테일, 리뷰
            qna, 질문, 공지게시판
            주문, 장바구니, 배송,
            기간
            1째주 8/18~8/30 1차 완료
            2째주 8/31~9/8 관리자 완료
            4째주 9/11~9/12 최종점검
            9/13~14 PPT 완료
            9/15 발표
            학원시간 이후는 각자 알아서, 연락은 디스코드, 슬랙, 카톡
            평일 12시 까지 연락 가능
            주말 12시 지나서 연락 가능1. 페키지명: com.alcohol.sul.main
            2. 프로젝트명: alcohol
            2. DB: 세은님
            3. 깃허브: 동찬님
            4. 디자인: 메인 쿠켓, 페이징 술담화
            https://www.cookat.co/
            https://www.sooldamhwa.com/
            결제API, 인증API, 주소API, 배송API
            로그인/회원가입/my page
            상품리스트/디테일, 리뷰
            qna, 질문, 공지게시판
            주문, 장바구니, 배송,
            기간
            1째주 8/18~8/30 1차 완료
            2째주 8/31~9/8 관리자 완료
            4째주 9/11~9/12 최종점검
            9/13~14 PPT 완료
            9/15 발표
            학원시간 이후는 각자 알아서, 연락은 디스코드, 슬랙, 카톡
            평일 12시 까지 연락 가능
            주말 12시 지나서 연락 가능1. 페키지명: com.alcohol.sul.main
            2. 프로젝트명: alcohol
            2. DB: 세은님
            3. 깃허브: 동찬님
            4. 디자인: 메인 쿠켓, 페이징 술담화
            https://www.cookat.co/
            https://www.sooldamhwa.com/
            결제API, 인증API, 주소API, 배송API
            로그인/회원가입/my page
            상품리스트/디테일, 리뷰
            qna, 질문, 공지게시판
            주문, 장바구니, 배송,
            기간
            1째주 8/18~8/30 1차 완료
            2째주 8/31~9/8 관리자 완료
            4째주 9/11~9/12 최종점검
            9/13~14 PPT 완료
            9/15 발표
            학원시간 이후는 각자 알아서, 연락은 디스코드, 슬랙, 카톡
            평일 12시 까지 연락 가능
            주말 12시 지나서 연락 가능1. 페키지명: com.alcohol.sul.main
            2. 프로젝트명: alcohol
            2. DB: 세은님
            3. 깃허브: 동찬님
            4. 디자인: 메인 쿠켓, 페이징 술담화
            https://www.cookat.co/
            https://www.sooldamhwa.com/
            결제API, 인증API, 주소API, 배송API
            로그인/회원가입/my page
            상품리스트/디테일, 리뷰
            qna, 질문, 공지게시판
            주문, 장바구니, 배송,
            기간
            1째주 8/18~8/30 1차 완료
            2째주 8/31~9/8 관리자 완료
            4째주 9/11~9/12 최종점검
            9/13~14 PPT 완료
            9/15 발표
            학원시간 이후는 각자 알아서, 연락은 디스코드, 슬랙, 카톡
            평일 12시 까지 연락 가능
            주말 12시 지나서 연락 가능1. 페키지명: com.alcohol.sul.main
            2. 프로젝트명: alcohol
            2. DB: 세은님
            3. 깃허브: 동찬님
            4. 디자인: 메인 쿠켓, 페이징 술담화
            https://www.cookat.co/
            https://www.sooldamhwa.com/
            결제API, 인증API, 주소API, 배송API
            로그인/회원가입/my page
            상품리스트/디테일, 리뷰
            qna, 질문, 공지게시판
            주문, 장바구니, 배송,
            기간
            1째주 8/18~8/30 1차 완료
            2째주 8/31~9/8 관리자 완료
            4째주 9/11~9/12 최종점검
            9/13~14 PPT 완료
            9/15 발표
            학원시간 이후는 각자 알아서, 연락은 디스코드, 슬랙, 카톡
            평일 12시 까지 연락 가능
            주말 12시 지나서 연락 가능1. 페키지명: com.alcohol.sul.main
            2. 프로젝트명: alcohol
            2. DB: 세은님
            3. 깃허브: 동찬님
            4. 디자인: 메인 쿠켓, 페이징 술담화
            https://www.cookat.co/
            https://www.sooldamhwa.com/
            결제API, 인증API, 주소API, 배송API
            로그인/회원가입/my page
            상품리스트/디테일, 리뷰
            qna, 질문, 공지게시판
            주문, 장바구니, 배송,
            기간
            1째주 8/18~8/30 1차 완료
            2째주 8/31~9/8 관리자 완료
            4째주 9/11~9/12 최종점검
            9/13~14 PPT 완료
            9/15 발표
            학원시간 이후는 각자 알아서, 연락은 디스코드, 슬랙, 카톡
            평일 12시 까지 연락 가능
            주말 12시 지나서 연락 가능1. 페키지명: com.alcohol.sul.main
            2. 프로젝트명: alcohol
            2. DB: 세은님
            3. 깃허브: 동찬님
            4. 디자인: 메인 쿠켓, 페이징 술담화
            https://www.cookat.co/
            https://www.sooldamhwa.com/
            결제API, 인증API, 주소API, 배송API
            로그인/회원가입/my page
            상품리스트/디테일, 리뷰
            qna, 질문, 공지게시판
            주문, 장바구니, 배송,
            기간
            1째주 8/18~8/30 1차 완료
            2째주 8/31~9/8 관리자 완료
            4째주 9/11~9/12 최종점검
            9/13~14 PPT 완료
            9/15 발표
            학원시간 이후는 각자 알아서, 연락은 디스코드, 슬랙, 카톡
            평일 12시 까지 연락 가능
            주말 12시 지나서 연락 가능1. 페키지명: com.alcohol.sul.main
            2. 프로젝트명: alcohol
            2. DB: 세은님
            3. 깃허브: 동찬님
            4. 디자인: 메인 쿠켓, 페이징 술담화
            https://www.cookat.co/
            https://www.sooldamhwa.com/
            결제API, 인증API, 주소API, 배송API
            로그인/회원가입/my page
            상품리스트/디테일, 리뷰
            qna, 질문, 공지게시판
            주문, 장바구니, 배송,
            기간
            1째주 8/18~8/30 1차 완료
            2째주 8/31~9/8 관리자 완료
            4째주 9/11~9/12 최종점검
            9/13~14 PPT 완료
            9/15 발표
            학원시간 이후는 각자 알아서, 연락은 디스코드, 슬랙, 카톡
            평일 12시 까지 연락 가능
            주말 12시 지나서 연락 가능1. 페키지명: com.alcohol.sul.main
            2. 프로젝트명: alcohol
            2. DB: 세은님
            3. 깃허브: 동찬님
            4. 디자인: 메인 쿠켓, 페이징 술담화
            https://www.cookat.co/
            https://www.sooldamhwa.com/
            결제API, 인증API, 주소API, 배송API
            로그인/회원가입/my page
            상품리스트/디테일, 리뷰
            qna, 질문, 공지게시판
            주문, 장바구니, 배송,
            기간
            1째주 8/18~8/30 1차 완료
            2째주 8/31~9/8 관리자 완료
            4째주 9/11~9/12 최종점검
            9/13~14 PPT 완료
            9/15 발표
            학원시간 이후는 각자 알아서, 연락은 디스코드, 슬랙, 카톡
            평일 12시 까지 연락 가능
            주말 12시 지나서 연락 가능
            9/13~14 PPT 완료
            9/15 발표
            학원시간 이후는 각자 알아서, 연락은 디스코드, 슬랙, 카톡
            평일 12시 까지 연락 가능
            주말 12시 지나서 연락 가능
            </p>
           </div>
        </section>

        <footer>
            <div class="f_total">
                <div class="f_top">
                    <div class="f_top_left">
                        <p class="company">술담화컴퍼니 주식회사</p>
                        <p>고객센터 : 070-5014-1282</p>
                        <p>평일 10:00 ~ 18:00, 주말 휴무</p>
                    </div>
                    <ul>
                        <li><a href="https://www.instagram.com/sooldamhwa/?hl=ko" target="_blank"><img src="/resources/images/icon_instagram.png" alt="SNS 바로가기"></a></li>
                        <li><a href="https://www.youtube.com/channel/UCuhTvdO3VD-S3md_CkWYtbw" target="_blank"><img src="/resources/images/icon_youtube.png" alt="유튜브 바로가기"></a></li>
                        <li><a href="https://pf.kakao.com/_xktAgj" target="_blank"><img src="/resources/images/icon_kakao.png" alt="카카오 바로가기"></a></li>
                        <li><a href="https://blog.naver.com/sooldamhwa" target="_blank"><img src="/resources/images/icon_naver.png" alt="네이버 바로가기"></a></li>
                    </ul>
                </div>
                <div class="f_middle">
                    <span>이용약관</span>
                    <span>개인정보처리방침</span>
                    <span class="last">입점문의</span>
                </div>
                <div class="f_bottom">
                    <p>대표 : 이재욱    사업자등록번호 : 620-81-58299   통신판매 신고번호: 2021-서울서초-2084</p>
                    <p>주소 : 서울특별시 서초구 강남대로 527, 10층(브랜드칸타워, 술담화)
                        
                        정보보호 책임자 : 박준형
                        
                        대표 전화 : 070-5014-1282
                        
                        이메일 : info@sooldamhwa.com
                    </p>
                    <span>
                        술담화는 통신판매중개자로서 통신판매 당사자가 아니며, 판매자가 등록한 상품정보 및 거래에 대해 술담화는 책임을 지지 않습니다. <br>
                        고객님의 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에서 가입한 NICE구매안전 (에스크로) 서비스를 이용하실 수 있습니다.
                    </span>
                </div>
                    </div>
                </footer>
            </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/ScrollTrigger.min.js"></script>
    <script src="/resources/js/main.js"></script>
</body>
</html>