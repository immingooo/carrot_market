<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 비로그인 --%>
<c:if test="${empty userId}">
<div class="small d-flex justify-content-end pt-2 pb-2">
	<div><a href="/user/sign_up_view" style="text-decoration:none; color:black">회원가입</a></div>
	<span class="pr-1 pl-1">|</span>
	<div><a href="/user/sign_in_view" style="text-decoration:none; color:black">로그인</a></div>
	<span class="pr-1 pl-1">|</span>
	<div><a href="#" style="text-decoration:none; color:black">고객센터</a></div>
</div>
</c:if>
<%-- 로그인 --%>
<c:if test="${not empty userId}">
<div class="d-flex justify-content-end pt-2">
    <div class="dropdown">
	<a class="pr-3 dropbtn dropdown-toggle" href="#" style="text-decoration:none; color:black">
	${userNickname}님
	</a>
	<div class="dropdown-content">
	  <a href="/user/user_info_view">내 정보</a>
	  <a href="/user/sign_out">로그아웃</a>
	</div>
	</div>
    
	<a href="#"><img alt="관심목록 아이콘" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png" width="30px" class="mr-2"></a>
	<a href="#"><img alt="채팅목록 아이콘" src="https://cdn-icons-png.flaticon.com/512/2076/2076218.png" width="30px" class="mr-2"></a>
	<a href="#"><img alt="알림 아이콘" src="https://cdn-icons-png.flaticon.com/512/709/709846.png" width="30px"></a>
</div>
</c:if>

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
 	<a href="#" class="input-group-text" id="searchBtn">
    	<img alt="검색 아이콘" src="https://cdn-icons-png.flaticon.com/512/2866/2866321.png" width="25px">
    </a>
	</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('#searchBtn').on('click', function(e) {
			e.preventDefault();
			//alert('1111');
			let keyword = $('#keyword').val().trim();
			//console.log(keyword);
			if (keyword == '') {
				alert('검색어를 입력해주세요');
				return;
			}
			
			$.ajax({
				type:"get"
				, url:"/main/search_result_view"
				, data:{"keyword":keyword}
			
				, success:function(data) {
					console.log(data) // data에 searchContent가 들어있음
					$('.search-box').html(data)
					location.href="/main/search_view" // ???
					//location.href="/main/search_result_view"
				}
				, error:function(e) {
					alert("검색에 실패했습니다. 관리자에게 문의해주세요.");
				}
			});
		});
	});
</script>