<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="/resources/style/reset.css">
    <link rel="stylesheet" href="/resources/style/basic.css">
    <link rel="stylesheet" href="./resources/css/jquery.fullPage.css">
	
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script src="./resources/js/jquery.fullPage.js"></script>
    
	
	<title>술담화</title>
	<style type="text/css">
		video{
			object-fit:fill;
		}
	</style>
	<script>
		$(function(){
			$("#fullPage").fullpage({
				autoScrolling:true,
				scrollHorizontally:true,
				navigation:true,
				navigationPosition:"right",
				sectionsColor:[, "#FF5E00", "#FFBB00", "#FFE400", "#ABF200"],
				afterSlideLoad:function(anchorLink, index, slideAnchor, slideIndex){
					console.log("현재 슬라이드 Index : " + slideIndex);
				},
				afterLoad:function(anchorLink, index){
					console.log("현재 섹션 Index : " + index);
				}
            });
		});
	</script>
</head>
<body>
	<c:import url="./temp/temp_header.jsp"></c:import>
	<div id="fullPage">
		<video class="section" autoplay="autoplay" muted="muted" loop="loop" data-keepplaying>
			<source src="./resources/main.mp4" type="video/mp4">
		</video>
		<div class="section">
			<h2>Section1</h2>
		</div>
		<div class="section">
			<h2>Section2</h2>
		</div>
		<div class="section fp-auto-height">
			<c:import url="./temp/footer.jsp"></c:import>
		</div>
	</div>
</body>
</html>