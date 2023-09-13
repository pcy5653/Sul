<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="../resources/js/order/order.js"></script>
	
	<link rel="stylesheet" href="../resources/css/order/common.css" />
	<link rel="stylesheet" href="../resources/css/order/order.css" />
</head>
<body>
	<div id="outerWrap">
		<div id="title">
			<p>주문 / 결제</p>
			<p id="home" onclick="location.href='${pageContext.request.contextPath}/'">홈으로</p>
		</div>
		<div id="innerWrap">
			<div id="alignWrap">
				<div id="addressInfo" class="wrap">
					<div id="address">
						<p class="l_label">배송지</p>
						<p class="r_label skyFont">변경</p>
					</div>
					<div>
						<p id="recipient" class="strongLabel">${member.name}</p>
						<p id="recipientPhone">${member.phone}</p>
						<input type="text" name="recipientAddress" value="${member.address}" readonly="readonly">
						<input type="text" name="orderComment" maxlength="50" placeholder="요청사항을 입력해주세요.">
					</div>
				</div>
				<div id="productInfo" class="wrap">
					<p class="title">주문 예정 상품</p>
					<c:forEach items="${orderProducts}" var="orderProduct" varStatus="status">
						<c:set var="totalAmount" value="${totalAmount + (orderProduct.productDTO.price * orderProduct.orderCount)}" />
						<c:set var="orderProductCount" value="${status.count}" />
						<div class="product">
							<img src="../resources/images/product/${orderProduct.productDTO.productName}.jpg">
							<div>
								<p>${orderProduct.productDTO.productName}</p>
								<p>[${orderProduct.productDTO.capacity}ml]${orderProduct.productDTO.productName} ...</p>
								<p><fmt:formatNumber value="${orderProduct.productDTO.price}" pattern="#,###" />원 / 수량 ${orderProduct.orderCount}개</p>
							</div>
						</div>
						<p class="line" />
					</c:forEach>
					<div id="orderFee">
						<c:set var="orderFee" value="2000" />
						<img src="../resources/images/order/truck-icon.png">
						<span><fmt:formatNumber value="${orderFee}" pattern="#,###" />원</span>
					</div>
					<p class="strongLine" />
					<div id="totalAmount">
						<p class="l_label">주문 총액</p>
						<p class="r_label"><fmt:formatNumber value="${totalAmount + orderFee}" pattern="#,###" />원</p>
					</div>
				</div>
				<div id="point" class="wrap">
					<p class="title">포인트 사용</p>
					<div id="usePoint">
						<p class="strongLabel">포인트</p><input type="number" placeholder="사용할 포인트를 입력해주세요.">
					</div>
					<p class="skyFont">사용 가능한 포인트 : <fmt:formatNumber value="${member.point}" pattern="#,###" />p</p>
				</div>
				<div id="billInfo" class="wrap">
					<p class="title">계산서</p>
					<div>
						<p class="l_label">총 상품 금액</p>
						<p class="r_label"><span>${totalAmount}</span>원</p>
					</div>
					<div>
						<p class="l_label">배송비</p>
						<p class="r_label">${orderFee}원</p>
					</div>
					<div>
						<p class="l_label">사용 포인트</p>
						<p class="r_label"><span id="inputedPoint">0</span>원</p>
					</div>
					<p class="strongLine" />
					<div>
						<p class="l_label skyFont">총 결제 금액</p>
						<p class="r_label skyFont">
							<span class="totalPay skyFont">${totalAmount + orderFee}</span>원
						</p>
					</div>
				</div>
				<div id="payButton">
					<button class="skyButton">
						<span class="totalPay">${totalAmount + orderFee}</span>원 결제하기
					</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		// 배송지
		$("#address > .r_label").click(function(){
			$("body").append("<div id='otherAddressBackground'>" +
										"<div id='otherAddress'>" +
											"<div id='title'>" +
												"<p class='title'>그 외 배송지 목록</p>" +
												"<img id='closeOtherAddress' class='close' src='../resources/images/order/close-icon.png'>" +
											"</div>" +
											"<div id='otherAddressList'>" +
												"<div id='default' class='wrap'>" +
													"<div>" +
														"<p class='recipient strongLabel'>${member.name}</p>" +
														"<p id='mark'>기본</p>" +
														"<p id='update' data-num='0'>수정</p>" +
													"</div>" +
													"<p class='recipientPhone'>${member.phone}</p>" +
													"<div>" +
														"<p class='recipientAddress'>${member.address}</p>" +
														"<button class='select skyButton'>선택</button>" +
													"</div>" +
												"</div>" +
											"</div>" +
											"<button id='addAddressButton'>새 배송지 추가하기</button>" +
										"</div>" +
									"</div>");
			
			$.ajax({
				url:"./getOtherAddress",
				type:"POST",
				data:{
					id:"${member.id}"
				},
				success:function(result){
					$.each(result, function(index, element){
						$("#otherAddressList").append(
							"<div class='wrap'>" +
								"<div>" +
									"<p class='recipient strongLabel'>" + element.recipient + "</p>" +
									"<p class='delete' data-num='" + element.addressNum + "'>삭제</p>" +
								"</div>" +
								"<p class='recipientPhone'>" + element.recipientPhone + "</p>" +
								"<div>" +
									"<p class='recipientAddress'>" + element.recipientAddress + "</p>" +
									"<button class='select skyButton'>선택</button>" +
								"</div>" +
							"</div>");
					});
				}
			});
		});
		
		$("body").on("click", "#submit", function(){
			let success = true;
			$("#addAddress input").each(function(index, element){
				if(!validation($(element), true)){
					success = false;
					return false;
				}
			});
			
			if(success){
				let otherAddress = $("#addAddress #address").val() + " ";
				otherAddress += $("#addAddress #addressDetail").val();
				
				let otherAddressData = new Object();
				otherAddressData.id = "${member.id}";
				otherAddressData.recipient = $("input[name='recipient']").val();
				otherAddressData.recipientPhone = $("input[name='recipientPhone']").val();
				otherAddressData.recipientAddress = otherAddress;
				
				$.ajax({
					url:"./addOtherAddress",
					type:"POST",
					data:otherAddressData,
					success:function(addressNum){
						if($.isNumeric(addressNum)){
							$("#otherAddressList").append(
								"<div class='wrap'>" +
									"<div>" +
										"<p class='recipient strongLabel'>" + otherAddressData.recipient + "</p>" +
										"<p class='delete' data-num='" + addressNum + "'>삭제</p>" +
									"</div>" +
									"<p class='recipientPhone'>" + otherAddressData.recipientPhone + "</p>" +
									"<div>" +
										"<p class='recipientAddress'>" + otherAddressData.recipientAddress + "</p>" +
										"<button class='select skyButton'>선택</button>" +
									"</div>" +
								"</div>");
							
							$("#closeAddAddress").trigger("click");
						}else{
							alert("배송지 추가 실패");
						}
					}
				});
			}else{
				alert("입력되지 않은 항목이 있습니다.");
			}
		});
		
		
		// 포인트
		$("#usePoint > input[type='number']").focusout(function(){
			let inputedPoint = $(this).val();
			if(inputedPoint == ""){
				inputedPoint = 0;
			}else{
				if(inputedPoint > ${member.point}){
					inputedPoint = 0;
					$(this).val("");
					alert("사용 가능한 포인트를 초과했습니다.");
				}
			}
			
			let totalPay = ${totalAmount + orderFee} - inputedPoint;
			$("#inputedPoint").html(inputedPoint);
			$(".totalPay").html(totalPay);
		});
		
		
		// 결제
		$("#payButton > button").click(function(){
			let represent_name = $(".product:first-of-type > div > p:first-child").html();
			if(${orderProductCount - 1} > 0){
				represent_name += " 외 " + ${orderProductCount - 1} + "개";
			}
			
			let recipient = $("#addressInfo #recipient").html();
			let recipientPhone = $("#addressInfo #recipientPhone").html();
			let recipientAddress = $("#addressInfo input[name='recipientAddress']").val();
			let usedPoint = parseInt($("#inputedPoint").html());
			let amount = ${totalAmount + orderFee} - usedPoint;
			
			let orderComment = ($("input[name='orderComment']").val() != "") ? $("input[name='orderComment']").val() : "(없음)";
			
			if(amount >= 100){
				IMP.init("imp81422537");
				IMP.request_pay({
					pg:"nice.iamport00m",
					pay_method:"card",
					merchant_uid:"merchant_" + new Date().getTime(),
					name:represent_name,
					amount:amount,
					buyer_email:"",
					buyer_name:"${member.name}",
					buyer_tel:"${member.phone}",
					buyer_addr:"${member.address}"
				}, function(rsp){
					if(rsp.success){
						let payData = new Object();
						payData.orderNum = rsp.imp_uid;
						payData.orderFee = ${orderFee};
						payData.orderComment = orderComment;
						payData.usedPoint = usedPoint;
						
						let orderAddressDTO = new Object();
						orderAddressDTO.orderNum = rsp.imp_uid;
						orderAddressDTO.recipient = recipient;
						orderAddressDTO.recipientPhone = recipientPhone;
						orderAddressDTO.recipientAddress = recipientAddress;
						
						payData.orderAddressDTO = orderAddressDTO;
	
						$.ajax({
							url:"./paymentSuccess",
							method:"POST",
							headers:{ "Content-Type":"application/json" },
							data:JSON.stringify(payData),
							success:function(paymentInfo){
								if(paymentInfo != ""){
									let form = $("<form></form>");
									form.attr("method", "POST");
									form.attr("action", "./paymentComplete")
									form.append($("<input />", {type:"hidden", name:"paymentInfo", value:paymentInfo}));
									form.appendTo("body");
									form.submit();
								}else{
									alert("세션이 만료되었습니다.");
									location.href = document.referrer;
								}
							},
							error:function(error){
								let errorMsg;
								if(error.responseText.indexOf("사용 가능 포인트 초과") != -1){
									errorMsg = "사용 가능 포인트 초과";
								}else if(error.responseText.indexOf("결제 금액 오류") != -1){
									errorMsg = "결제 금액 오류";
								}
								
								let cancelData = new Object();
								cancelData.cancelNum = -1;
								cancelData.orderNum = rsp.imp_uid;
								cancelData.cancelCash = rsp.paid_amount;
								cancelData.cancelReason = errorMsg;
								
								$.ajax({
									url:"./cancel",
									method:"POST",
									headers:{ "Content-Type":"application/json" },
									data:JSON.stringify(cancelData),
									success:function(result){
										if(result > 0){
											alert("결제 취소(" + errorMsg + ")");
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
					}else{
						alert("결제 실패");
					}
				});
			}else{
				alert("최소 결제 금액은 100원입니다.");
			}
		});
	</script>
</body>
</html>