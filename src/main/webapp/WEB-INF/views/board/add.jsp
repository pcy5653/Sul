<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add page</title>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<section>
	<div class="main">
		<h1 id="title">${board} Add Page</h1>
		
		<form action="./add" method="post" id="frm" enctype="multipart/form-data">
			<div class="mb-3 nameLine">
			  <label for="name" class="form-label nameLabel">작성자</label>
			  <input type="text" name="name" class="form-control" id="writer" value="${member.id}">
			</div>
			<div class="mb-3">
			  <label for="title" class="form-label">Title</label>
			  <input type="text" name="subject" class="form-control" id="subject" placeholder="제목을 작성하세요">
			</div>
			<div class="mb-3">
			  <label for="contents" class="form-label">Contents</label>
			  <textarea class="form-control" name="contents" id="contents"></textarea>
			</div>	
			
			
			<div id="fileList" class="my-5"></div>
			
			<div class="mb-3">
				<button type="button"  id="add">File 추가</button>
			</div>
			

			<div class="my-3">
				<button type="button" class="btn btn-danger" id="btn">게시글 등록</button>
			</div>
		</form>
	</div>
</section>	
<c:import url="../temp/footer.jsp"></c:import>
<script src="/resources/js/board_add.js"></script>
</body>
</html>