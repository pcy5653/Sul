<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	
	<link rel="stylesheet" href="../resources/css/order/common.css" />
	<link rel="stylesheet" href="../resources/css/order/list.css" />
</head>
<body>
	<div id="outerWrap">
		<div id="title">
			<p>주문 내역</p>
		</div>
		<div id="innerWrap">
			<div id="alignWrap">
				<c:forEach items="${orders}" var="order">
					<div id="productInfo" class="wrap">
						<div>
							<p>${order.orderDate}</p>
							<p onclick="location.href='./orderDetail?orderNum=${order.orderNum}'">주문 상세 보기 ></p>
						</div>
						<div id="sender">
							<span>${order.memberDTO.name}</span>
							<i>|</i>
							<span>${order.memberDTO.phone}</span>
						</div>
						<c:forEach items="${order.orderProducts}" var="orderProduct">
							<div class="product">
								<img src="../resources/images/order/백련_미스티.jpg">
								<div>
									<c:if test="${orderProduct.isCanceled eq 1}">
										<span class="cancelState">[취소 완료]</span>
									</c:if>
									<p>${orderProduct.productDTO.productName}</p>
									<p>[375ml]백련 미스티 살균 막...</p>
									<p>${orderProduct.productDTO.price}원 / 수량 ${orderProduct.orderCount}개</p>
								</div>
							</div>
							<p class="line" />
						</c:forEach>
						<div id="orderFee">
							<c:set var="orderFee" value="100" /> <%-- <c:set var="orderFee" value="3000" /> --%>
							<img src="../resources/images/order/truck-icon.png">
							<span>${orderFee}원</span>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>