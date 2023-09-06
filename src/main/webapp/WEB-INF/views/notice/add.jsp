<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<c:import url="../temp/header.jsp"></c:import>
<style>
.title {font-size:2rem}
/* header.css */

header {position: relative;}

/* footer.css */
footer {margin-top:7rem;}

</style>

<c:import url="../temp/bootStrap.jsp"></c:import>
<!-- include summernote css/js-->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/ScrollTrigger.min.js"></script>
<script src="/resources/js/main.js"></script>
</head>
<body>
	<!-- 헤더 -->
        <header>
            <h1>
                <a href="${pageContext.request.contextPath}/" class="main_logo">
					<img src="/resources/images/main/main_logo.png" alt="메인로고">
                </a>
            </h1>
          
            <ul>
                <c:if test="${not empty member}">
                <li class="not_empty_Basket"><a href="/product/basketList">
            		<img alt="" src="../resources/images/basket/cart.png" style="width: 30px; height: 30px;"></a></li>
	      		<li class="login"><a href="/member/logout">로그아웃</a></li>
	      		<li class="join"><a href="/member/mypage">mypage</a></li>
	      		</c:if>
				<c:if test="${empty member}">
	      		<li class="login"><a href="/member/login">로그인</a></li>
	      		<li class="join"><a href="/member/terms">회원가입</a></li>
	      		</c:if>            
	      	</ul>
        </header>
	<section class="container" style="width: 800px;" >

	<h1 class="title my-4 text-center" style="font-size:2.5rem;">Add Page</h1>
		<form action="./add" method="post" id="frm" enctype="multipart/form-data">
			<div class="mb-3">
				<label for="subject" class="form-label">SUBJECT</label>
				<input type="text" name="subject" class="form-control" id="subject" placeholder="제목을 입력하세요.">
			</div>
			
			<div class="mb-3">
				<label for="name" class="form-label">NAME</label>
				<input type="text" name="name" class="form-control" id="name" readonly value="${member.id}">
			</div>
			
			<div class="mb-3">
				<label for="contents" class="form-label">CONTENTS</label>
				<textarea class="form-control" name="contents" id="contents" rows="15" placeholder="내용을 입력하세요."></textarea>
			</div>
			
			<div class="my-3">
				<a class="btn btn-outline-secondary" href="./list" style='width:80px;float: right;'>목록</a>
				<button type="button" id="btn" class="btn btn-secondary">완료</button>
			</div>
		</form>
	</section>
	
	<script type="text/javascript">
		$("#contents").summernote({
			height:400,
			callbacks:{
				onImageUpload: function(files) {
					alert('이미지 업로드')
					let formData = new FormData(); 
					formData.append("files",files[0]); 

					$.ajax({
						type: 'post',
						url: 'setContentsImg',
						data:formData,
						cache:false,
						contentType:false,
						processData:false,
						success:function(result){
							$("#contents").summernote('insertImage', result.trim());
						},
						error:function(){
							console.log('error');
						}
					});
				},
				onMediaDelete:function(files){
					let path = $(files[0]).attr("src"); 

					$.ajax({
						type:'post',
						url:'./setContentsImgDelete',
						data:{
							path:path
						},
						success:function(result){
							console.log(result);
						},
						error:function(){
							console.log('error');
						}
					})
				}
			}
		});
	</script>
	<script>
		const btn = document.getElementById("btn");
		const subject = document.getElementById("subject");
		const frm = document.getElementById("frm");

		btn.addEventListener("click",function(){
			console.log(subject.value=="");
			console.log(subject.value.length == 0);
			if(subject.value==""){
				alert("제목은 필수입니다.");
				subject.focus();
			}else{
				frm.submit();
			}
		})
	</script>
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>