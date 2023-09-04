<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootStrap.jsp"></c:import>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	
	<section class="container mt-5">
	<h1 class="my-4">제품 수정 페이지</h1>
		<form action="./update" method="post" enctype="multipart/form-data">	
		
		<input type="hidden" class="form-control" id="formGroupExampleInput" name="productNum" value="${dto.productNum}">	
		<%--<div class="mb-3">		
		  <label for="name" class="form-label">작성자</label>
		  <input type="text" name="name" class="form-control" id="name" value="${member.id}">
		</div> --%>
		<div class="mb-3">		
		  <label for="productName" class="form-label">상품명</label>
		  <input type="text" name="productName" class="form-control" id="productName" value="${dto.productName}">
		</div>
		<div class="mb-3">		
		  <label for="price" class="form-label">가격</label>
		  <input type="text" name="price" class="form-control" id="price" value="${dto.price}">
		</div>
		<div class="mb-3">		
		  <label for="kind" class="form-label">종류</label>
		  <input type="text" name="kind" class="form-control" id="kind" value="${dto.kind}">
		</div>
		<div class="mb-3">		
		  <label for="proof" class="form-label">도수</label>
		  <input type="text" name="proof" class="form-control" id="proof" value="${dto.proof}">
		</div>
		<div class="mb-3">
		  <label for="contents" class="form-label">상세설명</label>
		  <textarea class="form-control" rows="10" id="comment" name="contents">${dto.contents}</textarea>
		</div>
		<div class="mb-3">		
		  <label for="stock" class="form-label">재고</label>
		  <input type="text" name="stock" class="form-control" id="stock" value="${dto.stock}">
		</div>	
		<div class="mb-3">		
		  <label for="carbonicAcid" class="form-label">탄산</label>
		  <input type="text" name="carbonicAcid" class="form-control" id="carbonicAcid" value="${dto.carbonicAcid}">
		</div>		
		<div class="mb-3">		
		  <label for="taste" class="form-label">맛</label>
		  <input type="text" name="taste" class="form-control" id="taste" value="${dto.taste}">
		</div>
		<div class="mb-3">		
		  <label for="base" class="form-label">원료</label>
		  <input type="text" name="base" class="form-control" id="base" value="${dto.base}">
		</div>
		<div class="mb-3">		
		  <label for="savePoint" class="form-label">적립금</label>
		  <input type="text" name="savePoint" class="form-control" id="savePoint" value="${dto.savePoint}">
		</div>									
		
		<div class="mb-3">
			<button type="button" class="btn btn-primary" id="fileAdd">File추가</button>
		</div>

		<div id="fileList" class="my-5">
		 	
		</div>

		<div>
			<c:forEach items="${dto.imgDTOs}" var="f">
				<div class="alert alert-primary" role="alert">
					${f.originalName}
				</div>
				<span class="deletes" data-delete-num="${f.productImgNum}">X</span>
		 	</c:forEach>
		</div>
				
		<div class="my-3">		
			<button type="submit" class="btn btn-danger">수정</button>
		</div>
					
		</form>
	</section>
	<br><br><br><br><br><br>
	<script src="/resources/js/khj/file.js"></script>
	
</body>
</html>