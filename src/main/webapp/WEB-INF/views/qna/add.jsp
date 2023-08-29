<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add page</title>
<link rel="stylesheet" href="/resources/style/detail.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<c:import url="../temp/header.jsp"></c:import>
<section>
	<div class="wrap">
		<div class="main">
			<h1 id="title">1:1 문의하기</h1>
			<form action="./add" method="post" id="frm" class="t_frm" enctype="multipart/form-data">
				<div class="mb-3 nameLine">
					<label for="name" class="form-label nameLabel">작성자</label>
					<input type="text" name="name" class="form-control" id="writer" value="${member.id}">
				</div>
				<div class="mb-3">
					<label for="title" class="form-label">문의내역</label>
					<input type="text" name="subject" class="form-control" id="subject" placeholder="제목을 작성하세요">
				</div>
				<div class="mb-3">
					<label for="contents" class="form-label">내용</label>
					<textarea class="form-control" name="contents" id="contents"></textarea>
				</div>	
				
				
				<div id="fileList" class="my-5"></div>
				
				<div class="mb-3">
					<button type="button" id="add">File 추가</button>
				</div>
				
	
				<div class="my-3">
					<button type="button" class="btn btn-danger" id="btn">게시글 등록</button>
				</div>
			</form>




			<table>
				<thead>
					<tr>
						<th>문의내역</th><th>문의일</th><th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="dto" varStatus="i">
						<tr>
							<td><a href="./detail?num=${dto.num}">${dto.subject}</a></td>
							<td>${dto.createDate}</td>
							<td>${dto.hit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</section>	
<c:import url="../temp/footer.jsp"></c:import>
<script src="/resources/js/qna_add.js"></script>
<script src="/resources/js/file.js"></script>
</body>
</html>