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
<c:import url="../temp/bootStrap.jsp"></c:import>

<style>
.title {font-size:2rem}

/* header.css */
header {  
	position: relative;
  	top: 0;
  	left: 0;
  	right: 0;
  	
  	}

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
	<section class="container" style="width: 800px; margin-top: 100px;">
		<h1 class="title mb-3 text-center" style="font-size:2.5rem;"onclick="location.href='${pageContext.request.contextPath}/notice/list'">공지사항</h1><br><br>
		<div class="text-conter">
		<table class="table">
		
		    <tr>
		        <th>제목</th>
		        <td>${dto.subject}</td>
		    </tr>
		    <tr>
		        <th>작성자</th>
		        <td>${dto.name}</td>
		    </tr>
		    <tr>
		        <th>작성일</th>
		        <td>${dto.createDate}</td>
		    </tr>
	 
		</table>
			<div class="mb-3" style="text-align:;">
			<label for="contents" class="form-label"></label>
				${dto.contents}
			</div>

	</div>
	<br><br>
	<form id="frm" action="">
		<input type="hidden" name="noticeNum" value="${dto.noticeNum}">
	</form>
	<a class="btn btn-outline-secondary" href="./list" style="width:80px; background-color: #f1f3f5; float : right; border: 0px;">목록</a>
	<c:if test="${member.roleNum == 1}">
		<a class="btn btn-outline-secondary" href="./update?noticeNum=${dto.noticeNum}" style='width:80px; float: left; background-color: #f1f3f5; line-height: 30px; border: 0px;'>수정</a>
		<button id="del" data-url="delete" data-delete-name="num" data-delete-num="${f.fileNum}" class="btn btn-danger c1" style='width:80px; height:40px; left; background-color: grey; line-height: 30px; border: 0px;'>삭제</button>
	</c:if>
	<br><br>
</section>


	<script type="text/javascript">
	let del = document.getElementById("del");
	const c1 = document.getElementsByClassName("c1");
	const frm = document.getElementById("frm");
	
	for(c of c1){
	    c.addEventListener("click",function(){
	        let url = this.getAttribute("data-url");
	        if(url=='delete'){
	            let result = confirm("삭제하시겠습니까?");
	            if(!result){
	                return;
	            }
	            frm.method="post";
	        }
	      
	        frm.action=url;
	        frm.submit();
	    })
	}
	let noticeNum; 
	
	function setNoticeNum(noticeNum){
		noticeNum=noticeNum;
	}
	
	</script>
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>