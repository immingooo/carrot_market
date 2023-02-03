<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당근 마켓</title>
	<!-- slim버전이 아닌 원본으로 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        

    <!-- 부트스트랩 CDN link-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<!-- css -->
	<link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>
<body>
	<div id="wrap">
		<header class="bg-info">
			<div class="small d-flex justify-content-end">
				<div><a>회원가입</a></div>
				<span class="pr-1 pl-1">|</span>
				<div><a>로그인</a></div>
				<span class="pr-1 pl-1">|</span>
				<div><a>고객센터</a></div>
			</div>
			<div>
				<div><img alt="당근마켓 로고" src="/static/img/logo_003.png" width="120px"></div>
				<ul class="nav">
					<li class="nav-list"><a href="#" class="nav-item">중고거래</a></li>
					<li class="nav-list"><a href="#" class="nav-item">동네가게</a></li>
					<li class="nav-list"><a href="#" class="nav-item">알바</a></li>
					<li class="nav-list"><a href="#" class="nav-item">부동산 직거래</a></li>
					<li class="nav-list"><a href="#" class="nav-item">중고거래</a></li>
				</ul>
				<div class="input-group mb-3">
				  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="basic-addon1">@</span>
				  </div>
				</div>
			</div>
		</header>
		<section id="contents" class="bg-warning"></section>
		<footer>
			<div class="d-flex justify-content-center border-top pt-5 pb-5">
				<div class="d-flex justify-content-center">
					<ul class="m-0">
						<li class="pb-3"><a href="#">중고거래</a></li>
						<li class="pb-3"><a href="#">동네가게</a></li>
						<li class="pb-3"><a href="#">당근알바</a></li>
						<li class="pb-3"><a href="#">부동산 직거래</a></li>
						<li><a href="#">중고차 직거래</a></li>
					</ul>
					<ul class="m-0">
						<li class="pb-3"><a href="#">당근비즈니스</a></li>
						<li class="pb-3"><a href="#">채팅하기</a></li>
					</ul>
					<ul class="pr-5 m-0">
						<li class="pb-3"><a href="#">자주 묻는 질문</a></li>
						<li class="pb-3"><a href="#">회사 소개</a></li>
						<li class="pb-3"><a href="#">인재 채용</a></li>
					</ul>
				</div>
				<div class="ml-5">
					<b>당근 앱 다운로드</b>
					<div class="d-flex mt-2">
						<div class="footer-box text-center">
							<div class="mt-2">
							<a href="#"><img alt="애플스토어 아이콘" src="https://cdn-icons-png.flaticon.com/512/0/747.png" width="16px" class="mr-2"><b>App Store</b></a>
							</div>
						</div>
						<div class="footer-box text-center ml-2">
							<div class="mt-2">
								<a href="#"><img alt="구글플레이 아이콘" src="https://cdn-icons-png.flaticon.com/512/2111/2111473.png" width="16px" class="mr-2"><b>Google Play</b></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="small text-secondary d-flex justify-content-center border-top pt-4">
				<div class="col-5 ml-4">
					<b>대표</b> 김용현, 황도연 | <b>사업자번호</b> 375-87-00088<br>
					<b>직업정보제공사업 신고번호</b> 2016-서울서초-0051<br>
					<b>주소</b> 서울특별시 구로구 디지털로 30길 28, 609호 (당근서비스)<br>
					<b>전화</b> 1544-9796 | <b>고객문의</b> cs@daangnservice.com
				</div>
				<div class="col-3">
					<a href="https://www.facebook.com/daangn" target="_blank" class="pr-2 pl-2"><img alt="페이스북" src="/static/img/facebook.png" width="25px"></a>
					<a href="https://www.instagram.com/daangnmarket/" target="_blank" class="pr-2 pl-2"><img alt="인스타그램" src="/static/img/instagram.png" width="25px"></a>
					<a href="https://www.youtube.com/channel/UC8tsBsQBuF7QybxgLmStihA" target="_blank" class="pr-2 pl-2"><img alt="유튜브" src="/static/img/youtube.png" width="25px"></a>
					<a href="https://blog.naver.com/daangn" target="_blank" class="pr-2 pl-2"><img alt="네이버 블로그" src="/static/img/blog.png" width="25px"></a>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>