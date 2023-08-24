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

<%-- <c:if test="${empty member}">
	<script type="text/javascript">
		alert("로그인이 필요합니다.");
		location.href="../member/login";
	</script>	
</c:if> --%> 

<c:import url="../temp/bootStrap.jsp"></c:import>
</head>
<body>
    <section class="container mt-5">
    <h1 class="mb-3 text-center">장바구니</h1><br><br><br>
        <div>
            <table class="table">
        	<a href="">전체선택</a>&nbsp;&nbsp;&nbsp;<a href="" id="selectDel">선택삭제</a>
                <thead>
		            <th width=10% align = "center"><input type="checkbox" id="checkAll"></th>
		            <th width=55% align = "center" colspan="2" style="text-align:center">상품정보</th>
		            <th width=15% align = "center">수량</th>
		            <th width=20% align = "center">금액</th>
		        </thead>
                
                <tbody>
                	<c:forEach items="${list}" var="d">
		            <tr>
		                <td   width=5%><input type="checkbox" class="check"></td>
		                <td  width=20% align = "center"><img alt="" src=""></td>
		                <td width=55%>${d.productName}<br><hr>상품가격 : ${d.productPrice} | 포인트 : ${d.savePoint}</td>
		                <td  width=10% style="text-align:center">
		                   <div>
                              <div class=" d-flex quantity-wrapper" style="padding:5px 0px; justify-content: start;">
                                 <button type="button" class="btn quantity-left-minus" style="height:5px; width:5px; padding:10px; margin-top:-6px; ">-</button>
                                   <span class="input-wrapper">
                                      <input type="text" class="input-number text-center" style="width: 35px; padding:5px 5px; border:1px solid #c7c7c5; border-radius: 5px;"  value="${d.productCount}">
                                   </span>
                                   <button type="button" class="btn quantity-right-plus" style="height:5px; margin-top:-6px; padding:10px 5px; ">+</button>
                                </div>
                           </div>      
		                </td>
		                <td  width=10%>${d.cartPrice=d.productPrice*d.productCount}</td>
		            </tr>

                    </c:forEach>
                    
                </tbody>
            </table>
        </div>
        <div>
        
        </div>
        <div>
        	<button class="btn btn-secondary">주문하기</button>
        </div>
        
        <form id="frm" action="">
			<input type="hidden" name="id" value="${d.id}">
		</form>
        
    </section>
    <script type="text/javascript">
    const checkAll = document.getElementById("checkAll");
    const check = document.getElementsByClassName("check");
    const selectDel = document.getElementById("selectDel");
    
    	checkAll.addEventListener("click", function(){
    	    for(c of check) {
    	        c.checked = checkAll.checked;
    	    }
    	})
    	
    	for(c of check) {
    c.addEventListener("click", function(){

        let result = true;

        for(ch of check) {
            if(!ch.checked) {
                result = ch.checked;
                break;
            }
        }

        checkAll.checked = result;
    })
}
    	
    	// 수량 버튼에 대한 이벤트 핸들러 등록
        document.addEventListener('DOMContentLoaded', function() {
          var quantityInputs = document.querySelectorAll('.input-number');
          var priceElements = document.querySelectorAll('.td-color');
          var totalPriceElement = document.querySelector('.cart-totalPrice-row h2');
    	
    	 // 수량 감소 버튼 클릭 이벤트
        var quantityMinusBtns = document.querySelectorAll('.quantity-left-minus');
        quantityMinusBtns.forEach(function(quantityMinusBtn, index) {
          quantityMinusBtn.addEventListener('click', function() {
            var quantityInput = quantityInputs[index];
            var currentQuantity = parseInt(quantityInput.value);

            if (currentQuantity > 1) {
              currentQuantity--;
              quantityInput.value = currentQuantity;
              updatePrice(); // 가격 업데이트
              updateTotalPrice(); // 총 결제 예상금액 업데이트
              updateCartAmount(quantityInput, currentQuantity); // cartAmount 업데이트
            }
          });
        });

        // 수량 증가 버튼 클릭 이벤트
        var quantityPlusBtns = document.querySelectorAll('.quantity-right-plus');
        quantityPlusBtns.forEach(function(quantityPlusBtn, index) {
          quantityPlusBtn.addEventListener('click', function() {
            var quantityInput = quantityInputs[index];
            var currentQuantity = parseInt(quantityInput.value);

            currentQuantity++;
            quantityInput.value = currentQuantity;
            updatePrice(); // 가격 업데이트
            updateTotalPrice(); // 총 결제 예상금액 업데이트
            updateCartAmount(quantityInput, currentQuantity); // cartAmount 업데이트
          });
        });

        // 수량 변경시 이벤트
        quantityInputs.forEach(function(quantityInput) {
          quantityInput.addEventListener('change', function() {
            var newQuantity = parseInt(this.value);
            if (!isNaN(newQuantity) && newQuantity >= 1) {
              this.value = newQuantity;
              updatePrice(); // 가격 업데이트
              updateTotalPrice(); // 총 결제 예상금액 업데이트
              updateCartAmount(quantityInput, newQuantity); // cartAmount 업데이트
            } else {
              this.value = 1;
              updatePrice(); // 가격 업데이트
              updateTotalPrice(); // 총 결제 예상금액 업데이트
              updateCartAmount(quantityInput, 1); // cartAmount 업데이트
            }
          });
        });

    	
    </script>
</body>
</html>