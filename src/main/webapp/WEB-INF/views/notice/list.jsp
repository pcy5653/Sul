<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="/resources/style/reset.css">
<link rel="stylesheet" href="/resources/style/basic.css">
<style>
.wrap {width: 1200px; height:auto; margin-bottom: 100px; margin-top: 50px;}
.tb{width: 1200px;}
.title {font-size:3rem; text-align: center; font-weight: 900;}
.head{height: 50px; background-color: #f1f3f5; width: 1200px;}
.body{
	height: 50px;
	border-top:0.5px solid #b2b2b2;
	margin-right: 200px;
	
	}

.search{
	border:0.5px  solid#e0e0e0;
	border-radius: 5px;
	}

/* header.css */
header {  
	position: relative;
  	top: 0;
  	left: 0;
  	right: 0;}

/* footer.css */
footer {margin-top:7rem;}

</style>

</head>

<body>
	<!-- 헤더 -->
            <header>
                <h1>
                    <a href="${pageContext.request.contextPath}/" class="main_logo">
                        <img src="/resources/images/main/mainLogo.png" alt="메인로고">
                    </a>
                </h1>   
                <ul>
                    <c:if test="${not empty member}">
                        <li class="not_empty_Basket"><a href="/product/basketList">장바구니
                            <!-- <img alt="" src="../resources/images/basket/cart.png" style="width: 30px; height: 30px;"> --></a>
                        </li>
                        <li class="faq"><a href="/faq/list">고객센터</a></li>
                        <li class="login"><a href="/member/logout">로그아웃</a></li>
                        <li class="join"><a href="/member/mypage">${member.name}님</a></li>
                    </c:if>
                    <c:if test="${empty member}">
                        <li class="faq"><a href="/faq/list">고객센터</a></li>
                        <li class="login"><a href="/member/login">로그인</a></li>
                        <li class="join"><a href="/member/terms">회원가입</a></li>
                    </c:if>            
                </ul>
            </header>

	<section id="container" class="wrap">
		
		<div class="title" style="margin-right: 20px; margin-bottom: 50px;" onclick="location.href='${pageContext.request.contextPath}/notice/list'"> 
			<img alt="" src="/resources/images/notice/notice.png" style="width: 50px;" height="50px;"> 공지사항
		</div>
	
		<table class="tb">
	
		<thead class="head" style="text-align: center;">
			<th width=10%>NO</th>
			<th width=50%>제목</th>
			<th width=15%>작성자</th>
			<th width=15%>작성일</th>
			<th width=10%>조회수</th>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="d" varStatus="i">
			
			<tr class="body">
				<td style="text-align: center;">${d.noticeNum}</td>
				<td><a href="./detail?noticeNum=${d.noticeNum}" style="text-align: ;">${d.subject}</a></td>
				<td style="text-align: center;">${d.name}</td>
				<td style="text-align: center;">${d.createDate}</td>
				<td style="text-align: center;">${d.hit}</td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
		
	<!-- 페이지 번호 -->
	<br>
	<nav >
	  <ul class="" style="text-align: center; height: 50px; margin-top: 20px; margin-left: 340px;">
	  <c:if test="${pager.pre}">
	      <a class="" href="./list?page=${pager.startNum-1}&kind=${param.kind}&search=${param.search}" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	   </c:if>
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">		    
		    	<a class="" href="./list?page=${i}&kind=${param.kind}&search=${param.search}" style="margin-left: 20px;">${i}</a>
			</c:forEach>
		<c:if test="${pager.next}">
		  	   	<a class="" href="./list?page=${pager.lastNum+1}&kind=${param.kind}&search=${param.search}" aria-label="Next">
		    	<span aria-hidden="true">&nbsp;&raquo;</span>
		      	</a>
		   </c:if>
	   <!-- 검색창 -->	
		<form action="./list" method="get" style="width: 20%; float: right; margin-right: 180px;">
			<div id="frm" style="width: 300px;">
				  <input type="hidden" value="${pager.page}" id="page" name="page">
				    <!-- 파라미터 이름 kind -->
				  <select name="kind" id="k" class="search">
					  <option class="kind" value="subject">제목</option>
					  <option class="kind" value="contents">내용</option>
				  </select>
				  
				  <input type="text" name="search" value="${pager.search}" class="search" placeholder="검색어를 입력하세요." style="text-align: center;">
				  <button class="button" type="submit" id="button-addon2" style="float: right;">
				  	<img alt="" src="/resources/images/searchIcon.svg" style="width: 20px; height: 20px;">
				  </button>
			</div>
	  	   
		</form>
		 </ul>
		<c:if test="${member.roleNum == 1}">
			<a class="btn btn-outline-secondary" href="./add" style="float: right; margin-right: 100px; background-color: #f1f3f5">Add</a><br><br>				
		</c:if>
	 </nav>
</section>

<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>