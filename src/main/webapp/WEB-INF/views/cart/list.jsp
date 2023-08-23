<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        	<a href="">전체선택</a>&nbsp;&nbsp;&nbsp;<a href="">선택삭제</a>
                <thead>
                    <th width=5% align = "center"><input type="checkbox"></th>
                    <th width=20% align = "center"></th>
                    <th width=55% align = "center">상품정보</th>
                    <th width=10% align = "center">수량</th>
                    <th width=10% align = "center">금액</th>
                </thead>
                
                <tbody>    
                    <tr>
                        <td rowspan="2"  width=5%><input type="checkbox"></td>
                        <td rowspan="2" width=20% align = "center"><img alt="" src=""></td>
                        <td width=55%></td>
                        <td rowspan="2" width=10%>
                        <div class="button">
                        	<div class="productCount">
                        	<input type="text" class="count_input" value="1">
                        	
                        		<button class="plus_btn">+</button>
                        		<button class="minus_btn">-</button>
                        	
                        	</div>
                        </div>
                        
                        </td>
                        <td rowspan="2" width=10%>금액 위치</td>
                    </tr>

                    <tr>
                        <td>포인트</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div>
        
        </div>
        <div>
        	<button class="btn btn-secondary">주문하기</button>
        </div>
    </section>
</body>
</html>