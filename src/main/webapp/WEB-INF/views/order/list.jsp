<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			<p id="home" onclick="location.href='${pageContext.request.contextPath}/'">홈으로</p>
		</div>
		<div id="innerWrap">
			<div id="alignWrap">
				<c:if test="${fn:length(orders) > 0}">
					<c:forEach items="${orders}" var="order">
						<div id="productInfo" class="wrap">
							<div>
								<p>${order.orderDate}</p>
								<p onclick="location.href='${pageContext.request.contextPath}/order/orderDetail?orderNum=${order.orderNum}'">주문 상세 보기 ></p>
							</div>
							<div id="sender">
								<span>${order.memberDTO.name}</span>
								<i>|</i>
								<span>${order.memberDTO.phone}</span>
							</div>
							<c:forEach items="${order.orderProducts}" var="orderProduct">
								<div class="product">
									<img src="../resources/images/product/${orderProduct.productDTO.productName}.jpg">
									<div>
										<c:if test="${orderProduct.isCanceled eq 1}">
											<span class="cancelState">[취소 완료]</span>
										</c:if>
										<p>${orderProduct.productDTO.productName}</p>
										<p>[${orderProduct.productDTO.capacity}ml]${orderProduct.productDTO.productName} ...</p>
										<p>${orderProduct.productDTO.price}원 / 수량 ${orderProduct.orderCount}개</p>
										<c:if test="${orderProduct.isCanceled ne 1}">
										<a class="btn btn-success" href="../product/reviewAdd?productNum=${orderProduct.productDTO.productNum}&productName=${orderProduct.productDTO.productName}" target="_blank">리뷰 작성</a>
										</c:if>
									</div>
								</div>
								<p class="line" />
							</c:forEach>
							<div id="orderFee">
								<img src="../resources/images/order/truck-icon.png">
								<span>${order.orderFee}원</span>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${fn:length(orders) == 0}">
					<p id="notExist">주문 내역이 존재하지 않습니다.</p>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>