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
	<h1 class="my-4">제품 등록 페이지</h1>
	
	<form action="./add" method="post" enctype="multipart/form-data" id="frm">
		<div class="mb-3">
		  <label for="productName" class="form-label">상품명</label>
		  <input type="text" name="productName" class="form-control input" id="productName" placeholder="상품명">
		  <div id="pnMsg"></div>
		</div>
		<div class="mb-3">
			<label for="price" class="form-label">가격</label>
			<input type="text" name="price" class="form-control input" id="price" placeholder="가격">
			<div id="priceMsg"></div>
		</div>
	  	
		종류
		<div class="form-check">
		  <input class="form-check-input" value="takju" type="radio" name="kind"  id="takju" checked >
		  <label class="form-check-label input" for="takju">
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
		<div id="kindMsg"></div>
		</div>
		
		<div class="mb-3">
			<label for="proof" class="form-label">도수</label>
			<input type="text" name="proof" class="form-control input" id="proof" placeholder="알콜도수">
			<div id="proofMsg"></div>
		</div>
		<div class="mb-3">
		  <label for="contents" class="form-label">상품내용</label>
		  <textarea class="form-control input" name="contents" id="contents" rows="3"></textarea>
		  <div id="contentsMsg"></div>
		</div>	
		<div class="mb-3">
			<label for="stock" class="form-label">재고 수량</label>
			<input type="text" name="stock" class="form-control input" id="stock" placeholder="재고수량">
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
		<div id="caMsg"></div>
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
			<div id="tasteMsg"></div>
		  </div>

		<div class="mb-3">
			<label for="base" class="form-label">원료</label>
			<input type="text" name="base" class="form-control input" id="base" placeholder="원료">
			<div id="baseMsg"></div>
		</div>
		
		<div class="mb-3">
			<label for="capacity" class="form-label">용량</label>
			<input type="text" name="capacity" class="form-control input" id="capacity" placeholder="용량">
			<div id="capacityMsg"></div>
		</div>
		
		<div class="mb-3">
			<label for="expiryDate" class="form-label">유통기한</label>
			<input type="text" name="expiryDate" class="form-control input" id="expiryDate" placeholder="용량">
			<div id="expiryDateMsg"></div>
		</div>
		
		<div class="mb-3">
			<label for="storageMethod" class="form-label">보관방법</label>
			<input type="text" name="storageMethod" class="form-control input" id="storageMethod" placeholder="용량">
			<div id="storageMethodMsg"></div>
		</div>
		
		<div class="mb-3">
  			<label for="pic" class="form-label">사진첨부</label>
  			<input type="file" name="photos" class="form-control" id="pic" placeholder="사진을 첨부해주세요.">
		</div>

		

		<div class="my-3">
			<button type="submit" class="btn btn-danger" id="btn">상품등록</button>
		</div>

	</form>
	</section>
	<script src="/resources/js/khj/add.js"></script>
</body>
</html>