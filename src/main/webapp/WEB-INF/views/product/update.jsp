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
		<form action="./update" method="post" id="frm" enctype="multipart/form-data">	
		
		<input type="hidden" class="form-control" id="productName" name="productNum" value="${dto.productNum}">	
		<div class="mb-3">		
		  <label for="productName" class="form-label">상품명</label>
		  <input type="text" name="productName" class="form-control" id="productName" value="${dto.productName}">
		  <div id="pnMsg"></div>
		  
		</div>
		<div class="mb-3">		
		  <label for="price" class="form-label">가격</label>
		  <input type="text" name="price" class="form-control" id="price" value="${dto.price}">
		  <div id="priceMsg"></div>
		</div>
		
		종류
		<div class="form-check">
		  <input class="form-check-input" value="takju" type="radio" name="kind"  id="takju" checked >
		  <label class="form-check-label" for="takju">
		   탁주
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" value="chungju" type="radio" name="kind" id="chungju" >
		  <label class="form-check-label" for="chungju">
		   청주
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" value="wine" type="radio" name="kind"  id="wine" >
		  <label class="form-check-label" for="wine">
		   과실주
		</label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" value="soju" type="radio" name="kind"  id="soju" >
		  <label class="form-check-label" for="soju">
		   증류주
		</label>
		</div>
		
		<div class="mb-3">		
		  <label for="proof" class="form-label">도수</label>
		  <input type="text" name="proof" class="form-control" id="proof" value="${dto.proof}">
		  <div id="proofMsg"></div>
		</div>
		<div class="mb-3">
		  <label for="contents" class="form-label">상세설명</label>
		  <textarea class="form-control" rows="5" id="contents" name="contents">${dto.contents}</textarea>
		  <div id="contentsMsg"></div>
		</div>
		<div class="mb-3">		
		  <label for="stock" class="form-label">재고 수량</label>
		  <input type="text" name="stock" class="form-control" id="stock" value="${dto.stock}">
		  <div id="stockMsg"></div>
		</div>	
		
		탄산
		<div class="form-check">
		  <input class="form-check-input" value="none" type="radio" name="carbonicAcid"  id="none" checked >
		  <label class="form-check-label" for="none">
		    없음
		  </label>
		 </div>
		<div class="form-check">
		  <input class="form-check-input" value="weak" type="radio" name="carbonicAcid"  id="weak" >
		  <label class="form-check-label" for="weak">
		    약한
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" value="middle" type="radio" name="carbonicAcid" id="middle" >
		  <label class="form-check-label" for="middle">
		   중간
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" value="strong" type="radio" name="carbonicAcid"  id="strong" >
		  <label class="form-check-label" for="strong">
		   강한
		</label>
		</div>	
		
		맛
		<div class="form-check">
			<input class="form-check-input" value="sour" type="radio" name="taste"  id="sour" checked >
			<label class="form-check-label" for="sour">
			  신맛
			</label>
		  </div>
		  <div class="form-check">
			<input class="form-check-input" value="sweet" type="radio" name="taste" id="sweet" >
			<label class="form-check-label" for="sweet">
			  단맛
			</label>
		  </div>
		
		<div class="mb-3">		
		  <label for="base" class="form-label">원료</label>
		  <input type="text" name="base" class="form-control" id="base" value="${dto.base}">
		  <div id="baseMsg"></div>
		</div>
		<div class="mb-3">		
		  <label for="savePoint" class="form-label">적립금</label>
		  <input type="text" name="savePoint" class="form-control" id="savePoint" value="${dto.savePoint}">
		</div>						
		
		<div class="mb-3">
			<label for="capacity" class="form-label">용량</label>
			<input type="text" name="capacity" class="form-control input" id="capacity" value="${dto.capacity}">
			<div id="capacityMsg"></div>
		</div>
		
		<div class="mb-3">
			<label for="expiryDate" class="form-label">유통기한</label>
			<input type="text" name="expiryDate" class="form-control input" id="expiryDate" value="${dto.expiryDate}">
			<div id="expiryDateMsg"></div>
		</div>
		
		<div class="mb-3">
			<label for="storageMethod" class="form-label">보관방법</label>
			<input type="text" name="storageMethod" class="form-control input" id="storageMethod" value="${dto.storageMethod}">
			<div id="storageMethodMsg"></div>
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
			<button type="submit" class="btn btn-danger" id="btn">수정</button>
		</div>
					
		</form>
	</section>
	<br><br><br><br><br><br>
	<script src="/resources/js/khj/file.js"></script>
	<script src="/resources/js/khj/add.js"></script>
	
</body>
</html>