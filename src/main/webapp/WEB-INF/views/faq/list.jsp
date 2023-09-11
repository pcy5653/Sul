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

		<h1 id="title" style="font-weight: 900;">FAQ</h1>
		<div class="wrap">
			<div class="main">
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
								<a href="#">
									<span class="faqQ">Q.</span>
									${dto.subject}
								</a>
							</td>
							<td class="listBtn"><button class="underBtn" data-index="${i.index}">+</button></td>
						</tr>
						<tr class="faqCon" data-index="${i.index}">
							<td colspan="2" class="fcon">
								${dto.contents} <br>
								<div class="faqTBtn">
									<form class="frm" action="">
										<input type="text" class="faqIn" name="num" value="${dto.num}">
									</form>
									<!-- 입력 form으로 method GET -->
									<button class="c1 upBtn" data-url="/faq/update" data-form-id="form1">수정</button>
						
									<!-- method POST -->
									<input type="hidden" data-url="/faq/delete" data-delete-name="name" data-delete-num="${member.id}">
									<button class="c1 deBtn" data-url="/faq/delete" data-form-id="form1" data-delete-name="num" data-delete-num="${dto.num}">삭제</button>
								</div>
							</td>
						</tr>
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
<script src="/resources/js/faq/faq.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
		$(".underBtn").click(function() {
			let btnIndex = $(this).data("index");
        
			let $faqCon = $(".faqCon[data-index='" + btnIndex + "']");
			$faqCon.toggle();
        
		});
	});
</script>