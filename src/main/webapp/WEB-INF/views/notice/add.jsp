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
<c:import url="../temp/bootStrap.jsp"></c:import>
<link rel="stylesheet" href="/resources/style/detail.css">
<!-- include summernote css/js-->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/ScrollTrigger.min.js"></script>
<script src="/resources/js/main.js"></script>
</head>
<body>

	<section class="container" style="width: 800px;" >

	<h1 class="title my-4 text-center" style="font-size:2.5rem;">Add Page</h1>
		<form action="./add" method="post" id="frm" enctype="multipart/form-data">
			<div class="mb-3">
				<label for="subject" class="form-label">제목</label>
				<input type="text" name="subject" class="form-control" id="subject" placeholder="제목을 입력하세요.">
			</div>
			
			<div class="mb-3">
				<label for="name" class="form-label">작성자</label>
				<input type="text" name="name" class="form-control" id="name" readonly value="${member.id}">
			</div>
			
			<div class="mb-3">
				<label for="contents" class="form-label">내용</label>
				<textarea class="form-control" name="contents" id="contents" rows="15" placeholder="내용을 입력하세요."></textarea>
			</div>
			
			<div class="my-3">
				<a class="btn btn-outline-secondary" href="./list" style="width:80px; height: 40px; background-color: #f1f3f5; float : right; border: 0px;">목록</a>
				
				<button type="button" id="btn" class="btn btn-secondary" style='width:80px; float: left; line-height: 10px; border: 0px;'>완료</button>
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