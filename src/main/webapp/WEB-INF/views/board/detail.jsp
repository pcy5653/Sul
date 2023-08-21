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
	
	</table>
			<div class="mb-3">
			<label for="contents" class="form-label"></label>
			<textarea class="form-control" border: 0">${dto.contents}</textarea>
			</div>
			<c:forEach items="${dto.fileDTOs}" var="f">
			<div>
				<img alt="" src="/resources/upload/notice/${f.fileName}">
			</div>
			</c:forEach>

		</tbody>
	</div>
	<br><br>
	<form id="frm" action="">
		<input type="hidden" name="num" value="${dto.num}">
	</form>
	<a class="btn btn-outline-secondary" href="./list">LIST</a>
	<a class="btn btn-outline-secondary" href="./update?num=${dto.num}">UPDATE</a>
	<div style='width:80px;float: right;'>
		<button id="del" data-url="delete" data-delete-name="num" data-delete-num="${dto.num}" class="btn btn-danger c1">DELETE</button>
	</div>
	
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