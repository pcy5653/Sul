<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
            <c:import url="../temp/bootStrap.jsp"></c:import>
            <style type="text/css">
                * {
                    font-family: 'malgun gothic';
                }

                #content.cols-d {
                    width: 583px;
                    min-width: 583px;
                    margin: 0 auto;
                }

                .f {
                    position: relative;
                    margin: 0;
                    padding: 0;
                    color: #666;
                }

                .f p {
                    width: 100%;
                    margin: 0 0 13px;
                    font-size: 1.3em;
                    text-align: center;
                    margin-top: 20px;
                }

                .f p:after {
                    content: "";
                    display: block;
                    overflow: hidden;
                    clear: both;
                    height: 0;
                }

                .f textarea {
                    position: relative;
                    width: 570px;
                    height: 118px;
                    min-height: 118px;
                    padding: 3px 3px 3px 6px;
                    border: 1px solid #ececec;
                    border-top-color: #e1e1e1;
                    border-left-color: #e1e1e1;
                    background: #ececec;
                    border-radius: 3px;
                    -moz-border-radius: 3px;
                    -webkit-border-radius: 3px;
                }

                .scheme-g {
                    margin: 26px 0 8px;
                    padding: 0px;
                    font-size: 1.2em;
                    font-weight: 100;
                }

                .button_big {
                    float: right;
                    border: 0;
                    border-radius: 3px;
                    cursor: pointer;
                    display: inline-block;
                    font-size: 12px;
                    font-weight: bold;
                    line-height: 24px;
                    margin-left: 5px;
                    padding: 8px 16px;
                    text-decoration: none;
                    color: #fff;
                    background: #0080ff;
                    text-shadow: 1px 1px 1px #0066cc;
                    
                }
            </style>


        </head>

        <body>
            <article id="content" class="cols-d">
                <h1>이용약관</h1>
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
                        <input type="button" id="btn" class="button_big" style="padding:0 10px 10px 10px;height:24px;"
                            value="필수약관에 동의하세요." disabled />
                    </p>
                    <form action="./terms" id="pcheck" method="post"></form>
                </div>
            </article>
            <script src="/resources/js/terms.js"></script>
        </body>


        </html>