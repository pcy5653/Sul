<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootStrap.jsp"></c:import>
<link rel="stylesheet" href="/resources/css/star.css">
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
            
                
                
		<h1>제품 상세정보 페이지</h1>
		
		<h3>${dto.productName}</h3>
		<h3>${dto.price}</h3>
		<h3>${dto.kind}</h3>
		<h3>${dto.proof}</h3>
		<h3>${dto.contents}</h3>
		<h3>${dto.stock}</h3>
		<h3>${dto.carbonicAcid}</h3>
		<h3>${dto.taste}</h3>
		<h3>${dto.base}</h3>
		<h3>${dto.score}</h3>
		<h3>${dto.savePoint}</h3>
 	
	 	
	 	<c:forEach items="${dto.imgDTOs}" var="f">
	 		<img alt="" style="width:300px; height:300px;" src="/resources/upload/product/${f.imgName}">
	 	</c:forEach>
	 	<br>
		<form action="" id="frm">
			<input type="hidden" name="productNum" id="add" value="${dto.productNum}">
		</form>
	 	<a class="btn btn-danger" href="./update?productNum=${dto.productNum}">수정</a>
	 	<button class="btn btn-danger c1" id="del" data-url="delete" >삭제</button>
	 	<a class="btn btn-danger" href="./list">전체 목록</a>	
	 	<c:if test="${dto.kind=='takju'}">
	 	<a class="btn btn-danger" href="./list/takju">탁주 목록</a>	 
	 	</c:if>	
	 	<c:if test="${dto.kind=='chungju'}">
	 	<a class="btn btn-danger" href="./list/chungju">약청주 목록</a>	
	 	</c:if>
	 	<c:if test="${dto.kind=='wine'}">
	 	<a class="btn btn-danger" href="./list/wine">과실주 목록</a>	
	 	</c:if>
	 	<c:if test="${dto.kind=='soju'}">
	 	<a class="btn btn-danger" href="./list/soju">증류주 목록</a>	   	 	
		</c:if>
		<a class="btn btn-danger" href="./reviewAdd?productNum=${dto.productNum}">리뷰작성</a>
		<hr>
		
	<!-- 댓글 -->
	<div>

	
		<div>
			<table  class="table table-light table-hover" id="commentList">
							
			</table>
			<br>
			<div id="more">
				
			</div>

		</div>

	
	</div>

	
	</section>
	<script src="../resources/js/khj/delete.js"></script>
	<script type="text/javascript">

		let bn=$("#add").attr("value");
		let pageNum=1;
		let tp=0;

		$("#more").on("click","#moreButton" ,function(){
			
			if(pageNum>=tp){
				alert('마지막 리뷰입니다.');
				return;
			}

			pageNum++;
			getCommentList(bn, pageNum);
		})

		getCommentList(bn, pageNum);

		function getCommentList(productNum, page){
			$.ajax({
				type:"get",
				url: "./reviewList",
				data:{
					productNum:productNum,
					page:page
				},
				success:function(result){					
					$("#commentList").append(result);
					tp=$("#totalPage").attr("data-totalPage");
					if(tp>0){
					let button = '<button id="moreButton">더보기('+pageNum+'/'+tp+')</button>'
					$("#more").html(button);
					} 
				
				},
				error:function(){
					alert("관리자에게 문의")
				}
			});
		}

		</script>
</body>
</html>