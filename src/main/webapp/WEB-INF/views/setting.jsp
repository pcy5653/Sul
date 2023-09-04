<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	
	<style type="text/css">
		form{
			text-align:center;
			margin:50px 0px;
		}
		
		h1{
			font-size:25px;
			color:red;
		}
		
		h2{
			display:inline-block;
			font-size:14px;
		}
		
		button, input[type="text"]{
			vertical-align:middle;
		}
		
		input[type="text"]{
			padding-left:4px;
		}
	</style>
</head>
<body> 
	<form action="./order/" method="POST">		
		<h1>장바구니</h1>
		<div>
			<h2>첫 번째 상품</h2>
			<input type="text" name="orderProducts[0].productNum" placeholder="상품번호 입력">
			<input type="text" name="orderProducts[0].orderCount" placeholder="수량 입력">
		</div>
		<div>
			<h2>두 번째 상품</h2>
			<input type="text" name="orderProducts[1].productNum" placeholder="상품번호 입력">
			<input type="text" name="orderProducts[1].orderCount" placeholder="수량 입력">
		</div>
		<button>구매하기</button>
	</form>
	
	<hr>
	
	<form action="./order/" method="POST">
		<h1>바로 결제</h1>
		<input type="text" name="orderProducts[0].productNum" placeholder="상품번호 입력">
		<input type="text" name="orderProducts[0].orderCount" placeholder="수량 입력">
		<button>구매하기</button>
	</form>
	
	<hr>
	
	<form action="./order/list" method="GET">
		<h1>주문 내역</h1>
		<button style="width:60px; height:30px;">보기</button>
	</form>
</body>
</html>