<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/resources/style/reset.css">
	<link rel="stylesheet" href="/resources/style/basic.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200;300;400;500;600;700;800&family=Jua&display=swap" rel="stylesheet">
	<title>4조 프로젝트</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/ScrollTrigger.min.js"></script>
</head>
<body>
<c:import url="./temp/header.jsp"></c:import>

<main>
	<section id="video_wrap">
		<div class="video_div">
			<video src="/resources/main_bnr.mp4" type="video.mp4" autoplay loop muted></video>
		</div>
		<!-- /video_wrap -->
	</section>
	<section id="review_wrap">
		<div class="review_div">
			<p>술담화의 <span class="review">리뷰 Best 4</span> 상품을 만나보세요!</p>
			<button id="reviewBtn">PUSH</button>
			<div id="reviewTotal">
				<div id="review_fixed"></div>
				<button id="review_del"></button>
			</div>
		</div>
		<!-- /review_wrap -->
	</section>
	<section id="nav_wrap">
		<div class="nav_div">
			<ul>
				<li class="nav-item">
					<a class="nav-link active" href="/product/list">
						<span class="img_div">
							<img src="/resources/images/main/total.png" alt="전체상품이미지">
						</span>
						<span class="img_text">전체 상품</span>
					</a>
				</li>
				<li class="nav-item">
					
					<a class="nav-link active" href="/product/list/takju">
						<span class="img_div">
							<img src="/resources/images/main/takju.png" alt="탁주이미지">
						</span>
						<span class="img_text">탁주</span>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="/product/list/chungju">
						<span class="img_div">
							<img src="/resources/images/main/cheongju.png" alt="청주이미지">
						</span>
						<span class="img_text">약, 청주</span>
					</a>
				</li>			        
				<li class="nav-item">
					<a class="nav-link active" href="/product/list/wine">
						<span class="img_div">
							<img src="/resources/images/main/gwashilju.png" alt="과실주이미지">
						</span>
						<span class="img_text">과실주</span>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="/product/list/soju">
						<span class="img_div">
							<img src="/resources/images/main/jeungryuju.png" alt="증류주이미지">
						</span>
						<span class="img_text">증류주</span>
					</a>
				</li>
			</ul>				
		</div>
	</section>
	<section id="search_wrap">
		<div id="search">
			<p id="searchTitle">무슨 <span>술</span>을 마실지 고민되시나요?</p>
			<form id="searchFrm" action="${pageContext.request.contextPath}/product/list" method="get">
				<select name="kind">
					<option value="name">이름</option>
					<option value="contents">내용</option>
				</select>
				<input type="text" name="search" placeholder="원하는 술을 검색해보세요!">
		   </form>
		</div>
	</section>
	<section id="pro_wrap">
		<div class="best_div pro_div">
			<div class="best_top pro_top">
				<div class="best_text pro_text">
					<div class="best_title pro_title">
						<p class="pt">술담화 BEST 상품</p>
						<p>센스쟁이 MD 추천</p>
					</div>
					<a href="/product/list" class="best_more more">더보기</a>
				</div>
			</div>
			<div class="best_btm pro_btm">
				<ul>
					<li><a href="#" class="best pro">
						<div class="best_img pro_img">
							<img src="/resources/images/main/p1.jpg" alt="혼디주 이미지">
						</div>
						<div class="img_data">
							<p class="i_name">혼디주</p>
							<div class="i_price">
								<p class="cost">7,200<span class="won">원</span></p>
								<p class="i_score">
									<span class="score">4.9</span>
									<span class="review_total">리뷰 82</span>
								</p>
							</div>
							<div class="i_hash">
								<p>#제주 감귤주</p>
								<p>#새콤달콤에 구수함을 더한</p>
							</div>
						</div>
					</a></li>
					<li><a href="#" class="best pro">
						<div class="best_img pro_img">
							<img src="/resources/images/main/p2.jpg" alt="온지 몬 이미지">
						</div>
						<div class="img_data">
							<p class="i_name">시작을 여는 술들</p>
							<div class="i_price">
								<p class="cost">22,000<span class="won">원</span></p>
								<p class="i_score">
									<span class="score">4.9</span>
									<span class="review_total">리뷰 82</span>
								</p>
							</div>
							<div class="i_hash">
								<p>#MD 최애술</p>
								<p>#다들 맛 봤으면 좋겠다</p>
							</div>
						</div>
					</a></li>
					<li><a href="#" class="best pro">
						<div class="best_img pro_img">
							<img src="/resources/images/main/p3.jpg" alt="모든날에 이미지">
						</div>
						<div class="img_data">
							<p class="i_name">모든날에</p>
							<div class="i_price">
								<p class="cost">22,000<span class="won">원</span></p>
								<p class="i_score">
									<span class="score">4.9</span>
									<span class="review_total">리뷰 82</span>
								</p>
							</div>
							<div class="i_hash">
								<p>#새콤쌉쌀</p>
								<p>#모든날에 잘 어울려요</p>
							</div>
						</div>
					</a></li>
					<li><a href="#" class="best pro">
						<div class="best_img pro_img">
							<img src="/resources/images/main/p4.jpg" alt="청비성 16% 이미지">
						</div>
						<div class="img_data">
							<p class="i_name">청비성 16%</p>
							<div class="i_price">
								<p class="cost">22,000<span class="won">원</span></p>
								<p class="i_score">
									<span class="score">4.9</span>
									<span class="review_total">리뷰 82</span>
								</p>
							</div>
							<div class="i_hash">
								<p>#고소한 쌀 튀밥 향</p>
								<p>#은은한 산미</p>
							</div>
						</div>
					</a></li>
				</ul>
			</div>
		</div>


		<div class="pick_div pro_div">
			<div class="pick_top pro_top">
				<div class="pick_text pro_text">
					<div class="pick_title pro_title">
						<p class="pt">이번주 술담화 PICK!</p>
						<p>더운 여름에 청량감을 더한다면?</p>
					</div>
					<a href="/product/list" class="pick_more more">더보기</a>
				</div>
			</div>
			<div class="pick_btm pro_btm">
				<ul>
					<li>
						<a href="#" class="pick pro">
						<div class="pick_img pro_img">
							<img src="/resources/images/main/b1.jpg" alt="담솔 이미지">
						</div>
						<div class="img_data">
							<p class="i_name">담솔</p>
							<div class="i_price">
								<p class="cost">22,000<span class="won">원</span></p>
								<p class="i_score">
									<span class="score">4.9</span>
									<span class="review_total">리뷰 82</span>
								</p>
							</div>
							<div class="i_hash">
								<p>#코로 시원하게 들어오는 솔향</p>
								<p>#마시는 피톤치드</p>
							</div>
						</div>
					</a></li>
					<li><a href="#" class="pick pro">
						<div class="pick_img pro_img">
							<img src="/resources/images/main/b2.jpg" alt="솔섬 17% 이미지">
						</div>
						<div class="img_data">
							<p class="i_name">솔섬 17%</p>
							<div class="i_price">
								<p class="cost">22,000<span class="won">원</span></p>
								<p class="i_score">
									<span class="score">4.9</span>
									<span class="review_total">리뷰 82</span>
								</p>
							</div>
							<div class="i_hash">
								<p>#한약재 향</p>
								<p>#스모키한 풍미</p>
							</div>
						</div>
					</a></li>
					<li><a href="#" class="pick pro">
						<div class="pick_img pro_img">
							<img src="/resources/images/main/b3.jpg" alt="참주가 솔 막걸리 이미지">
						</div>
						<div class="img_data">
							<p class="i_name">참주가 솔 막걸리</p>
							<div class="i_price">
								<p class="cost">22,000<span class="won">원</span></p>
								<p class="i_score">
									<span class="score">4.9</span>
									<span class="review_total">리뷰 82</span>
								</p>
							</div>
							<div class="i_hash">
								<p>#페퍼민트 차를 마신 듯</p>
								<p>#뼛속까지 시원해지는 개운함</p>
							</div>
						</div>
					</a></li>
					<li><a href="#" class="pick pro">
						<div class="pick_img pro_img">
							<img src="/resources/images/main/b4.jpg" alt="메밀로 25% 이미지">
						</div>
						<div class="img_data">
							<p class="i_name">메밀로 25%</p>
							<div class="i_price">
								<p class="cost">22,000<span class="won">원</span></p>
								<p class="i_score">
									<span class="score">4.9</span>
									<span class="review_total">리뷰 82</span>
								</p>
							</div>
							<div class="i_hash">
								<p>#고소한 메밀차의 풍미</p>
								<p>#메밀로 만든 메밀로</p>
							</div>
						</div>
					</a></li>
				</ul>
			</div>
		<!-- pick_div -->
		</div>
	</section>
</main>
<c:import url="./temp/footer.jsp"></c:import>
<script src="/resources/js/main.js"></script>
</body>

</html>