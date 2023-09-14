<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>${member.name}님의 장바구니</title>
<link rel="stylesheet" href="/resources/css/basket/basketList.css">
<link rel="stylesheet" href="/resources/style/reset.css">
<link rel="stylesheet" href="/resources/style/basic.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/ScrollTrigger.min.js"></script>
<script src="/resources/js/main.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<style type="text/css">
/* header.css */
header {  
	position: fixed;
  	top: 0;
  	left: 0;
  	right: 0;
  	}

/* footer.css */
footer {margin-top:7rem;}

</style>
</head>
<body>
		<!-- 헤더 -->
            <header>
                <h1>
                    <a href="${pageContext.request.contextPath}/" class="main_logo">
                        <img src="/resources/images/main/mainLogo.png" alt="메인로고">
                    </a>
                </h1>    
                <ul>
                    <c:if test="${not empty member}">
                        <li class="not_empty_Basket"><a href="/product/basketList">장바구니
                            <!-- <img alt="" src="../resources/images/basket/cart.png" style="width: 30px; height: 30px;"> --></a>
                        </li>
                        <li class="faq"><a href="/faq/list">고객센터</a></li>
                        <li class="login"><a href="/member/logout">로그아웃</a></li>
                        <li class="join"><a href="/member/mypage">${member.name}님</a></li>
                    </c:if>
                    <c:if test="${empty member}">
                        <li class="faq"><a href="/faq/list">고객센터</a></li>
                        <li class="login"><a href="/member/login">로그인</a></li>
                        <li class="join"><a href="/member/terms">회원가입</a></li>
                    </c:if>            
                </ul>
            </header>
<!-- 장바구니 상품 없을 때 -->
<c:if test="${empty basketList}">    
   <div style="text-align: center; /* margin-top: 150px; margin-bottom: 90px; margin-left: 450px; */ margin: auto; margin-top: 200px;'" class="above">
       <img src="/resources/images/basket/cartList.png" style="width: 32px; height: 32px; ">
         <div style="font-size: 1.5em; margin-top: 25px;">장바구니가 비었습니다.</div><br>
             <a href="./list" class="btn">쇼핑하러 가기</a>
   </div>
        
</c:if>
<c:if test="${not empty basketList}">
    <section id="container" style="margin-top: 100px;">
        <div id="container_box" class="wrap">

            <section id="content">

                <ul>
                    <li>
                        <div class="allCheck" style="width:170px; float:left; margin-left: 50px">
                            <input type="checkbox" name="allCheck" id="allCheck" checked style="margin-left: 10px;"/>
                            <label style="width: 100px; float:right;" for="allCheck">모두 선택</label>

                            <script>
                                $("#allCheck").click(function () {
                                    var chk = $("#allCheck").prop("checked");
                                    if (chk) {
                                        $(".chBox").prop("checked", true);
                                    } else {
                                        $(".chBox").prop("checked", false);
                                    }
                                });
                            </script>

                        </div>

                        <div class="delBtn" style="width:100px; float:left; text-align: left; margin-right: 10px;">
                            <button type="button" class="selectDelete_btn">선택 삭제</button>

                            <script>
                                $(".selectDelete_btn").click(function () {
                                    let confirm_val = confirm("삭제하시겠습니까?");
                                    

                                    if (confirm_val) {
                                        let checkArr = new Array();

                                        // 체크된 체크박스의 갯수만큼 반복
                                        $("input[class='chBox']:checked").each(function () {
                                            checkArr.push($(this).attr("data-basketNum"));  // 배열에 데이터 삽입
                                        });

                                        $.ajax({
                                            url: "/product/basketList/deleteBasket",
                                            type: "post",
                                            data: { chbox: checkArr },
                                            success: function (result) {

                                                if (result == '1') {
                                                    location.href = "/product/basketList";
                                                } else {
                                                    alert("삭제 실패");
                                                }
                                            }
                                        });
                                    }
                                });
                            </script>

                        </div>
                    </li>

                    <%-- jsp상의 변수 선언 --%>
                    <c:set var="sum" value="0" />

                    <c:forEach items="${basketList}" var="basketList">
                        <li>
                            <div class="checkBox ch" style="width: 16px; height: 16px;">
                                <input type="checkbox" name="chBox" class="chBox" data-basketNum="${basketList.basketNum}" checked/>
                            </div>
                            <script>
                                $(".chBox").click(function () {
                                    $("#allCheck").prop("checked", false);
                                    updateTotalPrice();
                                });
                            </script>

                            <div class="productInfo box">
                                <input type="hidden" class="productNum" value="${basketList.productNum}" />
                                <input type="hidden" class="stock" value="${basketList.stock}" />
                                <div style="width:120px; height:100px; float:left;">
                                    <img alt="" style="width:100px; height:100px; " src="/resources/images/product/${basketList.productName}.jpg" onclick="location.href='${pageContext.request.contextPath}/product/detail?productNum=${basketList.productNum}'">
                                </div>
                                <p>
                                <div class="price" style="width:250px; height:80px; float:left; text-align: center; margin-top: 30px; font-weight: bold;" onclick="location.href='${pageContext.request.contextPath}/product/detail?productNum=${basketList.productNum}'">
                                    ${basketList.productName}
                                	<div class="point" style="font-size: 13px; margin-left: 20px;"> <img alt="" src="/resources/images/basket/point.png" style="width: 15px; height: 15px;  margin-top: 4px;"> <input value="${basketList.savePoint * basketList.productCount}" readonly="readonly" style="width: 45px; border: 0px; text-align: left;"></div>
                                    <div class="money" style="margin-top: 5px;">상품금액 : <fmt:formatNumber pattern="###,###,###" value="${basketList.price}" /> 원</div>
                                </div>


                                <div class="basketStock" style="width:130px; height:100px; float:left; margin-top: 30px; margin-left: 60px;">
                                    <div class="amount">
                                        <button type="button" class="minus">-</button>
                                        <input type="number" class="numBox" pattern="\d*" maxlength="3" value="${basketList.productCount}" style="width: 40px; text-align: right; border-radius:50px; border:0.5px solid #e0e0e0; "readonly="readonly">
                                        <button type="button" class="plus">+</button>
                                    </div>
                                    <br>
                                    <button type="button" class="update_btn" data-product-Num="${basketList.productNum}" style="border-radius:10px; margin-left: 12px; margin-bottom: 3px; width: 40px; height: 20px; background-color: rgb(255,187,0);">수정</button>
                                	<div class="text" style=" width:110px; font-size: 8px; margin-top: 5px; margin-left: 12px;">
                                	<img alt="" src="/resources/images/basket/circle.png" style="width: 10px; height: 10px;">
                                	수정버튼을 눌러주세요!</div>
                                </div>

                                <script>
								    $(".update_btn").click(function () {
								    	let productNum = $(this).attr("data-product-Num");
								        let productCount = $(this).closest("li").find(".numBox").val();
							
								        let requestData = {
								            productNum: productNum,
								            productCount: productCount
								        };
								        
								        $.ajax({
								            url: "/product/basketList/updateBasket",
								            type: "post",
								            contentType: "application/json", 
								            data: JSON.stringify(requestData), 
								            success: function (result) {
								            	console.log(result);
								            	
								            	if (result === 1) {
								                    location.href = "/product/basketList";
								                } else {
								                    alert("수정 실패");
								                }
								            },
								            error: function () {
								                alert("AJAX 요청 실패");
								            }
								        });
								
								        updateTotalPrice();
								    });
								</script>

                                <div class="delete" style="width:30px; height:50px; float:right; text-align: right; margin-top: 30px; ">
                                    <button type="button" class="delete_${basketList.basketNum}_btn" data-basketNum="${basketList.basketNum}">
                                        x
                                    </button>
                                    <script>
                                        $(".delete_${basketList.basketNum}_btn").click(function () {
                                            var confirm_val = confirm("삭제하시겠습니까?");

                                            if (confirm_val) {
                                                var checkArr = new Array();

                                                checkArr.push($(this).attr("data-basketNum"));

                                                $.ajax({
                                                    url: "/product/basketList/deleteBasket",
                                                    type: "post",
                                                    data: { chbox: checkArr },
                                                    success: function (result) {
                                                        if (result == '1') {
                                                            location.href = "/product/basketList";
                                                        } else {
                                                            alert("삭제 실패");
                                                        }
                                                    }
                                                });
                                            }
                                        });
                                    </script>
                                </div>
                                </p>

                            </div>
                        </li>

                        <%-- 반복할 때마다 sum에 상품 가격(price)*상품 갯수(productCount)만큼을 더함 --%>
                        <c:set var="sum" value="${sum + (basketList.price * basketList.productCount)}" />

                    </c:forEach>
                </ul>
			<div class="style__CartBillWrapper-sc-zhmz48-5 calculate">
                <div class="bill">
                    <div class="title">계산서</div>
                    <div class="solid-top"></div>
                    <div class="content">
                        <div class="row">
                            <div class="price">총 상품 금액</div>
                            <div class="price" >
								<span class="productTotalPriceDisplay price"><fmt:formatNumber pattern="###,###,###" value="${sum}" /></span> 원
							</div>
                        </div>
                        <div class="row">
                            <div>총 배송비</div>
                            <div class="price">2,000원</div>
                        </div>
                        <div class="info">
                            <div class="text" style="margin-bottom: 20px;">
                            <img alt="" src="/resources/images/basket/circle.png" style="width: 10px; height: 10px;">
                            주문 1건당 배송비가 부과됩니다.</div>
                        </div>
                    </div>
                        <div class="row">
                            <div class="price">총 결제 예상 금액</div>
                            <div class="price" style="font-size: 20px;">
								<span class="totalPriceDisplay price"><fmt:formatNumber pattern="###,###,###" value="${sum}" /></span> 원
							</div>
                        </div>
                        
             </div>
       </div>

	            <div class="action-button-wrapper" style="width: 100px; margin-left: 10px; float: right;">                 
	              	<button id="payment" style="font-size: 16px; width:100px; height:40px; background-color: rgb(255,187,0); border-radius:20px; line-height: 30px; border: 0px;">주문하기</button>
	            </div>
				<div style="width: 100px; margin-left: 100px; float: right;">
					<button id = "list" onclick="location.href='./list'" style="font-size: 16px; width:100px; height:40px; border-radius:20px; background-color: rgb(255,187,0); line-height: 30px; border: 0px;">상품 더보기</button>
				</div>
	        
     	</section>
        </div>
    </section>
</c:if>
<script>
	$("#allCheck").click(function () {
	    let chk = $("#allCheck").prop("checked");
	    if (chk) {
	        $(".chBox").prop("checked", true);
	    } else {
	        $(".chBox").prop("checked", false);
	    }
	    updateTotalPrice(); // 총 금액 업데이트
	});
	
	$(".chBox").click(function () {
	    updateTotalPrice(); // 총 금액 업데이트
	    checkAllChecked(); // 모든 버튼이 체크되었는지 확인
	});
	
	// 모든 버튼이 체크되었는지 확인하는 함수
	function checkAllChecked() {
	    let allChecked = true;
	    $(".chBox").each(function () {
	        if (!$(this).prop("checked")) {
	            allChecked = false;
	            return false; // 하나라도 체크 안 된 경우 종료
	        }
	    });
	    $("#allCheck").prop("checked", allChecked);
	}
	
	//배송비 포함x 총 상품 금액
	
	function productTotalPrice() {
	    let totalPrice = 0;
	    $(".chBox:checked").each(function () {
	        let priceText = $(this).closest("li").find(".money").text();
	        let countText = $(this).closest("li").find(".numBox").val();
	        let price = parseFloat(priceText.replace(/[^0-9.-]+/g, ""));
	        let count = parseInt(countText);
	        totalPrice += (price * count);

	    });
	
	    $(".productTotalPriceDisplay").text(totalPrice.toLocaleString());
	}
	
	productTotalPrice();

	// 배송비 포함한 총 예상 결제 금액
	
	function updateTotalPrice() {
		let shoppingFee = 2000;
	    let totalPrice = shoppingFee;
	    $(".chBox:checked").each(function () {
	        let priceText = $(this).closest("li").find(".money").text();
	        let countText = $(this).closest("li").find(".numBox").val();
	        let price = parseFloat(priceText.replace(/[^0-9.-]+/g, ""));
	        let count = parseInt(countText);
	        totalPrice += price * count;

	    });
	
	    $(".totalPriceDisplay").text(totalPrice.toLocaleString());
	}
	
	updateTotalPrice();

    $(".plus").click(function () {
        let numBox = $(this).closest("li").find(".numBox");
        let num = parseInt(numBox.val());
        let plusNum = num + 1;
        let stock = parseInt($(this).closest("li").find(".stock").val());

        if (plusNum > stock) {
            numBox.val(stock);
        } else {
            numBox.val(plusNum);
        }
        updateTotalPrice();
        productTotalPrice();
    });

    $(".minus").click(function () {
        let numBox = $(this).closest("li").find(".numBox");
        let num = parseInt(numBox.val());
        let minusNum = num - 1;

        if (minusNum < 1) {
            numBox.val(1);
        } else {
            numBox.val(minusNum);
        }
        updateTotalPrice();
        productTotalPrice();
    });

    $(".chBox").change(function () {
        updateTotalPrice();
        productTotalPrice();
    });
    
    $("#allCheck").change(function(){
        updateTotalPrice();
        productTotalPrice();
    });
    
    // 결제 버튼
    $("#payment").click(function(){
    	let form = $("<form></form>");
		form.attr("method", "POST");
		form.attr("action", "../order/")
		
    	$("ul > li > .productInfo").each(function(index, element){
    		let productNum = $(element).find(".productNum").val();
    		let count = $(element).find(".amount > .numBox").val();
    		
    		form.append($("<input />", {type:"hidden", name:"orderProducts[" + index + "].productNum", value:productNum}));
    		form.append($("<input />", {type:"hidden", name:"orderProducts[" + index + "].orderCount", value:count}));
    	});
    	
    	form.appendTo("body");
		form.submit();
    });
</script>
<c:import url="../temp/footer.jsp"></c:import>

</body>
</html>