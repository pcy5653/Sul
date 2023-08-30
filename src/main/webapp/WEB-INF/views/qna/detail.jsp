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
<title>Detail Page</title>
<base href="/">
<style>
	#title {font-size: 2.5rem; margin-bottom : 2rem;}
	table {border: 1px solid black;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<c:import url="../temp/header.jsp"></c:import>
	<section>
		<div class="wrap">
			<input type="hidden" value="${member.roleNum}" id="role" name="roleNum">
			<h1 id="title">상세 문의</h1>
			<div id="question" data-step="${dto.qnaDTO.step}" data-con="${dto.qnaDTO.contents}" data-num = "${dto.qnaDTO.num}">
				<!-- 질문내용 -->
			</div>
			<table id="comment" data-step="${dto.step}">
				<thead>
					<th class="subject">SUBJECT</th><th class="name">작성자</th><th class="date">날짜</th><th class="hit">HIT</th>
				</thead>
				<tbody>
					<tr>
						<td>${dto.subject}</td>
						<td>${dto.name}</td>
						<td>${dto.createDate}</td>
						<td>${dto.hit}</td>
					</tr>			
				</tbody>
			</table>
			<table>
				<tr><th class="dcont">내용</th></tr>
				<tr class="dcont"><td class="dcon">${dto.contents}</td></tr>
			</table>