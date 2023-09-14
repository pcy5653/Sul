<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>mypage</title>
  
  
  <link href="/resources/css/member/style.css" rel="stylesheet" />
  <link href="/resources/css/member/mypage.css" rel="stylesheet" />
  <link href="/resources/css/order/common.css" rel="stylesheet"/>


  <c:import url="../temp/bootStrap.jsp"></c:import>
</head>

<body class="sub_page">
  <c:import url="../temp/header.jsp"></c:import>
  <div class="hero_area">
    <!-- header section strats -->
    <div class="brand_box">
      <a class="navbar-brand" href="#">
        <span>
          마이페이지
        </span>
      </a>
    </div>
    <!-- end header section -->
  </div>

  <!-- nav section -->

  <section class="nav_section">
    <div class="container">
      <div class="custom_nav2">
        <nav class="navbar navbar-expand custom_nav-container ">
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="d-flex  flex-column flex-lg-row align-items-center">
              <ul class="navbar-nav  ">
                <li class="nav-item active">
                  <a class="nav-link" href="#" id="orderListBtn">주문내역</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#" id="reviewBtn">작성리뷰</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#" id="infoBtn">회원정보</a>
                </li>
                <c:if test="${member.roleNum==1}">
                  <li class="nav-item">
                    <a class="nav-link" href="/admin/main">관리자 페이지</a>
                  </li>
                    
	      	    	</c:if>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </div>
  </section>
  <section>
    <div id="page">

      
    </div>
    <div id="more" style="width:1150px;margin:0 auto;display:flex;justify-content:end;">

    </div>
    <div id="before">
      
    </div>
  </section>


  <script src="/resources/js/mypage.js"></script>
</body>

</html>