<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/header.jsp"></c:import>
<style>
.wrap {width: 1000px; height:500px; margin-bottom: 200px;}
.tb{width: 1000px;	
	text-align: center; 

	
	}
.title {font-size:2.5rem; text-align: center;}
.head{height: 50px; background-color: #f1f3f5; width: 1200px;}
.body{
	height: 40px;
	border-top:0.5px solid #b2b2b2;
	margin-right: 200px;
	
	}

.search{
	border:0.5px  solid#e0e0e0;
	border-radius: 3px;
	}

	
/* header.css */
header {position: relative; height: 100px; padding: 0;}

/* footer.css */
footer {margin-top:7rem;}

</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/ScrollTrigger.min.js"></script>
<script src="/resources/js/main.js"></script>

</head>

<body>
	<!-- 헤더 -->
        <header>
            <h1>
                <a href="${pageContext.request.contextPath}/" class="main_logo">
					<img src="/resources/images/main/main_logo.png" alt="메인로고">
                </a>
            </h1>
          
            <ul>
                <c:if test="${not empty member}">
                <li class="not_empty_Basket"><a href="/product/basketList">
            		<img alt="" src="../resources/images/basket/cart.png" style="width: 30px; height: 30px;"></a></li>
	      		<li class="login"><a href="/member/logout">로그아웃</a></li>
	      		<li class="join"><a href="/member/mypage">mypage</a></li>
	      		</c:if>
				<c:if test="${empty member}">
	      		<li class="login"><a href="/member/login">로그인</a></li>
	      		<li class="join"><a href="/member/terms">회원가입</a></li>
	      		</c:if>            </ul>
        </header>

	<section id="container" class="wrap">
		
		<div class="title" style="height:80px; margin-right: 20px; margin-bottom: 50px;"> 
			<img alt="" src="/resources/images/notice/notice.png" style="width: 50px;" height="50px;"> 공지사항
		</div>
	
		<table class="tb">
	
		<thead class="head">
			<th width=10%>NO</th>
			<th width=50%>SUBJECT</th>
			<th width=15%>NAME</th>
			<th width=15%>DATE</th>
			<th width=10%>HIT</th>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="d" varStatus="i">
			
			<tr class="body">
				<td>${d.noticeNum}</td>
				<td><a href="./detail?noticeNum=${d.noticeNum}" class="">${d.subject}</a></td>
				<td>${d.name}</td>
				<td>${d.createDate}</td>
				<td>${d.hit}</td>
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
		<form action="./list" method="get" style="width: 20%; float: right; margin-right: 210px;">
			<div id="frm" style="width: 300px;">
				  <input type="hidden" value="${pager.page}" id="page" name="page">
				    <!-- 파라미터 이름 kind -->
				  <select name="kind" id="k" class="search">
					  <option class="kind" value="subject">Subject</option>
					  <option class="kind" value="contents">Contents</option>
				  </select>
				  
				  <input type="text" name="search" value="${pager.search}" class="search" placeholder="검색어를 입력하세요.">
				  <button class="btn btn-secondary" type="submit" id="button-addon2" style="float: right;">
				  	<img alt="" src="/resources/images/search.png" style="width: 20px; height: 20px;">
				  </button>
			</div>
	  	   
		</form>
		 </ul>
		<c:if test="${member.roleNum == 1}">
			<a class="btn btn-outline-secondary" href="./add" style="float: right; margin-right: 50px; background-color: #f1f3f5">Add</a><br><br>				
		</c:if>
	 </nav>
</section>
</div>
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>