<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	
	<link rel="stylesheet" href="../resources/css/order/common.css" />
	<link rel="stylesheet" href="../resources/css/order/orderDetail.css" />
</head>
<body>
	<div id="outerWrap">
		<div id="title">
			<p>주문 상세</p>
			<p id="home" onclick="location.href='${pageContext.request.contextPath}/'">홈으로</p>
		</div>
		<div id="innerWrap">
			<div id="alignWrap">
				<div id="productInfo" class="wrap">
					<p class="title">${order.orderDate}</p>
					<div id="sender">
						<span>${order.memberDTO.name}</span>
						<i>|</i>
						<span>${order.memberDTO.phone}</span>
					</div>
					<c:set var="canceledCount" value="0" />
					<c:forEach items="${order.orderProducts}" var="orderProduct" varStatus="status">
						<c:set var="orderProductCount" value="${orderProductCount = status.count}" />
						<div class="product">
							<img src="../resources/images/product/${orderProduct.productDTO.productName}.jpg">
							<div>
								<c:if test="${orderProduct.isCanceled eq 1}">
									<c:set var="canceledCount" value="${canceledCount = canceledCount + 1}" />
									<span class="cancelState">[취소 완료]</span>
								</c:if>
								<p>${orderProduct.productDTO.productName}</p>
								<p>[${orderProduct.productDTO.capacity}ml]${orderProduct.productDTO.productName} ...</p>
								<p>${orderProduct.productDTO.price}원 / 수량 ${orderProduct.orderCount}개</p>
							</div>
						</div>
						<p class="line" />
					</c:forEach>
					<div id="orderFee">
						<img src="../resources/images/order/truck-icon.png">
						<span>${order.orderFee}원</span>
					</div>
					<p class="strongLine" />
					<p id="payCompleteWords">결제 완료</p>
				</div>
				<c:if test="${canceledCount < orderProductCount}">
					<button id="cancelButton" onclick="location.href='./cancel?orderNum=${order.orderNum}'">주문 취소</button>
				</c:if>
				<div id="recipientInfo" class="wrap">
					<p class="title">받는 분 정보</p>
					<div>
						<p class="l_label">받는 분</p><p class="r_label">${order.orderAddressDTO.recipient} / ${order.orderAddressDTO.recipientPhone}</p>
					</div>
					<div id="address">
						<p class="l_label">주소</p><p class="r_label">${order.orderAddressDTO.recipientAddress}</p>
					</div>
					<div>
						<p class="l_label">배송 메모</p><p class="r_label">${order.orderComment}</p>
					</div>
				</div>
				<div id="billInfo" class="wrap">
					<p class="title">
						<span>계산서</span>
						<span>(${order.orderDate})</span>
					</p>
					<div>
						<p class="l_label">총 상품 금액</p>
						<p class="r_label"><span>${order.total - order.orderFee}</span>원</p>
					</div>
					<div>
						<p class="l_label">배송비</p>
						<p class="r_label">${order.orderFee}원</p>
					</div>
					<div>
						<p class="l_label">사용 포인트</p>
						<p class="r_label"><span>${order.usedPoint}</span>원</p>
					</div>
					<p class="strongLine" />
					<div>
						<p class="l_label skyFont">총 결제 금액</p>
						<p class="r_label skyFont">
							<span class="skyFont">${order.total - order.usedPoint}</span>원
						</p>
					</div>
				</div>
				<c:forEach items="${order.cancels}" var="cancel" varStatus="status">
					<div id="cancelBillInfo" class="wrap">
						<div>
							<p class="pinkFont">취소 완료</p>
							<div>
								<span>계산서</span> <span>(${cancel.cancelDate})</span>
								<span onclick="location.href='cancelDetail?cancelNum=${cancel.cancelNum}'">상세 보기 ></span>
							</div>
						</div>
						<p class="line" />
						<div>
							<p class="l_label">환불 상품 금액</p>
							<p class="r_label"><span>${cancel.cancelCash + cancel.cancelPoint - cancel.cancelOrderFee}</span>원</p>
						</div>
						<div>
							<p class="l_label">환불 배송비</p>
							<p class="r_label">${cancel.cancelOrderFee}원</p>
						</div>
						<p class="strongLine" />
						<div>
							<p class="l_label pinkFont">총 환불액</p>
							<p class="r_label pinkFont">
								<span style="font-size:16px; color:#F47070;">${cancel.cancelCash + cancel.cancelPoint}</span>원
							</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>