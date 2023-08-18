<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board} List</title>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<section>
        <h1 id="title">${board} List</h1>

        <table>
            <thead>
                <tr>
                    <th>No</th><th>Title</th><th>작성자</th><th>날짜</th><th>HIT</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="dto" varStatus="i"></c:forEach>
                    <tr>
                        <td>${dto.num}</td>
                        <td><a href="#"> ${dto.subject}</a></td>
                        <td>${dto.name}</td>
                        <td>${dto.createDate}</td>
                        <td>${dto.hit}</td>
                    </tr>
            </tbody>
        </table>
    </section>

	

</body>
</html>