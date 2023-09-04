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

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.wrap{width:1000px;height:800px;margin:auto;}
		
		section#content ul li { margin:10px 0; padding:10px 0; border-bottom:1px solid #999; }
		section#content ul li img { width:; height:250px; }
		section#content ul li::after { content:""; display:block; clear:both; }
		section#content div.thumb { float:left; width:250px; }
		section#content div.productInfo {  width:calc(100% - 320px); }
		section#content div.productInfo { font-size:18px; line-height:2; }
		section#content div.productInfo span { display:inline-block; width:100px; font-weight:bold; margin-right:10px; }
		section#content div.productInfo .delete { text-align:right; }
		section#content div.productInfo .delete button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}
		
		.allCheck { float:left; width:200px; }
		.allCheck input { width:16px; height:16px; }
		.allCheck label { margin-left:10px; }
		.delBtn { width:300px;}
		/* .delBtn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;} */
		
		.checkBox { float:left; width:30px; }
		.checkBox input { width:16px; height:16px; }
		
		.listResult { padding:20px; background:#eee; }
		.listResult .sum { float:left; width:45%; font-size:22px; }
		
		.listResult .orderOpne { float:right; width:45%; text-align:right; }
		.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
		.listResult::after { content:""; display:block; clear:both; } 

</style>
</head>
<body>
<c:import url="../temp/header.jsp" /><br><br><br><br><br><br><br>

<!-- 장바구니 상품 없을 때 -->
  <c:if test="${empty basketList}">
	<tr>
		<td colspan="2"></td>
		<td colspan="2">
			<div style="text-align: center; margin-top: 25px;">
				<img src="/resources/images/basket/cartList.png" style="width: 32px; height: 32px; ">
			<div style="font-size: 1.5em; margin-top: 25px;">장바구니가 비었습니다.</div><br>
				<a href="./list" class="btn">쇼핑하러 가기</a>
			</div></td>
		<td colspan="2"></td>
	</tr>
</c:if>
 <c:if test="${not empty basketList}">
<section id="container">
		<div id="container_box" class="wrap">
		
			<section id="content">
					
				<ul>
					<li>
						<div class="allCheck">
							<input type="checkbox" name="allCheck" id="allCheck" checked /><label for="allCheck">모두 선택</label>
							
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
						
						<div class="delBtn">
							<button type="button" class="selectDelete_btn" >선택 삭제</button>
							
							<script>
								$(".selectDelete_btn").click(function(){
									let confirm_val = confirm("삭제하시겠습니까?");
									
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
												
												if(result == '1') {												
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
							<input type="checkbox" name="chBox" class="chBox" data-basketNum="${basketList.basketNum}" checked/>
							<script>
								$(".chBox").click(function(){
									$("#allCheck").prop("checked", false);
								});
							</script>
						</div>
					
						
						<div class="productInfo">
							<div style="width:120px; height:100px; float:left;">
								<img alt="" style="width:100px; height:100px; " src="/resources/images/${basketList.productName}.jpg">
							</div>
							<p>
							<div style="width:120px; height:80px; float:left; text-align: center; margin-top: 30px;">
								${basketList.productName}
						    </div>
							<div style="width:120px; height:100px; float:left; ">
								
							</div>
							
							
							<div class="basketStock" style="width:100px; height:100px; float:left; text-align: center; margin-top: 30px;">
							    <div class="product-info-bottom">
								<div class="amount-control">
									<div class="amount"><input type="number" pattern="\d*" maxlength="3" value="${basketList.productCount}" style="width: 40px;"></div><br>
									<button type="button" class="update_btn">수정</button>
								</div>
							</div>
							</div>
							<script type="text/javascript">
							$(".update_btn").click(function () {
							    let productNum = $(".productNum").val();
							    let productCount = $(".numBox").val();
						
							    let data = {
							        productNum: productNum,
							        productCount: productCount
							    };
							  $.ajax({
							        url: "/product/basketList/updateBasket",
							        type: "post",
							        data: data,
							        success: function (result) {
							     
							            if (result === 1) {
							                alert("수정되었습니다.");
							                $(".numBox").val("1");
							            } 
							        },
							        error: function () {
							            alert("관리자에게 문의하세요.");
							           
							        }
						
							    }); 
							});
							</script>
							<div style="width:120px; height:100px; float:left; text-align: center; margin-top: 30px; ">
								<fmt:formatNumber pattern="###,###,###" value="${basketList.price * basketList.productCount}" /> 원
							</div>
								
							<div class="delete" style="width:60px; height:100px; float:left; text-align: center; margin-top: 30px; ">
								<button type="button" class="delete_${basketList.basketNum}_btn" data-basketNum="${basketList.basketNum}">
									x
								</button>
								
								<script>
									$(".delete_${basketList.basketNum}_btn").click(function(){
										var confirm_val = confirm("삭제하시겠습니까?");
										
										if(confirm_val) {
											var checkArr = new Array();
											
											checkArr.push($(this).attr("data-basketNum"));
																						
											$.ajax({
												url : "/product/basketList/deleteBasket",
												type : "post",
												data : { chbox : checkArr },
												success : function(result){
													if(result == '1') {												
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
			
			<div class="listResult">
				<div class="sum">
					총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
				
				</div>
				
			</div>
		</section>
	</div>
</section>
</c:if>	
</body>
</html>