<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 비로그인 --%>
<div class="small d-flex justify-content-end pt-2">
	<div><a href="/user/sign_up_view" style="text-decoration:none; color:black">회원가입</a></div>
	<span class="pr-1 pl-1">|</span>
	<div><a href="/user/sign_in_view" style="text-decoration:none; color:black">로그인</a></div>
	<span class="pr-1 pl-1">|</span>
	<div><a href="#" style="text-decoration:none; color:black">고객센터</a></div>
</div>
<%-- 로그인 --%>
<!-- <div class="d-flex justify-content-end pt-2">
	<span class="pr-3"><a href="#" style="text-decoration:none; color:black">ㅇㅇ님</a></span>
	<a href="#"><img alt="관심목록 아이콘" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png" width="30px" class="mr-2"></a>
	<a href="#"><img alt="채팅목록 아이콘" src="https://cdn-icons-png.flaticon.com/512/2076/2076218.png" width="30px" class="mr-2"></a>
	<a href="#"><img alt="알림 아이콘" src="https://cdn-icons-png.flaticon.com/512/709/709846.png" width="30px"></a>
</div> -->

<div class="d-flex justify-content-between pr-4 pl-4 pt-2 pb-3 top-fixed">
	<%-- 로고 --%>
	<div class="d-flex align-items-center pl-4">
		<a href="/main/main_view"><img alt="당근마켓 로고" src="/static/img/logo_003.png" width="120px"></a>
	</div>
	
	<%-- 메뉴 --%>
	<ul class="nav d-flex align-items-center col-6 justify-content-between font-weight-bold p-0">
		<li class="nav-list"><a href="#" class="nav-item nav-font-size pr-4" style="text-decoration:none">중고거래</a></li>
		<li class="nav-list"><a href="#" class="nav-item nav-font-size pr-4" style="text-decoration:none">동네가게</a></li>
		<li class="nav-list"><a href="#" class="nav-item nav-font-size pr-4" style="text-decoration:none">알바</a></li>
		<li class="nav-list"><a href="#" class="nav-item nav-font-size pr-4" style="text-decoration:none">부동산 직거래</a></li>
		<li class="nav-list"><a href="#" class="nav-item nav-font-size pr-4" style="text-decoration:none">중고차 직거래</a></li>
	</ul>
	
	<%-- 검색창 --%>
	<div class="input-group col-3 mr-5 p-0">
	  <input type="text" class="form-control" id="keyword" placeholder="물품이나 동네를 검색해보세요">
	  <div class="input-group-prepend">
	    <a href="#" class="input-group-text">
	    	<img alt="검색 아이콘" src="https://cdn-icons-png.flaticon.com/512/2866/2866321.png" width="25px">
	    </a>
	  </div>
	</div>
</div>