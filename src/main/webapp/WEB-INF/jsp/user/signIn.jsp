<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center pt-3 pb-5">
	<div class="col-3 p-0 pb-5">
		<div class="d-flex justify-content-center mt-5 mb-4">
			<h4 class="font-weight-bold">로그인</h4>
		</div>
		<form id="signInForm" method="post" action="/user/sign_in">
			<input type="text" class="form-control mb-2 pt-2 pb-2" placeholder="아이디를 입력해주세요">
			<input type="password" class="form-control mb-3 pt-2 pb-2" placeholder="비밀번호를 입력해주세요">
			<div class="d-flex justify-content-center mb-3 small">
				<a href="#" style="text-decoration:none; color:black">아이디 찾기</a>
				<span>&nbsp;|&nbsp;</span>
				<a href="#" style="text-decoration:none; color:black">비밀번호 찾기</a>
			</div>
			<button type="submit" class="btn btn-orange text-light w-100 font-weight-bold mb-3">로그인</button>
			<a href="/user/sign_up_view" class="btn bg-orange w-100 font-weight-bold">회원가입</a>
		</form>
	</div>
</div>