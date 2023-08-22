<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#title {font-size: 2.5rem; margin-bottom : 2rem;}
	table {border: 1px solid black; width:100%}
</style>

<title>${board} List</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<section>
		<div class="main">
	        <h1 id="title">${board} List</h1>
	
	        <table>
	            <thead>
	                <tr>
	                    <th>No</th><th>Title</th><th>작성자</th><th>날짜</th><th>HIT</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach items="${list}" var="dto" varStatus="i">
	                    <tr>
	                        <td>${dto.num}</td>
	                        <td><a href="./detail?num=${dto.num}"> ${dto.subject}</a></td>
	                        <td>${dto.name}</td>
	                        <td>${dto.createDate}</td>
	                        <td>${dto.hit}</td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
        </div>
        
        <a class="btn btn-danger" href="./add">게시물 등록</a>
        <%-- <c:if test="${not empty member}">
			
		</c:if> --%>
    </section>
    
    
    
	<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>