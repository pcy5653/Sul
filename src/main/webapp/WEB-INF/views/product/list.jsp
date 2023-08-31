<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/bootStrap.jsp"></c:import>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	
	<section class="container mt-5">
  <div id="grid-view" class="tab-pane active show" role="tabpanel">
                                       
                                        <div class="row">
                                            <c:forEach items="${list}" var="dto">
                                            <!-- product-item start -->
                                            <div class="col-lg-4 col-md-6">
                                                <div class="product-item">
													
                                                    <div class="productimg">
                                                        <a href="./detail?productNum=${dto.productNum}">
                                                        <img class="card-img-top mb-5 mb-md-0"
                                                        src="/resources/images/${dto.productName}.jpg"  height="270" width="200"/>
                                                        </a>
                                                    </div>
                                                    
                                                    <div class="productinfo">
                                                        <h6 class="product-title">
                                                             ${dto.productName}<br>
                                                            ${dto.price}원<br>
                                                            평점: ${dto.score}<br>
                                                            ${dto.contents}
                                                            <br><br>
                                                        </h6>
                                                       
                                                    </div>
                                                    
                                                </div>
                                            </div>

                                        </c:forEach>   
                                            <!-- product-item end -->
                                        </div>                                        
                                    </div>
                                <br>
		
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item ${pager.pre?'':'disabled'}">
		      <a class="page-link" href="./list?page=${pager.startNum - 1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		    <li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
		    </c:forEach>
		     <c:if test="${pager.next}">
		    <li class="page-item">
		      <a class="page-link" href="./list?page=${pager.lastNum + 1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		    </c:if>
		  </ul>
		</nav>
		
		
		<div class="input-group mb-3">
			<form action="./list" method="get">
			  <select name="kind" class="form-select" aria-label="Default select example">
				  <option value="name">이름</option>
				  <option value="contents">내용</option>
			  </select>
			  <input type="text" name="search" class="form-control" aria-label="Amount (to the nearest dollar)">
			  <div class="col-auto">
	    		<button type="submit" class="btn btn-primary">검색</button>
	 		  </div>
 		  </form>
		</div>
		
		<a class="btn btn-danger" href="./add">상품등록</a>

	</section>
	
	
	<script type="text/javascript" src="../resources/js/khj/productList.js"></script>
	
</body>
</html>