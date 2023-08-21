<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>footer</title>
    <style>
    /* footer */
    body {margin: 0 auto;}
    .viewport {width: 100%;}
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
</body>
</html>