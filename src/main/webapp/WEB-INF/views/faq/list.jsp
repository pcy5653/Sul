<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="/resources/style/reset.css">
<link rel="stylesheet" href="/resources/style/basic.css">
<link rel="stylesheet" href="/resources/style/detail.css">
<link rel="stylesheet" href="/resources/style/faq.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<c:import url="../temp/header.jsp"></c:import>
	<input type="hidden" value="${member.id}" id="check_id" name="name">
	<section>
		<div class="wrap">
			<div class="main">
				<h1 id="title" style="font-weight: 900;">FAQ</h1>
				<ul>
					<li class="faqKind"><a href="/faq/list" class="aKind">전체보기</a></li>
					<li class="faqKind"><a href="/faq/detail/operate" class="aKind">운영정책</a></li>
					<li class="faqKind"><a href="/faq/detail/member" class="aKind">계정</a></li>
					<li class="faqKind"><a href="/faq/detail/buy" class="aKind">구매</a></li>
					<li class="faqKind"><a href="/faq/detail/refund" class="aKind">환불</a></li>
				</ul>
				<p class="faqSub">자주 묻는 질문들을 먼저 확인해보세요!</p>
				<table id="faqList">
					<c:forEach items="${list}" var="dto" varStatus="i">
						<tr>
							<td class="listTitle"  data-num="${dto.num}"name="num" >
								<input type="hidden" value="${dto.num}"  name="ref" class="listRef">
								<a href="#">
									<span class="faqQ">Q.</span>
									${dto.subject}
								</a>
							</td>
							<td class="listBtn"><button id="underBtn">+</button></td>
						</tr>
						<tr id="faqCon"><td colspan="2" id="fcon">${dto.contents}</td></tr>
					</c:forEach>
				</table>
				<div class="t_search">
					<c:if test="${member.roleNum == 1}">	
						<a class="btn btn-danger" href="./add">등록</a>
					</c:if>
				</div>
			</div>
			<div class="side">
				<ul>
					<li class="notice"><a href="#">공지사항</a></li>
					<li class="qna"><a href="#">1:1문의</a></li>
				</ul>
			</div>
			<!-- <nav class="t_page">
				<ul class="pagination">
					<c:if test="${pager.pre}">
					<li class="page-item">
						<a class="move" href="#" data-num="${pager.startNum-1}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item "><a class="page-link move" href="#" data-num="${i}">${i}</a></li>
				</c:forEach>
				<c:if test="${pager.next}">
					<li class="page-item">
						<a class="move" href="#" data-num="${pager.lastNum+1}" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</c:if>
				</ul>
			</nav> -->

			
		</div>
    </section>
    
    
    
<c:import url="../temp/footer.jsp"></c:import>
<script type="text/javascript">

	$("#underBtn").click(function(){
		$("#faqCon").toggle();
		//$("#faqCon").css("display", "block");
	})
</script>

