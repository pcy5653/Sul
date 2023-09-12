<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/bootStrap.jsp"></c:import>
<style>
/* header.css */
.viewport {}
.headerWrap {
    position: relative !important; top:0px !important;
    background-color: rgba(255,255, 255,0) !important;
}
header {position: absolute !important;left:0px !important; top:0px !important;
background-color: rgba(255,255, 255,0) !important;}

</style>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	
	<section class="container mt-5">
	<h1 class="my-4">리뷰 등록 페이지</h1>
	
	<form action="./reviewAdd" method="post" enctype="multipart/form-data" id="frm">
		<input type="hidden" name="productNum" value="${dto.productNum}">
		<input type="hidden" name="productName" value="${dto.productName}">
		
		<div class="mb-3">
		 	 <label for="reviewContents" class="form-label">리뷰 내용</label>
		 	 <textarea class="form-control" name="reviewContents" id="reviewContents" rows="3"></textarea>
		 	 <div id="rcMsg"></div>
		</div>	

		
		<div class="mb-3">
				<h4>평점</h4>
				<select name="reviewStar">
					<option value="5">★★★★★</option>
					<option value="4">★★★★</option>
					<option value="3">★★★</option>
					<option value="2">★★</option>
					<option value="1">★</option>
				</select>
			</div>
		
		<div class="mb-3">
  			<label for="pic" class="form-label">사진첨부</label>
  			<input type="file" name="photos" class="form-control" id="pic" placeholder="사진을 첨부해주세요.">
		</div>
		<div class="mb-3">
  			<label for="pic" class="form-label">사진첨부</label>
  			<input type="file" name="photos" class="form-control" id="pic" placeholder="사진을 첨부해주세요.">
		</div>

		

		<div class="my-3">
			<button type="submit" class="btn btn-danger">리뷰등록</button>
		</div>

	</form>
	</section>

	<script src="/resources/js/khj/review.js"></script>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>