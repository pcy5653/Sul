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
	
		<h1 class="mb-3 text-center">List</h1> <br>
	
		<table class="table">
	
		<thead>
			<th scope="col">NO</th>
			<th scope="col" >SUBJECT</th>
			<th scope="col">NAME</th>
			<th scope="col">DATE</th>
			<th scope="col">HIT</th>
		</thead>
		<tbody class="table-group-divider">
		<c:forEach items="${list}" var="d" varStatus="i">
			<tr>
				<td>${d.num}</td>
				<td><a href="./detail?num=${d.num}" class="link-offset-2 link-underline link-underline-opacity-0 text-black">
					<c:catch>
						<c:forEach begin="1" end="${d.depth}">RE:</c:forEach>
					</c:catch>
					${d.subject}</a></td>
				<td>${d.name}</td>
				<td>${d.createDate}</td>
				<td>${d.hit}</td>
				
			</tr>
		</c:forEach>
		</tbody>
		</table>
	<a class="btn btn-outline-secondary" href="./add">Add</a>
</section>
</body>
</html>