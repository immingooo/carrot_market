<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center pt-3 pb-5">
	<div class="col-4 p-0 pb-5">
		<div class="d-flex justify-content-between border-bottom">
			<div class="d-flex p-3">
				<img alt="프로필 이미지" src="${user.profileImageUrl}" onerror="this.src='/static/img/user.png'" width="70px" height="70px" style="border-radius: 50%;">
				<h5 class="font-weight-bold pl-3 pt-4 text-center p-0 m-0">${user.nickname}</h5>
			</div>
		</div>
		<div class="pb-3">
			<a href="/user/user_profile_update_view" class="btn btn-light w-100 font-weight-bold">프로필 수정</a>
		</div>
		
		<%-- 온도 --%>
		<div class="pb-5">
			<div class="small font-weight-bold">매너온도</div>
			<div class="d-flex justify-content-end font-weight-bold">${user.temperature}℃</div>
			<%-- 온도계 --%>
		</div>
		
		<div class="d-flex justify-content-between border-bottom p-3">
			<div class="font-weight-bold">활동 배지 N개</div>
			<a href="#"><img alt=">" src="https://cdn-icons-png.flaticon.com/512/709/709586.png" width="20px" height="15px" class="mb-1"></a>
		</div>
		<div class="d-flex justify-content-between border-bottom p-3">
			<div class="font-weight-bold">판매 상품 N개</div>
			<a href="#"><img alt=">" src="https://cdn-icons-png.flaticon.com/512/709/709586.png" width="20px" height="15px" class="mb-1"></a>
		</div>
		<div class="d-flex justify-content-between border-bottom p-3">
			<div class="font-weight-bold">받은 매너 평가</div>
			<a href="#"><img alt=">" src="https://cdn-icons-png.flaticon.com/512/709/709586.png" width="20px" height="15px" class="mb-1"></a>
		</div>
		<div class="d-flex justify-content-between p-3">
			<div class="font-weight-bold">받은 거래 후기 N</div>
			<a href="#"><img alt=">" src="https://cdn-icons-png.flaticon.com/512/709/709586.png" width="20px" height="15px" class="mb-1"></a>
		</div>
	</div>
</div>