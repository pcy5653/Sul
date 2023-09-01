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
<link rel="stylesheet" href="/resources/css/basket/basketList.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.wrap{width:1200px;height:800px;margin:auto;}
</style>
</head>
<body>
<c:import url="../temp/header.jsp" /><br><br><br><br><br><br><br>
		<form role="form" method="post">
           <input type="hidden" class="productNum" value="${dto.productNum}" />
           <input type="hidden" value="${dto.stock}" class="stock" />
        </form> 
	<c:set var="sum" value="0" />
	
<section id="container">
	<div class="wrap">  
        <!-- 장바구니 상품 없을 때 -->
        <c:if test="${empty basketList}">
					<tr>
						<td colspan="2"></td>
						<td colspan="2">
					<div style="text-align: center; margin-top: 20px;">
					<img src="/resources/images/basket/cartList.png" style="width: 32px; height: 32px;">
					<div style="font-size: 1.5em; margin-top: 20px;">장바구니가 비었습니다.</div><br>
						<a href="./list" class="btn">쇼핑하러 가기</a>
					</div></td>
				<td colspan="2"></td>
			</tr>
		</c:if> 
        <span><input type="checkbox" name="allCheck" id="allCheck" class="allCheck" checked/><label for="allCheck">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모두선택</label></span>
		&nbsp;&nbsp;&nbsp;<button type="button" class="selectDelete_btn delBtn">선택 삭제</button>
		<br><br>
		<table>
        <thead>
           
        </thead>
        <tbody>
            <c:forEach items="${basketList}" var="basketList">
        
            <tr class="productInfo">
                <td>
                    <input type="checkbox" name="chBox" class="chBox checkBox" data-basketNum="${basketList.basketNum}" checked />
                </td>
                <td >
                     <img alt="" style="width:100px; height:100px; " src="/resources/images/${basketList.productName}.jpg">
                </td>
                <td style="width: 30%; text-align: center;" >
                    ${basketList.productName}
                </td>
                <td style="width: 20%; text-align: center;">
                    <fmt:formatNumber pattern="###,###,###" value="${basketList.price * basketList.productCount}" /> 원
                </td>
                <td style="width: 20%; text-align: center;">
                    <button type="button" class="minus">-</button>
                      <input type="number" class="numBox" min="1" max="${dto.stock}" value="${basketList.productCount}" readonly="readonly">
                    <button type="button" class="plus">+</button>
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
</div>												


	<%-- <c:set var="sum" value="${sum + (basketList.price * basketList.productCount)}" /> --%>
			<div class="listResult">
				<div class="sum">
				<%-- 	총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원 --%>
				</div>
			</div>	
	
</section>		

<!-- 전체선택 -->
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
<script>
	$(".chBox").click(function(){
	$("#allCheck").prop("checked", false);
	});
</script>

<!-- 삭제 -->
	
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

</body>
</html>