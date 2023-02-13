<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center pt-3">
	<div class="col-4 p-0 pb-5">
		<!-- <div class="d-flex justify-content-end">
			<img alt="설정 아이콘" src="https://cdn-icons-png.flaticon.com/512/2099/2099058.png" width="25px">
		</div> -->
		<div class="d-flex justify-content-between m-3">
			<div class="d-flex col-9 p-0">
				<img alt="프로필 이미지" src="" onerror="this.src='/static/img/user.png'" width="40px">
				<h5 class="font-weight-bold pl-3 mt-2">덤덤</h5>
			</div>
			<div class="col-3 p-0">
				<a href="/user/user_profile_view" class="btn btn-light font-weight-bold">프로필 보기</a>
			</div>
		</div>
		<hr class="m-0" style="background:black; heigth:3px;">
		<div class="m-3">
			<h5 class="font-weight-bold">나의 거래</h5>
			<div class="pb-1"><a href="#" style="text-decoration:none; color:black">판매내역</a></div>
			<div class="pb-1"><a href="#" style="text-decoration:none; color:black">구매내역</a></div>
			<div class="pb-1"><a href="#" style="text-decoration:none; color:black">관심목록</a></div>
			<div><a href="#" style="text-decoration:none; color:black">당근가계부</a></div>
		</div>
		<hr class="m-0" style="background:black; heigth:3px;">
		<div class="m-3">
			<h5 class="font-weight-bold">나의 동네생활</h5>
			<div><a href="#" style="text-decoration:none; color:black">동네생활 글/댓글</a></div>
		</div>
		<hr class="m-0" style="background:black; heigth:3px;">
		<div class="m-3">
			<h5 class="font-weight-bold">나의 비즈니스</h5>
			<div class="pb-1"><a href="#" style="text-decoration:none; color:black">비즈프로필 관리</a></div>
			<div class="pb-1"><a href="#" style="text-decoration:none; color:black">광고</a></div>
			<div><a href="#" style="text-decoration:none; color:black">동네홍보 글</a></div>
		</div>
		<hr class="m-0" style="background:black; heigth:3px;">
		<div class="m-3">
			<h5 class="font-weight-bold">기타</h5>
			<div class="pb-1"><a href="#" style="text-decoration:none; color:black">내 동네 설정</a></div>
			<div class="pb-1"><a href="#" style="text-decoration:none; color:black">동네 인증하기</a></div>
			<div class="pb-1"><a href="#" style="text-decoration:none; color:black">알림 키워드 설정</a></div>
			<div class="pb-1"><a href="#" style="text-decoration:none; color:black">자주 묻는 질문</a></div>
			<div><a href="#" style="text-decoration:none; color:black">친구초대</a></div>
		</div>
	</div>
</div>