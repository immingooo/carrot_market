<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center pt-5 pb-5">
	<div class="col-3 p-0 pb-5">
		<%-- 이전페이지로 --%>
		<%-- <div>
			<a href="/user/user_profile_view"><img alt="<" src="/static/img/back.png" width="25px"></a>
		</div> --%>
		<form action="/user/update" method="put">
			<div class="d-flex justify-content-center p-2">
				<input type="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
				<a href="#"><img alt="프로필 이미지" src="" onerror="this.src='/static/img/user.png'" width="90px"></a>
			</div>
			<div class="font-weight-bold pt-2 pb-2">닉네임</div>
			<input type="text" class="form-control">
			
			<button type="submit" class="btn btn-orange text-light font-weight-bold w-100 mt-3">수정 완료</button>
		</form>
	</div>
</div>
