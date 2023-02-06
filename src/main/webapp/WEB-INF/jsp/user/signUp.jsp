<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="col-5">
		<div class="d-flex justify-content-center mt-4 mb-4">
			<h4 class="font-weight-bold">회원가입</h4>
		</div>
		<form id="signUpForm" method="post" action="/user/sign_up">
			<%-- 프로필 이미지 --%>
			<!-- <div>
				<div class="d-flex justify-content-center">
					<img alt="프로필 이미지" src="/static/img/profile.jpg" width="100" class="profile-img border">
				</div>
				<div class="d-flex justify-content-center">
				<input type="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
					<button type="button" class="btn mt-2 mb-2">업로드</button>
				</div>
			</div> -->
			<div class="pb-3">
				<div class="d-flex justify-content-between">
					<label for="loginId"><h6 class="font-weight-bold mt-2">아이디</h6></label>
					<div class="d-flex justify-content-between col-9 p-0">
						<input type="text" id="loginId" name="loginId" class="form-control col-8" placeholder="아이디를 입력해주세요">
						<button type="button" id="loginIdCheckBtn" class="btn bg-orange text-light">중복확인</button>
					</div>
				</div>
				<div class="d-flex">
					<div class="col-3"></div>
					<div id="idCheckLength" class="small text-danger pt-1 d-none">아이디를 4자 이상 입력해주세요.</div>
					<div id="idCheckDuplicated" class="small text-danger pt-1 d-none">사용중인 아이디입니다.</div>
					<div id="idCheckOk" class="small text-success pt-1 d-none">사용 가능한 아이디입니다.</div>
				</div>
			</div>
				
			<div class="d-flex justify-content-between pb-3">
				<label for="password"><h6 class="font-weight-bold mt-2">비밀번호</h6></label>
				<input type="password" id="password" name="password" class="form-control col-9" placeholder="비밀번호를 입력해주세요">
			</div>
			<div class="d-flex justify-content-between pb-3">
				<label for="confirmPassword"><h6 class="font-weight-bold mt-2">비밀번호 확인</h6></label>
				<input type="password" id="confirmPassword" class="form-control col-9" placeholder="비밀번호를 한번 더 입력해주세요">
			</div>
			
			<div class="pb-3">
				<div class="d-flex justify-content-between">
					<label for="nickname"><h6 class="font-weight-bold mt-2">닉네임</h6></label>
					<div class="d-flex justify-content-between col-9 p-0">
						<input type="text" id="nickname" name="nickname" class="form-control col-8" placeholder="닉네임을 입력해주세요">
						<button type="button" id="nicknameCheckBtn" class="btn bg-orange text-light">중복확인</button>
					</div>
				</div>
				<div class="d-flex">
					<div class="col-3"></div>
					<div id="nicknameCheckLength" class="small text-danger pt-1 d-none">닉네임을 2자 이상 입력해주세요.</div>
					<div id="nicknameCheckDuplicated" class="small text-danger pt-1 d-none">사용중인 닉네임입니다.</div>
					<div id="nicknameCheckOk" class="small text-success pt-1 d-none">사용 가능한 닉네임입니다.</div>
				</div>
			</div>
			
			<div class="d-flex justify-content-between pb-3">
				<label for="address"><h6 class="font-weight-bold mt-2">주소</h6></label>
				<input type="text" id="address" name="address" class="form-control col-9">
			</div>
			
			<button type="submit" class="btn bg-orange text-light w-100 font-weight-bold">가입하기</button>
		</form>
	</div>
</div>

<script>
	$(document).ready(function() {
		// 아이디 중복검사
		$("#loginIdCheckBtn").on('click', function() {
			//alert("1111");
			$('#idCheckLength').addClass('d-none');
			$('#idCheckDuplicated').addClass('d-none');
			$('#idCheckOk').addClass('d-none');
			
			let loginId = $("#loginId").val().trim();
			if (loginId.length < 4) {
				$('#idCheckLength').removeClass('d-none');
				return;
			}
			
			$.ajax({
				type:"get"
				, url:"/user/is_duplicated_id"
				, data:{"loginId":loginId}
			
				, success(data) {
					if (data.code == 1) {
						if (data.result) { // 중복일 때
							$("#idCheckDuplicated").removeClass('d-none');
						} else { // 사용가능할 때
							$("#idCheckOk").removeClass('d-none');
						}
					} else (data.code == 500) {
						alert(data.errorMessage);
					}
				}
				, error(e) {
					alert("중복확인에 실패했습니다.");
				}
			});
		});
		
		$("#signUpForm").on('submit', function(e){
			//alert("111");
			e.preventDefault();
			
			// 유효성 검사
			let loginId = $("#loginId").val().trim();
			let password = $("#password").val().trim();
			let confirmPassword = $("#confirmPassword").val().trim();
			let nickname = $("#nickname").val().trim();
			let address = $("#address").val().trim();
			
			if (loginId == "") {
				alert("아이디를 입력해주세요");
				return false;
			}
			
			if (password == "" || confirmPassword == "") {
				alert("비밀번호를 입력해주세요");
				return false;
			}
			
			if (nickname == "") {
				alert("닉네임을 입력해주세요");
				return false;
			}
			
			if (address == "") {
				alert("주소를 입력해주세요");
				return false;
			}
			
			if (password != confirmPassword) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			
			
		});
	});
</script>