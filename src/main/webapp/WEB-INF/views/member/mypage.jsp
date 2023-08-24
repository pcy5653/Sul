<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <link rel="stylesheet" href="/resources/css/mypage.css" type="text/css">
            <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
        </head>

        <body>

            <!-- Banner Section Begin -->
            <section class="a a-normal">
                            <hr>
                        <div class="text-center">
                                <div class="text">
                                    <h2>MyPage</h2>
                                </div>
                        </div>
            </section>
            <section>
                <div class="container">
                    <div class="mypage-text">
                        <nav>
                            <a href="#" class="link btn btn-secondary">주문 내역</a>
                            <a href="#" class="link btn btn-secondary">취소/환불 내역</a>
                            <a href="#" class="link btn btn-secondary">리뷰</a>
                            <a href="#" id="infoBtn" class="link btn btn-secondary">회원정보</a>
                            <a href="#" class="link btn btn-secondary">배송지 관리</a>
                        </nav>
                    </div>
                   <div id="page">
                                

                    </div>
                        
                    
                </div>
            </section>

            <script src="/resources/js/mypage.js"></script>
        </body>

        </html>