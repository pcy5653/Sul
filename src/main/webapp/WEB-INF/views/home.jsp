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
	<section id="pro_wrap">
		<div class="best_div pro_div">
			<div class="best_top pro_top">
				<div class="best_text pro_text">
					<div class="best_title pro_title">
						<p class="pt">술담화 BEST 상품</p>
						<p>MD 추천</p>
					</div>
					<a href="#" class="best_more more">더보기</a>
				</div>
			</div>
			<div class="best_btm pro_btm">
				<ul>
					<li><a href="#" class="best pro">
						<div class="best_img pro_img">
							<img src="/resources/images/main/p1.jpg" alt="혼디주 이미지">
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
					<li><a href="#" class="best pro">
						<div class="best_img pro_img">
							<img src="/resources/images/main/p2.jpg" alt="온지 몬 이미지">
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
					<li><a href="#" class="best pro">
						<div class="best_img pro_img">
							<img src="/resources/images/main/p3.jpg" alt="모든날에 이미지">
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
					<li><a href="#" class="best pro">
						<div class="best_img pro_img">
							<img src="/resources/images/main/p4.jpg" alt="청비성 16% 이미지">
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
				</ul>
			</div>
		<!-- /best_div -->
		</div>

		<div class="pick_div pro_div">
			<div class="pick_top pro_top">
				<div class="pick_text pro_text">
					<div class="pick_title pro_title">
						<p class="pt">이번주 술담화 PICK!</p>
						<p>더운 여름에 청량감을 더한다면?</p>
					</div>
					<a href="#" class="pick_more more">더보기</a>
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
							<img src="/resources/images/main/b3.jpg" alt="참주가 솔 막걸리 이미지">
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
							<img src="/resources/images/main/b4.jpg" alt="메밀로 25% 이미지">
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