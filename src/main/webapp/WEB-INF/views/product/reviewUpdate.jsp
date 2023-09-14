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
	<h1 class="my-4">리뷰 수정 페이지</h1>
	
	<form action="../product/reviewUpdate" method="post" enctype="multipart/form-data" id="frm">
		<input type="hidden" name="reviewNum" value="${dto.reviewNum}">
		<input type="hidden" name="productNum" value="${dto.productNum}">
		
		<div class="mb-3">
		 	 <label for="reviewContents" class="form-label">리뷰 내용</label>
		 	 <textarea class="form-control" name="reviewContents" id="reviewContents" rows="3">${dto.reviewContents}</textarea>
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
			<button type="button" class="btn btn-primary" id="fileAdd">File추가</button>
		</div>
		
		<div id="fileList" class="my-5">		 	
		</div>
		
		<div>
   			<c:choose>
        		<c:when test="${not empty dto.reviewFileDTOs[0].fileName}">
           			<c:forEach items="${dto.reviewFileDTOs}" var="f">
                		<div class="alert alert-primary" role="alert">
                    		${f.originalName}
                		</div>
                		<span class="deletes" data-delete-num="${f.fileNum}">X</span>
            		</c:forEach>
        		</c:when>
       	 	<c:otherwise>
            <!-- Display a message or take alternative action when there are no files. -->
            <p>등록된 사진이 없습니다.</p>
        </c:otherwise>
    </c:choose>
	</div>



		

		<div class="my-3">
			<button type="submit" class="btn btn-danger">리뷰수정</button>
		</div>

	</form>
	</section>
	<script src="/resources/js/khj/file2.js"></script>
	<script src="/resources/js/khj/review.js"></script>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>