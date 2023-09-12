<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootStrap.jsp"></c:import>

<link rel="stylesheet" href="../resources/css/product/detail.css">
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
	
	<div id="outerWrap">
		<div id="contents">
			<div id="productInfo">
				<img src="../resources/images/product/${dto.productName}.jpg">
				<div>
					<p id="name">${dto.productName}</p>
					<p id="subTitle">${dto.contents}</p>
					<p id="score">
						<img src="../resources/images/product/star-icon.svg">
						<span>${dto.score}</span>
						<span class="reviewCount"></span>
					</p>
					<p>맛 : ${dto.taste}</p>
					<p>원료 : ${dto.base}</p>
					<p>도수 : ${dto.proof}%</p>
					<p>탄산 : ${dto.carbonicAcid}</p>
					<p>용량 : ${dto.capacity}ml</p>
					<div id="price">
						<p>판매 가격</p>
						<p><fmt:formatNumber value="${dto.price}" pattern="#,###" />원</p>
					</div>
					<div id="note">
						<p>유통기한 : ${dto.expiryDate}</p>
						<p>보관 방법 : ${dto.storageMethod}</p>
					</div>
				</div>
			</div>
			<div id="detail">
				<img src="../resources/images/product/detail/${dto.productName}.jpg">
			</div>
			
			<c:if test="${member.roleNum eq 1}">
			<hr>
			<a class="btn btn-outline-danger" href="./update?productNum=${dto.productNum}&taste=${dto.taste}&carbonicAcid=${dto.carbonicAcid}&kind=${dto.kind}">수정</a>
	 		<button class="btn btn-outline-danger c1" id="del" data-delete-name="productNum" data-delete-num="${dto.productNum}">삭제</button>
			</c:if>
		
			<div id="reviewWrap">
				<!-- AJAX 처리 -->
			</div>
			<div id="more">
			</div>
			<div id="dummy">
			</div>
		</div>
		<div id="sideBar">
			<div>
				<p class="title">수량</p>
				<div id="counter">
					<button class="minus"></button>
					<input type="number" value="1" min="1" max="${dto.stock}" readonly="readonly" class="numBox">
					<button class="plus"></button>
				</div>
			</div>
			<div id="total">
				<p class="title">총 상품 가격</p>
				<p><span>${dto.price}</span>원</p>
			</div>
			<div id="buy">
				<button class="addBasket_btn">
					<img src="../resources/images/product/cart-icon.png">
					<span>장바구니</span>
				</button>
				<button id="now" onclick="buyNow()">바로 구매</button>
			</div>
		</div>
	</div>
	
	<form role="form" method="post">
		<input type="hidden" name="productNum" value="${dto.productNum}" id="add" class="productNum" />
		<input type="hidden" name="stock" value="${dto.stock}" class="stock" />
	</form>

	<script src="../resources/js/khj/delete.js"></script>

	<script type="text/javascript">
		let bn=$("#add").attr("value");
		let pageNum=1;
		let tp=0;
		
		getCommentList(bn, pageNum, true);
		
		function getCommentList(productNum, page, isFirst = false){
			$.ajax({
				type:"get",
				url: "./reviewList",
				data:{
					productNum:productNum,
					page:page
				},
				success:function(result){
					$("#reviewWrap").append(result);
					tp=$("#totalPage").attr("data-totalPage");
					if(tp>0){
						let button = '<span id="moreButton">더 많은 리뷰('+pageNum+'/'+tp+')</span>'
						$("#more").html(button);
					} else{
						let button = '<span id="moreButton"><img src="../resources/images/firstReview.jpg"></span>'
						$("#dummy").html(button);					
					}
					if(isFirst){
						let reviewTotal = $("#reviewTotal").val();
						$("#score > .reviewCount").html("[" + reviewTotal + " 리뷰]");
					}
				},
				error:function(){
					alert("관리자에게 문의");
				}
			});
		}
		
		$("#more").on("click","#moreButton" ,function(){
			
			if(pageNum>=tp){
				alert('마지막 리뷰입니다.');
				return;
			}

			pageNum++;
			getCommentList(bn, pageNum);
		});
		
		// '바로 구매'
		function buyNow(){
			let form = $("<form></form>");
			form.attr("method", "POST");		
			form.attr("action", "../order/")
			form.append($("<input />", {type:"hidden", name:"orderProducts[0].productNum", value:${dto.productNum}}));
			form.append($("<input />", {type:"hidden", name:"orderProducts[0].orderCount", value:$(".numBox").val()}));
			form.appendTo("body");
			form.submit();
		}
	</script>
	<script type="text/javascript">
	
	//수량 , 장바구니 버튼
	
	function getTotal(type){
		let total = parseInt($("#total span").html());
		total = (type == "plus") ? total +  ${dto.price} : total - ${dto.price};
		$("#total span").html(total);
	}
	
	$(".plus").click(function () {
	    let num = $(".numBox").val();
	    let plusNum = Number(num) + 1;
	    
	    if (plusNum >= ${dto.stock}) {
	        $(".numBox").val(num);
	    } else {
	        $(".numBox").val(plusNum);
	        getTotal("plus");
	    }
	});

	$(".minus").click(function () {
	    let num = $(".numBox").val();
	    let minusNum = Number(num) - 1;
	    
	    if (minusNum <= 0) {
	        $(".numBox").val(num);
	    } else {
	        $(".numBox").val(minusNum);
	        getTotal("minus");
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
	                if(confirm("로그인 창으로 이동하시겠습니까?")){
	                	location.href = "/member/login";
	                }
	              
	            }
	        },
	        error: function () {
	            alert("장바구니에 담을 수 없습니다.");
	            console.log(typeof productCount);
	        }

	    }); 
	});
	</script>
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>