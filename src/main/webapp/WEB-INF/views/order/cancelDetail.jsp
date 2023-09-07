<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	
	<link rel="stylesheet" href="../resources/css/order/common.css" />
	<link rel="stylesheet" href="../resources/css/order/cancelDetail.css" />
</head>
<body>
	<div id="outerWrap">
		<div id="title">
			<p>취소 상세</p>
		</div>
		<div id="innerWrap">
			<div id="alignWrap">
				<div id="productInfo" class="wrap">
					<div>
						<p class="pinkFont">취소 완료</p>
						<div>
							<span>${cancel.cancelDate}</span>
							<span onclick="location.href='orderDetail?orderNum=${cancel.orderNum}'">주문 상세 보기 ></span>
						</div>
					</div>
					<div id="sender">
						<span>${requestScope.member.name}</span>
						<i>|</i>
						<span>${requestScope.member.phone}</span>
					</div>
					<c:forEach items="${cancel.cancelInfos}" var="cancelInfo">
						<c:set var="productAmount" value="${productAmount + (cancelInfo.orderProductDTO.productDTO.price * cancelInfo.orderProductDTO.orderCount)}" />
						<div class="product">
							<img src="../resources/images/product/${orderProduct.productDTO.productName}.jpg">
							<div>
								<p>${cancelInfo.orderProductDTO.productDTO.productName}</p>
								<p>[500ml]${orderProduct.productDTO.productName} ...</p>
								<p>${cancelInfo.orderProductDTO.productDTO.price}원 / 수량 ${cancelInfo.orderProductDTO.orderCount}개</p>
							</div>
						</div>
						<p class="line" />
					</c:forEach>
				</div>
				<div class="wrap">
					<p class="title">취소 사유</p>
					<p>${cancel.cancelReason}</p>
				</div>
				<div class="wrap">
					<p class="title">상세 정보</p>
					<div>
						<p class="l_label">환불 상품 금액</p>
						<p class="r_label"><span>${productAmount}</span>원</p>
					</div>
					<div>
						<p class="l_label">환불 배송비</p>
						<p class="r_label">${cancel.cancelOrderFee}원</p>
					</div>
					<p class="strongLine" />
					<div>
						<p class="l_label pinkFont">총 환불액</p>
						<p class="r_label pinkFont">
							<span style="font-size:16px; color:#F47070;">${productAmount + cancel.cancelOrderFee}</span>원
						</p>
					</div>
					<div>
						<p class="l_label">현금 환불액</p>
						<p class="r_label"><span>${productAmount + cancel.cancelOrderFee - cancel.cancelPoint}</span>원</p>
					</div>
					<div>
						<p class="l_label">포인트 반환액</p>
						<p class="r_label"><span>${cancel.cancelPoint}</span>원</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>