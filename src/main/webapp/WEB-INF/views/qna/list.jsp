<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="/resources/style/reset.css">
<link rel="stylesheet" href="/resources/style/basic.css">
<link rel="stylesheet" href="/resources/style/detail.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<c:import url="../temp/header.jsp"></c:import>
	<input type="hidden" value="${member.id}" id="check_id" name="name">
	<section>
		<div class="wrap">
			<div class="main">
				<h1 id="title" style="font-weight: 900;">1:1 문의 내역</h1>
				<c:if test="${member.roleNum == 0}">
					<p id="totalNum">총 <span class="totalN">${total}</span> 개의 게시물이 작성되었습니다.</p>
				</c:if>
				<table>
					<thead>
						<tr>
							<th>문의내역</th><th>작성자</th><th>문의일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="dto" varStatus="i">
							<tr>
								<td class="listTitle"  data-num="${dto.num}" data-ref="${dto.ref}" data-step="${dto.step}" name="num" >
									<input type="hidden" value="${dto.num}"  name="ref" class="listRef">
									<a href="#">
										<c:catch>
											<c:forEach begin="1" end="${dto.depth}">
												<span class="material-icons comment" >
													subdirectory_arrow_right
												</span>
												<span class="re">RE: </span>
											</c:forEach>
										</c:catch>
										${dto.subject}
									</a>
								</td>
								<td id="id_name" data-member-id="${dto.name}">${dto.name}</td>
								<td>${dto.createDate}</td>
							</tr>
						</c:forEach>
					</tbody>
					<c:if test="${total eq 0}">
						<tbody id="NumZero">
							<tr><td colspan="3">고객님의 문의 내역이 없습니다.</td></tr>
						</tbody>
					</c:if>
				</table>
			</div>
			<nav class="t_page">
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
			</nav>

			<div class="t_search">
				<form action="./list" method="get" id="frm" class="t_frm">
					<input type="hidden" id="page" value="${pager.page}" name="page">
					<!-- parameter(name,value) -->
					<select name="kind" id="k" data-kind="${pager.kind}">
						<option value="title" class="kind">문의내역</option>
						<option value="contents" class="kind">내용</option>
					</select>
					<!-- parameter -->
					<input type="text" name="search" value="${pager.search}" class="search">
					<div class="t_btn">
						<button type="submit" class="s_btn">검색</button>
					</div>
				</form>
				
				<c:if test="${member.roleNum == 0}">	
					<a class="btn btn-danger" href="./add">게시물 등록</a>
				</c:if>
			</div>
		</div>
    </section>
    
    
    
<c:import url="../temp/footer.jsp"></c:import>
<script src="/resources/js/qna_list.js"></script>
