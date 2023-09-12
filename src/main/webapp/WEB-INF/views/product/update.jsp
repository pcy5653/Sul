<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<c:choose>
		<c:when test="${dto.kind eq 'takju'}">
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
		</c:when>
		
		<c:when test="${dto.kind eq 'chungju'}">
		<div class="form-check">
		  <input class="form-check-input" value="takju" type="radio" name="kind"  id="takju">
		  <label class="form-check-label" for="takju">
		   탁주
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" value="chungju" type="radio" name="kind" id="chungju" checked>
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
		</c:when>
		
		<c:when test="${dto.kind eq 'wine'}">
		<div class="form-check">
		  <input class="form-check-input" value="takju" type="radio" name="kind"  id="takju"  >
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
		  <input class="form-check-input" value="wine" type="radio" name="kind"  id="wine" checked>
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
		</c:when>
		
		<c:otherwise>
		<div class="form-check">
		  <input class="form-check-input" value="takju" type="radio" name="kind"  id="takju" >
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
		  <input class="form-check-input" value="soju" type="radio" name="kind"  id="soju" checked>
		  <label class="form-check-label" for="soju">
		   증류주
		</label>
		</div>
		</c:otherwise>
		</c:choose>
		
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
		
		<!-- 탄산 정도 선택-->
		탄산
		<c:choose>
		<c:when test="${dto.carbonicAcid eq '없음'}">
		<div class="form-check">
		  <input class="form-check-input" value="없음" type="radio" name="carbonicAcid"  id="없음" checked >
		  <label class="form-check-label" for="없음">
		    없음
		  </label>
		 </div>
		<div class="form-check">
		  <input class="form-check-input" value="약함" type="radio" name="carbonicAcid"  id="약함" >
		  <label class="form-check-label" for="약함">
		    약함
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" value="중간" type="radio" name="carbonicAcid" id="중간" >
		  <label class="form-check-label" for="중간">
		   중간
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" value="강함" type="radio" name="carbonicAcid"  id="강함" >
		  <label class="form-check-label" for="강함">
		   강함
		</label>
		</div>	
		</c:when>
		
		<c:when test="${dto.carbonicAcid eq '약함'}">		
		<div class="form-check">
		  <input class="form-check-input" value="없음" type="radio" name="carbonicAcid"  id="없음"  >
		  <label class="form-check-label" for="없음">
		    없음
		  </label>
		 </div>
		<div class="form-check">
		  <input class="form-check-input" value="약함" type="radio" name="carbonicAcid"  id="약함" checked>
		  <label class="form-check-label" for="약함">
		    약함
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" value="중간" type="radio" name="carbonicAcid" id="중간" >
		  <label class="form-check-label" for="중간">
		   중간
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" value="강함" type="radio" name="carbonicAcid"  id="강함" >
		  <label class="form-check-label" for="강함">
		   강함
		</label>
		</div>	
		</c:when>
		
		<c:when test="${dto.carbonicAcid eq '중간'}">
				<div class="form-check">
		  <input class="form-check-input" value="없음" type="radio" name="carbonicAcid"  id="없음"  >
		  <label class="form-check-label" for="없음">
		    없음
		  </label>
		 </div>
		<div class="form-check">
		  <input class="form-check-input" value="약함" type="radio" name="carbonicAcid"  id="약함" >
		  <label class="form-check-label" for="약함">
		    약함
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" value="중간" type="radio" name="carbonicAcid" id="중간" checked>
		  <label class="form-check-label" for="중간">
		   중간
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" value="강함" type="radio" name="carbonicAcid"  id="강함" >
		  <label class="form-check-label" for="강함">
		   강함
		</label>
		</div>	
		</c:when>
		
		<c:otherwise>
				<div class="form-check">
		  <input class="form-check-input" value="없음" type="radio" name="carbonicAcid"  id="없음"  >
		  <label class="form-check-label" for="없음">
		    없음
		  </label>
		 </div>
		<div class="form-check">
		  <input class="form-check-input" value="약함" type="radio" name="carbonicAcid"  id="약함" >
		  <label class="form-check-label" for="약함">
		    약함
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" value="중간" type="radio" name="carbonicAcid" id="중간" >
		  <label class="form-check-label" for="중간">
		   중간
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" value="강함" type="radio" name="carbonicAcid"  id="강함" checked>
		  <label class="form-check-label" for="강함">
		   강함
		</label>
		</div>	
		</c:otherwise>
		</c:choose>		
		
		맛
		<c:choose>
		<c:when test="${dto.taste eq '신맛'}">
		<div class="form-check">
			<input class="form-check-input" value="신맛" type="radio" name="taste"  id="신맛" checked>
			<label class="form-check-label" for="신맛">
			  신맛
			</label>
		  </div>
		  <div class="form-check">
			<input class="form-check-input" value="단맛" type="radio" name="taste" id="단맛" >
			<label class="form-check-label" for="단맛">
			  단맛
			</label>
		  </div>
		</c:when>
		<c:otherwise>
		<div class="form-check">
			<input class="form-check-input" value="신맛" type="radio" name="taste"  id="신맛" >
			<label class="form-check-label" for="신맛">
			  신맛
			</label>
		  </div>
		  <div class="form-check">
			<input class="form-check-input" value="단맛" type="radio" name="taste" id="단맛" checked>
			<label class="form-check-label" for="단맛">
			  단맛
			</label>
		  </div>
		  </c:otherwise>
		  </c:choose>
		  
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
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>