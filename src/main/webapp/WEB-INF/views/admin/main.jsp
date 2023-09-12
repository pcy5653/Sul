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
            <title>Admin</title>
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
                                <a class="nav-link" href="/admin/salesRevenue">
                                    <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                    매출
                                </a>
                                <a class="nav-link" href="/admin/memberManagement">
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
                            <h1 class="mt-4">Dashboard</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ol>

                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    회원목록
                                </div>
                                <div class="card-body">
                                    <table id="datatablesSimple">
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
                                                <th>포인트</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <c:forEach items="${list}" var="member" varStatus="i">
                                                <tr>
                                                    <td>${member.id}</td>
                                                    <td>${member.name}</td>
                                                    <td>
                                                        <c:if test="${member.roleNum==1}">관리자</c:if>
                                                        <c:if test="${member.roleNum==0}">유저</c:if>
                                                    </td>
                                                    <td>${member.phone}</td>
                                                    <td>${member.address}</td>
                                                    <td>${member.birth}</td>
                                                    <td>${member.memberDate}</td>
                                                    <td>${member.point}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </main>
                    <footer class="py-4 bg-light mt-auto">
                        <div class="container-fluid px-4">
                            <div class="d-flex align-items-center justify-content-between small">
                                <div class="text-muted">Copyright &copy; Your Website 2023</div>
                                <div>
                                    <a href="#">Privacy Policy</a>
                                    &middot;
                                    <a href="#">Terms &amp; Conditions</a>
                                </div>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                crossorigin="anonymous"></script>
            <script src="/resources/js/table/datatables-simple-demo.js"></script>
        </body>

        </html>