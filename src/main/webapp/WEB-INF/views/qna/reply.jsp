<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/style/reset.css">
<link rel="stylesheet" href="/resources/style/basic.css">
<link rel="stylesheet" href="/resources/style/detail.css">
<title>Insert title here</title>
<c:import url="../temp/bootStrap.jsp"></c:import>

<style>
	.title {font-size: 2.5rem;margin-bottom: 2rem;font-weight: 900;text-align: center;}
	.container {position:relative;} 
	
	.form-label {font-size:1.5rem; font-weight:600;}
	.mb-3 {display:flex; padding-top:0.5rem;}
	.textcon {flex-direction: column;}
	.relabel{width:15%;text-align: center;}
	.conlabel{margin-top: 1rem;}
	.textcon > .relabel{width: 100%;text-align: center;}
	#nName{width: 20rem;}
	.btn{
		border:var(--bs-btn-border-width) solid #80a9ff;
		background-color: #80a9ff;
		float: right;color: black;font-weight: 900;font-size: 1.1rem;
	}
	.btn-danger{
		--bs-btn-hover-border-color:#365496;
		--bs-btn-hover-bg:#365496;
		transition: all 0.5s cubic-bezier(0.28, -0.32, 0.58, 1.19);
		}
	#replyFrm {margin-bottom: 10rem;}
	textarea.form-control {height:20rem;resize: none;font-size: 1.3rem;}
</style>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
		
		<section class="container mt-5">
			<h1 class="title">답글작성</h1>
		
			<form action="./reply" method="post" id="replyFrm">
				<!-- 부모의 글번호&답글의 작성자, 제목, 내용 | 파라미터의 이름: dto와 동일, value : 받아온 부모의 번호를 넣는다. -->
				<input type="hidden" name="num" value="${num}">
				<div class="mb-3 nameLine">
				  <label for="name" class="form-label nameLabel relabel">작성자</label>
				  <input type="text" name="name" class="form-control" id="noticeName" value="${member.id}">
				</div>
				<div class="mb-3">
				  <label for="title" class="form-label relabel">문의내역</label>
				  <input type="text" name="subject" class="form-control" value="질문 답변입니다." id="noticeTitle" placeholder="제목을 작성하세요">
				</div>
				<div class="mb-3 textcon">
				  <label for="contents" class="form-label relabel conlabel">내용</label>
				  <textarea class="form-control" name="contents" value="${contnets}" id="noticeContents" rows="3"></textarea>
				</div>
				
				<button type="submit" class="btn btn-danger">답글 등록</button>
			</form>
			
			
		</section>
		<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>