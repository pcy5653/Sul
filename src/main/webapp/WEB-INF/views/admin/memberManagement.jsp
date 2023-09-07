<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/resources/css/admin/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>    
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="main">AdminHome</a>
           
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link" href="salesRevenue">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                매출
                            </a>
                            <a class="nav-link" href="memberManagement">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                회원관리
                            </a>
                            <a class="nav-link" href="/product/add">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                상품등록
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                            ${member.id}
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">회원관리</h1>
                        <div class="card mb-4 col-xl-7">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                회원목록
                            </div>
                            <div class="card-body">
                                <table class="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>권한</th>
                                            <th>휴대폰번호</th>
                                            <th>주소</th>
                                            <th>생년월일</th>
                                            <th>가입날짜</th>
                                            <th>포인트</th>
                                            <th>선택</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>권한</th>
                                            <th>휴대폰번호</th>
                                            <th>주소</th>
                                            <th>생년월일</th>
                                            <th>가입날짜</th>
                                            <th>선택</th>
                                            
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${list}" var="member" varStatus="i">
                                            <tr>
                                                <td id="memberId${i.index}" class="${member.id}">${member.id}</td>
                                                <td>${member.name}</td>
                                                <td><c:if test="${member.roleNum==1}">관리자</c:if><c:if test="${member.roleNum==0}">유저</c:if></td>
                                                <td>${member.phone}</td>
                                                <td>${member.address}</td>
                                                <td>${member.birth}</td>
                                                <td>${member.memberDate}</td>
                                                <td>${member.point}</td>
                                                <td><input type="checkbox" class="memberChecks" id="memberCheck${i.index}"></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <input type="text" name="search" id="search" placeholder="선택할 회원의 id 입력"><button type="button" id="searchBtn">회원선택/해제</button>
                                <button type="button" id="allCheckBtn2" >전체선택/해제</button><br><br>
                                <input type="text" name="point" id="point" placeholder="지급할 포인트 입력">
                                <button type="button" class="pointBtns" id="pointBtn">포인트지급</button><br><br>
                                <button type="button" class="btns" id="deleteBtn">탈퇴</button>
                            </div>

                        </div>
                        <div class="card mb-4 col-xl-7">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                SMS수신동의회원목록(단체문자)
                            </div>
                            <div class="card-body">
                                <table class="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>권한</th>
                                            <th>휴대폰번호</th>
                                            <th>주소</th>
                                            <th>생년월일</th>
                                            <th>가입날짜</th>
                                            <th>SMS수신여부</th>
                                            <th>선택</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>권한</th>
                                            <th>휴대폰번호</th>
                                            <th>주소</th>
                                            <th>생년월일</th>
                                            <th>가입날짜</th>
                                            <th>SMS수신여부</th>
                                            <th>선택</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${checkList}" var="checkList" varStatus="i">
                                            <tr>
                                                    <td id="checkListId${i.index}" class="${checkList.id}two">${checkList.id}</td>
                                                    <td>${checkList.name}</td>
                                                    <td><c:if test="${checkList.roleNum==1}">관리자</c:if><c:if test="${checkList.roleNum==0}">유저</c:if></td>
                                                    <td id="phone${i.index}">${checkList.phone}</td>
                                                    <td>${checkList.address}</td>
                                                    <td>${checkList.birth}</td>
                                                    <td>${checkList.memberDate}</td>
                                                    <td>수신동의</td>
                                                    <td><input type="checkbox" class="smsChecks" id="smsCheck${i.index}"></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <input type="text" name="search2" id="search2" placeholder="선택할 회원의 id 입력"><button type="button" id="searchBtn2">회원선택/해제</button>
                                <button type="button" id="allCheckBtn">전체선택/해제</button>
                            </div>
                            <textarea name="smsContents" id="smsContents" cols="10" rows="3" width="50%" placeholder="전송할 문자 내용을 입력하세요."></textarea>
                            <button type="button" id="smsBtn">단체문자발송</button>
                        </div>
                    </div>
                </main>
                
            </div>
        </div>
        <script src="/resources/js/memberManagement.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </body>
</html>
