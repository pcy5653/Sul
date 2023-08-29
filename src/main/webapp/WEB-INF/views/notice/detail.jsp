<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<c:import url="../temp/bootStrap.jsp"></c:import>
</head>
<body>

	<section class="container mt-5">
	
		<h1 class="mb-3 text-center">공지사항</h1><br><br>
		<div class="text-conter">
		<table class="table">
		
	    <tr>
	        <th>제목</th>
	        <td>${dto.subject}</td>
	    </tr>
	    <tr>
	        <th>작성자</th>
	        <td>${dto.name}</td>
	    </tr>
	    <tr>
	        <th>작성일</th>
	        <td>${dto.createDate}</td>
	    </tr>
	    <tr>
	    <th>조회수</th>
		<td>${dto.hit}</td>
		</tr>
	</table>
			<div class="mb-3">
			<label for="contents" class="form-label"></label>
				${dto.contents}
			</div>

		</tbody>
	</div>
	<br><br>
	<form id="frm" action="">
		<input type="hidden" name="num" value="${dto.num}">
	</form>
	<a class="btn btn-outline-secondary" href="./list" style='width:80px;float: right;'>목록</a>
	<a class="btn btn-outline-secondary" href="./update?num=${dto.num}">수정</a>

	<button id="del" data-url="delete" data-delete-name="num" data-delete-num="${f.fileNum}" class="btn btn-danger c1">삭제</button>
	
</section>


	<script type="text/javascript">
	let del = document.getElementById("del");
	const c1 = document.getElementsByClassName("c1");
	const frm = document.getElementById("frm");
	
	for(c of c1){
	    c.addEventListener("click",function(){
	        let url = this.getAttribute("data-url");
	        if(url=='delete'){
	            let result = confirm("삭제하시겠습니까?");
	            if(!result){
	                return;
	            }
	            frm.method="post";
	        }
	      
	        frm.action=url;
	        frm.submit();
	    })
	}
	let noticeNum; 
	
	function setNoticeNum(num){
		noticeNum=num;
	}
	
	</script>

</body>
</html>