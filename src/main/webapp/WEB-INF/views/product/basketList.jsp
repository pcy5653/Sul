<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<c:import url="../temp/bootStrap.jsp"></c:import>
</head>
<body>
<c:import url="../temp/header.jsp" /><br><br><br><br><br><br><br>
<section id="container">
		<div id="container_box">
		
			<section id="content">
					
				<ul>
					<li>
						<div class="allCheck">
							<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>
							
							<script>
							$("#allCheck").click(function(){
								var chk = $("#allCheck").prop("checked");
								if(chk) {
									$(".chBox").prop("checked", true);
								} else {
									$(".chBox").prop("checked", false);
								}
							});
							</script>
							
						</div>
						<br>
						<div class="delBtn">
							<button type="button" class="selectDelete_btn">선택 삭제</button>
							
							<script>
								$(".selectDelete_btn").click(function(){
									let confirm_val = confirm("정말 삭제하시겠습니까?");
									
									if(confirm_val) {
										let checkArr = new Array();
										
										// 체크된 체크박스의 갯수만큼 반복
										$("input[class='chBox']:checked").each(function(){
											checkArr.push($(this).attr("data-basketNum"));  // 배열에 데이터 삽입
										});
											
										$.ajax({
											url : "/product/basketList/deleteBasket",
											type : "post",
											data : { chbox : checkArr },
											success : function(result){
												
												if(result == 1) {												
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
						<div class="checkBox">
							<input type="checkbox" name="chBox" class="chBox" data-basketNum="${basketList.basketNum}" />
							<script>
								$(".chBox").click(function(){
									$("#allCheck").prop("checked", false);
								});
							</script>
						</div>
					
						
						<div class="productInfo">
							<p>
								<span>상품명</span>${basketList.productName}<br>
								<span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${basketList.price}" /> 원<br>
								<span>구입 수량</span>${basketList.productCount} 개<br />
								<br><span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${basketList.price * basketList.productCount}" /> 원
							</p>
							
							<div class="delete">
								<button type="button" class="delete_${basketList.basketNum}_btn" data-basketNum="${basketList.basketNum}">삭제</button>
								
								<script>
									$(".delete_${basketList.productName}_btn").click(function(){
										var confirm_val = confirm("정말 삭제하시겠습니까?");
										
										if(confirm_val) {
											var checkArr = new Array();
											
											checkArr.push($(this).attr("data-basketNum"));
																						
											$.ajax({
												url : "/product/basketList/deleteBasket",
												type : "post",
												data : { chbox : checkArr },
												success : function(result){
													if(result == 1) {												
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
						</div>			
					</li>
					
					<%-- 반복할 때마다 sum에 상품 가격(gdsPrice)*상품 갯수(cartStock)만큼을 더함 --%>
					<c:set var="sum" value="${sum + (basketList.price * basketList.productCount)}" />
					
					</c:forEach>
				</ul>
			
			<div class="listResult">
				<div class="sum">
					총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
				</div>
				
			</div>
		</section>
	</div>
</section>	
</body>
</html>