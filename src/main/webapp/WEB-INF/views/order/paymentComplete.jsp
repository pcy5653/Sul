<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	
	<link rel="stylesheet" href="../resources/css/order/common.css" />
	<link rel="stylesheet" href="../resources/css/order/paymentComplete.css" />
</head>
<body>
	<div id="outerWrap">
		<div id="title">
			<p>주문 완료</p>
		</div>
		<div id="innerWrap">
			<div id="alignWrap">
				<div id="notification">
					<img src="../resources/images/order/check-circle.png">
					<p>구매가 완료되었습니다!</p>
				</div>
				<div id="buyerInfo" class="wrap">
					<p class="title">받는 분 정보</p>
					<div>
						<p class="l_label">받는 분</p>
						<p class="r_label">${order.orderAddressDTO.recipient} / ${order.orderAddressDTO.recipientPhone}</p>
					</div>
					<div>
						<p class="l_label">주소</p>
						<p class="r_label">${order.orderAddressDTO.recipientAddress}</p>
					</div>
					<div>
						<p class="l_label">배송 메모</p>
						<p class="r_label">${order.orderComment}</p>
					</div>
				</div>
				<div id="productInfo" class="wrap">
					<p class="title">${order.orderDate}</p>
					<c:forEach items="${order.orderProducts}" var="orderProduct">
						<div class="product">
							<img src="../resources/images/order/백련_미스티.jpg">
							<div>
								<p>${orderProduct.productDTO.productName}</p>
								<p>[375ml]백련 미스티 살균 막...</p>
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
				<div id="billInfo" class="wrap">
					<p class="title">계산서</p>
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
				<div id="buttons">
					<button onclick="location.href='./list'">주문 내역</button>
					<button onclick="location.href='/'">홈으로</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>