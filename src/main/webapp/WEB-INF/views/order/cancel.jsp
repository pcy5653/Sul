<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script src="../resources/js/order/cancel.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#checkAll > input[type='checkbox']").change(function(){
				let isChecked = $(this).is(":checked");
				$("#orderProductWrap > input[type='checkbox']").prop("checked", isChecked);
				
				
				let productAmount = 0;
				let orderFee = 0;
				let point = 0;
				
				if(isChecked){
					$("#orderProductWrap > input[type='checkbox']:checked").each(function(index, element){
						productAmount += parseInt($(element).siblings(".orderProduct").attr("data-orderPrice"));
					});
					
					orderFee = ${order.orderFee};
					point = ${order.usedPoint};
				}
				
				$("#productAmount > p:last-child").html(productAmount + "원");
				$("#orderFee span").html(orderFee);
				$("#total > p:last-child").html(productAmount + orderFee + "원");
				$("#cash span").html(productAmount + orderFee - point);
				$("#point span").html(point);
			});
			
			$("#orderProductWrap > input[type='checkbox']").change(function(){
				let isCheckAll = $("#orderProductWrap > input[type='checkbox']:checked").length == $("#orderProductWrap > input[type='checkbox']").length;
				$("#checkAll > input[type='checkbox']").prop("checked", isCheckAll);
				
				
				let productAmount = 0;
				let orderFee = 0;
				let point = 0;
				
				$("#orderProductWrap > input[type='checkbox']:checked").each(function(index, element){
					productAmount += parseInt($(element).siblings(".orderProduct").attr("data-orderPrice"));
				});
				
				if(isCheckAll){
					orderFee = ${order.orderFee};
					point = ${order.usedPoint};
				}
				
				$("#productAmount > p:last-child").html(productAmount + "원");
				$("#orderFee span").html(orderFee);
				$("#total > p:last-child").html(productAmount + orderFee + "원");
				$("#cash span").html(productAmount + orderFee - point);
				$("#point span").html(point);
			});
			
			
			$("#cancelButton > button").click(function(){
				if(confirm("해당 주문을 취소하시겠습니까?")){
					const checked = $("input[type='radio']:checked");
					let cancelReason;
					
					if(checked.attr("id") == "otherReason"){
						cancelReason = $("#reasonInputField > textarea").val();
					}else{
						cancelReason = checked.siblings("span").html();
					}
					
					let cancel = new Object();
					cancel.orderNum = "${order.orderNum}";
					cancel.cancelAmount = parseInt($("#cash span").html());
					cancel.cancelPoint = parseInt($("#point span").html());
					cancel.cancelOrderFee = parseInt($("#orderFee span").html());
					cancel.cancelReason = (cancelReason == undefined || cancelReason == "") ? "(기타)" : cancelReason;
					
					let cancelInfos = new Array();
					$("#orderProductWrap > input[type='checkbox']:checked").each(function(index, element){
						let cancelInfo = new Object();
						cancelInfo.orderProductNum = $(element).siblings(".orderProduct").attr("data-orderProductNum");
						cancelInfos.push(cancelInfo);
					});
					
					cancel.cancelInfos = cancelInfos;
					
					$.ajax({
						url:"./cancel",
						method:"POST",
						headers:{ "Content-Type":"application/json" },
						data:JSON.stringify(cancel),
						success:function(result){
							if(result > 0){
								location.href = "./cancelDetail?cancelNum=" + result;
							}else{
								alert("관리자에게 문의하세요.");
							}
						},
						error:function(error){
							alert("관리자에게 문의하세요.");
						}
					});
				}
			});
		});
	</script>
	
	<link rel="stylesheet" href="../resources/css/order/common.css" />
	<link rel="stylesheet" href="../resources/css/order/cancel.css" />
</head>
<body>
	<div id="outerWrap">
		<div id="title">
			<p>주문 취소</p>
		</div>
		<div id="innerWrap">
			<div id="alignWrap">
				<div id="select" class="wrap">
					<p class="title">취소하실 상품을 선택해주세요.</p>
					<div id="orderProductList">
						<div id="checkAll">
							<input type="checkbox"> <span>모두 선택</span>
						</div>
						<c:forEach items="${order.orderProducts}" var="orderProduct" varStatus="status">
							<c:if test="${orderProduct.isCanceled ne 1}">
								<div id="orderProductWrap">
									<input type="checkbox">
									<img src="../resources/images/order/백련_미스티.jpg">
									<div class="orderProduct" data-orderProductNum="${orderProduct.orderProductNum}" data-orderPrice="${orderProduct.productDTO.price * orderProduct.orderCount}">
										<p>${orderProduct.productDTO.productName}</p>
										<p>[375ml]백련 미스티 살균 막...</p>
										<p>수량 ${orderProduct.orderCount}개</p>
									</div>
								</div>
								<c:if test="${!status.last}">
									<p class="line" />
								</c:if>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div id="reason" class="wrap">
					<p class="title">어떤 사유로 주문을 취소하시나요?</p>
					<div>
						<input type="radio" name="reason" value="상품이 마음에 들지 않아요!(단순 변심)">
						<span>상품이 마음에 들지 않아요!(단순 변심)</span>
					</div>
					<div>
						<input type="radio" name="reason" value="다른 상품도 함께 주문하고 싶어요!">
						<span>다른 상품도 함께 주문하고 싶어요!</span>
					</div>
					<div>
						<input type="radio" name="reason" value="옵션을 변경하고 싶어요!">
						<span>옵션을 변경하고 싶어요!</span>
					</div>
					<div>
						<input type="radio" name="reason" value="배송지를 변경하고 싶어요!">
						<span>배송지를 변경하고 싶어요!</span>
					</div>
					<div>
						<input id="otherReason" type="radio" name="reason">
						<span>기타 사유</span>
					</div>
				</div>
				<div id="refundInfo" class="wrap">
					<p class="title">예상 환불 금액</p>
					<div id="productAmount">
						<p class="l_label">환불 상품 금액</p>
						<p class="r_label">0원</p>
					</div>
					<div id="orderFee">
						<p class="l_label">환불 배송비</p>
						<p class="r_label"><span>0</span>원</p>
					</div>
					<p class="line" />
					<div id="total">
						<p class="l_label pinkFont">총 환불액</p>
						<p class="r_label pinkFont">0원</p>
					</div>
					<div id="cash">
						<p class="l_label">현금 환불액</p>
						<p class="r_label"><span>0</span>원</p>
					</div>
					<div id="point">
						<p class="l_label">포인트 반환액</p>
						<p class="r_label"><span>0</span>원</p>
					</div>
				</div>
				<div id="cancelButton">
					<button class="skyButton">취소 완료하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>