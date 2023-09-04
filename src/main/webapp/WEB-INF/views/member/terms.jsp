<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <c:import url="../temp/bootStrap.jsp"></c:import>
            <link rel="stylesheet" href="/resources/css/order/common.css" type="text/css">
            <link rel="stylesheet" href="/resources/css/member/terms.css" type="text/css">


        </head>

        <body>
            <c:import url="../temp/header.jsp"></c:import>
            <div id="outerWrap">
                <article id="content" class="cols-d">
                    <div id="title">
                        <p>이용약관</p>
                    </div>
                    <div class="f">
                        <p>
                            <input type="checkbox" id="allCheck" /> 모두 동의합니다.<br />
                        </p>
                        <h4 class="scheme-g" style="color: red;">(필수)이용 약관 동의</h4>
                        <textarea style="font-size:1em;">내용입니다.
                        </textarea>
                        <p>
                            <input type="checkbox" id="check1" class="checks" /> 위의 약관에 동의 합니다(필수)<br />
                        </p>
                        <h4 class="scheme-g" style="color: red;">(필수)개인정보 수집 및 이용 동의</h4>
                        <textarea style="font-size:1em;">내용입니다.
                        </textarea>
                        <p>
                            <input type="checkbox" id="check2" class="checks" /> 위의 약관에 동의 합니다(필수)<br />
                        </p>
                        <h4 class="scheme-g">(선택) 광고성 및 마케팅 정보 수신 동의</h4>
                        <textarea style="font-size:1em;">내용입니다. 
            
                        </textarea>
                        <p>
                            <input type="checkbox" id="check3" class="checks" /> 위의 약관에 동의 합니다.<br />
                            <input type="button" id="btn" class="button_big"
                                style="padding:0 10px 10px 10px;height:24px;" value="필수약관에 동의하세요." disabled />
                        </p>
                        <form action="./terms" id="pcheck" method="post"></form>
                    </div>
                </article>
            </div>
            <script src="/resources/js/terms.js"></script>
        </body>


        </html>