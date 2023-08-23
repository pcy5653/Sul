<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/resources/style/reset.css">

	<title>4조 프로젝트</title>
</head>
<body>
	<c:import url="./temp/header.jsp"></c:import>
	
	<main>
		<section id="video_wrap">
			<div class="video_div">
				<video src="" type="" autoplay loop muted></video>
			</div>
			<!-- /video_wrap -->
		</section>
		<section id="nav">
			<div>
				<ul>
					<li><a href="/qna/list" id="list_Go">1:1문의</a></li>
				</ul>
			</div>
		</section>
	</main>
	<c:if test="${empty member}">
		<script type="text/javascript">
			const list = document.getElementById('list_Go');
			list.addEventListener("click", function(){
				alert("로그인이 필요합니다.");
				//////////////////////location.href="/member/login";
			})
		</script>
	</c:if>
	<c:import url="./temp/footer.jsp"></c:import>
	<script src="/resources/js/main.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/ScrollTrigger.min.js"></script>
</body>
</html>