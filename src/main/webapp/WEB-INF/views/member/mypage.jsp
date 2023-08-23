<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
            <c:import url="../temp/bootStrap.jsp"></c:import>

            <style>

            </style>

        </head>

        <body>
            <fieldset class="mt-5">
               
                <nav class="nav nav-pills flex-column flex-sm-row">
                    <p>${member.name}님</p>
                    <a class="flex-sm-fill text-sm-center nav-link" href="#">주문내역</a>
                    <a class="flex-sm-fill text-sm-center nav-link" id="btn" href="#">취소/환불내역</a>
                    <a class="flex-sm-fill text-sm-center nav-link" id="btn" href="#">작성리뷰</a>
                    <a class="flex-sm-fill text-sm-center nav-link" id="infoBtn" href="#">회원정보</a>
                    <a class="flex-sm-fill text-sm-center nav-link" id="btn" href="#">배송지관리</a>
                    <a class="flex-sm-fill text-sm-center nav-link" id="btn" href="#">고객센터</a>
                </nav>
            </fieldset>
            <section class="mt-5">
                <div>
                    <table id="page" style="width: 80%;">

                    </table>


                </div>
            </section>
            <script src="/resources/js/mypage.js"></script>
        </body>

        </html>