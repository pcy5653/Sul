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
			<p>술담아의 <span class="review">리뷰 Best 4</span> 상품을 만나보세요!</p>
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
						<p class="pt">술담아 BEST 상품</p>
						<p>센스쟁이 MD 추천</p>
					</div>
					<a href="/product/list" class="best_more more">더보기</a>
				</div>
			</div>
			<div class="best_btm pro_btm">
				<ul>
					<li><a href="/product/detail?productNum=46" class="best pro">
						<div class="best_img pro_img">
							<img src="/resources/images/product/편백숲 산소막걸리 딸기 스파클링.jpg" alt="편백숲 산소막걸리 딸기 스파클링 이미지">
						</div>
						<div class="img_data">
							<p class="i_name">${p46.productName}</p>
							<div class="i_price">
								<p class="cost">${p46.price}<span class="won">원</span></p>
								<p class="i_score">
									<span class="score">${p46.score}</span>
									<span class="review_total">리뷰 ${p46r}개</span>
								</p>
							</div>
							<div class="i_hash">
								<p>${p46.contents}</p>
							</div>
						</div>
					</a></li>
					<li><a href="/product/detail?productNum=48" class="best pro">
						<div class="best_img pro_img">
							<img src="/resources/images/product/호호.jpg" alt="호호 이미지">
						</div>
						<div class="img_data">
							<p class="i_name">${p48.productName}</p>
							<div class="i_price">
								<p class="cost">${p48.price}<span class="won">원</span></p>
								<p class="i_score">
									<span class="score">${p48.score}</span>
									<span class="review_total">리뷰 ${p48r}개</span>
								</p>
							</div>
							<div class="i_hash">
								<p>${p48.contents}</p>
							</div>
						</div>
					</a></li>
					<li><a href="/product/detail?productNum=47" class="best pro">
						<div class="best_img pro_img">
							<img src="/resources/images/product/우주멜론미 X 3병.jpg" alt="우주멜론미 X 3병 이미지">
						</div>
						<div class="img_data">
							<p class="i_name">${p47.productName}</p>
							<div class="i_price">
								<p class="cost">${p47.price}<span class="won">원</span></p>
								<p class="i_score">
									<span class="score">${p47.score}</span>
									<span class="review_total">리뷰 ${p47r}개</span>
								</p>
							</div>
							<div class="i_hash">
								<p>${p47.contents}</p>
							</div>
						</div>
					</a></li>
					<li><a href="/product/detail?productNum=49" class="best pro">
						<div class="best_img pro_img">
							<img src="/resources/images/product/별산 오디 스파클링 막걸리 X 3병.jpg" alt="별산 오디 스파클링 막걸리 X 3병 이미지">
						</div>
						<div class="img_data">
							<p class="i_name">${p49.productName}</p>
							<div class="i_price">
								<p class="cost">${p49.price}<span class="won">원</span></p>
								<p class="i_score">
									<span class="score">${p49.score}</span>
									<span class="review_total">리뷰 ${p49r}개</span>
								</p>
							</div>
							<div class="i_hash">
								<p>${p49.contents}</p>
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
						<p class="pt">이번주 술담아 PICK!</p>
						<p>더운 여름에 청량감을 더한다면?</p>
					</div>
					<a href="/product/list" class="pick_more more">더보기</a>
				</div>
			</div>
			<div class="pick_btm pro_btm">
				<ul>
					<li>
						<a href="/product/detail?productNum=72" class="pick pro">
						<div class="pick_img pro_img">
							<img src="/resources/images/product/밀담 52.jpg" alt="밀담 52 이미지">
						</div>
						<div class="img_data">
							<p class="i_name">${p72.productName}</p>
							<div class="i_price">
								<p class="cost">${p72.price}<span class="won">원</span></p>
								<p class="i_score">
									<span class="score">${p72.score}</span>
									<span class="review_total">리뷰 ${p72r}개</span>
								</p>
							</div>
							<div class="i_hash">
								<p>${p72.contents}</p>
							</div>
						</div>
					</a></li>
					<li><a href="/product/detail?productNum=66" class="pick pro">
						<div class="pick_img pro_img">
							<img src="/resources/images/product/크라테 산머루 미디엄 드라이.jpg" alt="크라테 산머루 미디엄 드라이 이미지">
						</div>
						<div class="img_data">
							<p class="i_name">${p66.productName}</p>
							<div class="i_price">
								<p class="cost">${p66.price}<span class="won">원</span></p>
								<p class="i_score">
									<span class="score">${p66.score}</span>
									<span class="review_total">리뷰 ${p66r}개</span>
								</p>
							</div>
							<div class="i_hash">
								<p>${p66.contents}</p>
							</div>
						</div>
					</a></li>
					<li><a href="/product/detail?productNum=63" class="pick pro">
						<div class="pick_img pro_img">
							<img src="/resources/images/product/추사 블루 스위트.jpg" alt="추사 블루 스위트 이미지">
						</div>
						<div class="img_data">
							<p class="i_name">${p63.productName}</p>
							<div class="i_price">
								<p class="cost">${p63.price}<span class="won">원</span></p>
								<p class="i_score">
									<span class="score">${p63.score}</span>
									<span class="review_total">리뷰 ${p63r}개</span>
								</p>
							</div>
							<div class="i_hash">
								<p>${p63.contents}</p>
							</div>
						</div>
					</a></li>
					<li><a href="product/detail?productNum=45" class="pick pro">
						<div class="pick_img pro_img">
							<img src="/resources/images/product/삼양춘 탁주.jpg" alt="삼양춘 탁주 이미지">
						</div>
						<div class="img_data">
							<p class="i_name">${p45.productName}</p>
							<div class="i_price">
								<p class="cost">${p45.price}<span class="won">원</span></p>
								<p class="i_score">
									<span class="score">${p45.score}</span>
									<span class="review_total">리뷰 ${p45r}개</span>
								</p>
							</div>
							<div class="i_hash">
								<p>${p45.contents}</p>
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