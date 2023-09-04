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
    <section>        
         <form role="form" method="post">
            <input type="hidden" class="productNum" value="${dto.productNum}" />
            <input type="hidden" value="${dto.stock}" class="stock" />
        </form>       
                
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
 	
	 	<br>
        <div class="label">
             <label>수량</label>
        </div>
        <br>
	 	<div class="basketStock">
            <button type="button" class="minus">
            	<img alt="" src="/resources/images/basket/icon_minus_counter_inactive.png" style="width: 15px">
            </button>
            <input type="number" class="numBox" min="1" max="${dto.stock}" value="1" readonly="readonly" style="width: 30px">
            <button type="button" class="plus">
            	<img alt="" src="/resources/images/basket/icon_plus_counter.png" style="width: 15px">
            </button>
        </div><br>
	 
	 	<c:forEach items="${dto.imgDTOs}" var="f">
	 		<img alt="" style="width:300px; height:300px;" src="/resources/upload/product/${f.imgName}">
	 	</c:forEach>
	 	<br>
		<form action="" id="frm">
			<input type="hidden" name="productNum" id="add" value="${dto.productNum}">
			<input type="hidden" name="stock" value="${dto.stock}">
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
		<button class="btn btn-danger" onclick="buyNow()">바로 구매</button>
		<div class="addToBasket">
            <button type="button" class="addBasket_btn btn btn-danger">장바구니</button>
        </div>
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
					alert("관리자에게 문의");
				}
			});
		}
		
		// '바로 구매'
		function buyNow(){
			let form = $("<form></form>");
			form.attr("method", "POST");		
			form.attr("action", "../order/")
			form.append($("<input />", {type:"hidden", name:"orderProducts[0].productNum", value:${dto.productNum}}));
			form.append($("<input />", {type:"hidden", name:"orderProducts[0].orderCount", value:1}));
			form.appendTo("body");
			form.submit();
		}
	</script>
	<script type="text/javascript">
	//수량 , 장바구니 버튼

	$(".plus").click(function () {
	    let num = $(".numBox").val();
	    let plusNum = Number(num) + 1;
	    
	    if (plusNum >= ${dto.stock}) {
	        $(".numBox").val(num);
	    } else {
	        $(".numBox").val(plusNum);
	    }
	});

	$(".minus").click(function () {
	    let num = $(".numBox").val();
	    let minusNum = Number(num) - 1;
	    
	    if (minusNum <= 0) {
	        $(".numBox").val(num);
	    } else {
	        $(".numBox").val(minusNum);
	    }
	});

	$(".addBasket_btn").click(function () {
	    let productNum = $(".productNum").val();
	    let productCount = $(".numBox").val();

	    let data = {
	        productNum: productNum,
	        productCount: productCount
	    };
	  $.ajax({
	        url: "/product/basketList/addBasket",
	        type: "post",
	        data: data,
	        success: function (result) {
	     
	            if (result === 1) {
	                alert("장바구니에 담기 성공했습니다.");
	                $(".numBox").val("1");
	                if(confirm("장바구니로 이동하시겠습니까?")){
	                	location.href = "/product/basketList";
	                }
	            } else{
	                alert("회원만 사용할 수 있습니다.");
	                $(".numBox").val("1");
	              
	            }
	        },
	        error: function () {
	            alert("장바구니에 담을 수 없습니다.");
	            console.log(typeof productCount);
	        }

	    }); 
	});
	</script>
</body>
</html>