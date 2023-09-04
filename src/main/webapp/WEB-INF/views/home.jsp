<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/resources/style/reset.css">
	<link rel="stylesheet" href="/resources/style/basic.css">
	<title>4조 프로젝트</title>
</head>
<body>
	<c:import url="./temp/header.jsp"></c:import>
	
	<main>
		<section id="video_wrap">
			<div class="video_div">
				<video src="/resources/main_bnr.mp4" type="video.mp4" autoplay loop muted></video>
			</div>
			<!-- /video_wrap -->
		</section>
		<section id="nav">
			<div>
				
			</div>
		</section>
	</main>
	<c:import url="./temp/footer.jsp"></c:import>
	<script src="/resources/js/main.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/ScrollTrigger.min.js"></script>
</body>

</html>