<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/resources/css/basket/basketList.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
<c:import url="../temp/header.jsp" /><br><br><br><br><br><br><br>

<!-- 장바구니 상품 없을 때 -->
<c:if test="${empty basketList}">    
   <div style="text-align: center; margin-top: 100px;" class="above">
       <img src="/resources/images/basket/cartList.png" style="width: 32px; height: 32px; ">
         <div style="font-size: 1.5em; margin-top: 25px;">장바구니가 비었습니다.</div><br>
             <a href="./list" class="btn">쇼핑하러 가기</a>
   </div>
        
</c:if>
<c:if test="${not empty basketList}">
    <section id="container">
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
                                    <img alt="" style="width:100px; height:100px; " src="/resources/images/${basketList.productName}.jpg">
                                </div>
                                <p>
                                <div class="price" style="width:250px; height:80px; float:left; text-align: center; margin-top: 30px;">
                                    ${basketList.productName}<br><br>상품금액 : <fmt:formatNumber pattern="###,###,###" value="${basketList.price}" /> 원
                                </div>


                                <div class="basketStock" style="width:130px; height:100px; float:left; margin-top: 30px; margin-left: 60px;">
                                    <div class="amount">
                                        <button type="button" class="minus">-</button>
                                        <input type="number" class="numBox" pattern="\d*" maxlength="3" value="${basketList.productCount}" style="width: 40px; text-align: right;"readonly="readonly">
                                        <button type="button" class="plus">+</button>
                                    </div>
                                    <br>
                                    <button type="button" class="update_btn" data-product-Num="${basketList.productNum}">&nbsp;&nbsp;&nbsp;&nbsp;수정</button>
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
								                    alert("수정되었습니다.");
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

				<div class="basketBill calculate">

			        <div class="solid-bottom"></div>
                    <div class="footer"><div class="text" style="margin-left:80px; font-size: 18px;">총 상품 금액</div>
                    <div class="price" style="margin-right: 80px;">
                    	<span class="totalPriceDisplay" style="font-size: 18px;"><fmt:formatNumber pattern="###,###,###" value="${sum}" /></span> 원
                    </div>
                </div>
                <div class="solid-bottom"></div>
           	<div style="width: 800px;">
				<div style="width: 50%; float: left;">
					<button id = "list" class="btn btn-danger" onclick="location.href='./list'"> <img alt="" src="/resources/images/basket/listIcon.png" style="width: 30px; height: 30px;"> 상품 더보기</button>
				</div>
	            <div class="action-button-wrapper" style="width: 45%; float: left; margin-right: 20px;">                
	              	<button id="payment" class="btn btn-danger">주문하기<img alt="" src="/resources/images/basket/payIcon.png" style="width: 25px; height: 25px;"></button>
	            </div>
	        </div>
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
	
	function updateTotalPrice() {
	    let totalPrice = 0;
	    $(".chBox:checked").each(function () {
	        let priceText = $(this).closest("li").find(".price").text();
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
    });

    $(".chBox").change(function () {
        updateTotalPrice();
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
</body>
</html>