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
					<div id="idCheckType" class="small text-danger pt-1 d-none">아이디 형식이 틀렸습니다.</div>
				</div>
			</div>
			
			<div class="pb-3">
				<div class="d-flex justify-content-between pb-3">
					<label for="password"><h6 class="font-weight-bold mt-2">비밀번호</h6></label>
					<input type="password" id="password" name="password" class="form-control col-9" placeholder="비밀번호를 입력해주세요">
				</div>
				<div class="d-flex justify-content-between">
					<label for="confirmPassword"><h6 class="font-weight-bold mt-2">비밀번호 확인</h6></label>
					<input type="password" id="confirmPassword" class="form-control col-9" placeholder="비밀번호를 한번 더 입력해주세요">
				</div>
				<div class="d-flex">
					<div class="col-3"></div>
					<div id="confirmPasswordCheck" class="small text-danger pt-1 d-none">동일한 비밀번호를 입력하세요.</div>
				</div>
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
				<div class="d-flex justify-content-between col-9 p-0">
					<input type="text" id="address_kakao" name="address" class="form-control col-12" readonly>
					<!-- <input type="button" onclick="sample5_execDaumPostcode()" class="btn" value="주소 검색"><br> -->
				</div>
			</div>
			<!-- <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div> -->
			
			<button type="submit" class="btn bg-orange text-light w-100 font-weight-bold">가입하기</button>
		</form>
	</div>
</div>




<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		// 아이디 4자 이상
		$('#loginId').keyup(function() {
			$('#idCheckDuplicated').addClass('d-none');
			$('#idCheckOk').addClass('d-none');
			$('#idCheckType').addClass('d-none');
			$('#idCheckLength').addClass('d-none');
			var content = $(this).val();
			if (content.length > 3) {
				//$('#idCheckLength').addClass('d-none');
				
				let pattern = new RegExp("^[a-zA-Z][0-9a-zA-Z]{3,}$") // 글자 수 변경하기
				//console.log(content)
				if (pattern.test(content)) { // 정규식에 맞는다면
					$('#idCheckOk').removeClass('d-none');
				} else {
					$('#idCheckLength').addClass('d-none');
					$('#idCheckType').removeClass('d-none');
				}
			} else { // do-while문
				$('#idCheckLength').removeClass('d-none');
			}
		});
		
		
		// 닉네임 2자 이상
		$('#nickname').keyup(function() {
			$('#nicknameCheckDuplicated').addClass('d-none');
			$('#nicknameCheckOk').addClass('d-none');
			$('#nicknameCheckLength').removeClass('d-none');
			var content = $(this).val();
			if (content.length > 1) {
				$('#nicknameCheckLength').addClass('d-none');
				//alert("최대 3자까지 입력 가능합니다.");
				//$(this).val(content.substring(0, 3));
			}
		});
		
		// 실시간으로 비밀번호 일치하는지
		/* $('#confirmPassword').keyup(function() {
			$('#confirmPasswordCheck').removeClass('d-none');
			let password = $("#password").val().trim();
			for (let i = 0; i < confirmPassword.length; i++) {
				
			}
			if (password confirmPassword) {
				$('#confirmPasswordCheck').addClass('d-none');
				//alert("최대 3자까지 입력 가능합니다.");
				//$(this).val(content.substring(0, 3));
			}
		}); */
		
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
					} else if (data.code == 500) {
						alert(data.errorMessage);
					}
				}
				, error(e) {
					alert("아이디 중복확인에 실패했습니다.");
				}
			});
		});
		
		// 닉네임 중복검사
		$('#nicknameCheckBtn').on('click', function() {
			//alert('1111');
			$('#nicknameCheckLength').addClass('d-none');
			$('#nicknameCheckDuplicated').addClass('d-none');
			$('#nicknameCheckOk').addClass('d-none');
			
			let nickname = $("#nickname").val().trim();
			if (nickname.length < 2) {
				$('#nicknameCheckLength').removeClass('d-none');
				return;
			}
			
			$.ajax({
				type:"get"
				, url:"/user/is_duplicated_nickname"
				, data:{"nickname":nickname}
			
				, success(data) {
					if (data.code == 1) {
						if (data.result) { // 중복일 때
							$('#nicknameCheckDuplicated').removeClass('d-none');
						} else { // 중복 아닐 때
							$('#nicknameCheckOk').removeClass('d-none');
						}
					} else if (data.code == 500) {
						alert(data.errorMessage);
					}
				}
				, error(e) {
					alert("닉네임 중복확인에 실패했습니다.");
				}
			});
		});
		
		// 주소 API
	    $('#address_kakao').on("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("address_kakao").value = data.address; // 주소 넣기
	            }
	        }).open();
	    });
		
		// 회원가입 버튼클릭
		$("#signUpForm").on('submit', function(e){
			//alert("111");
			e.preventDefault();
			
			// 유효성 검사
			let loginId = $("#loginId").val().trim();
			let password = $("#password").val().trim();
			let confirmPassword = $("#confirmPassword").val().trim();
			let nickname = $("#nickname").val().trim();
			let address = $("#address").val();
			
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
			
			if ($('#idCheckOk').hasClass('d-none')) {
				alert('아이디 중복확인을 다시 해주세요.');
				return false;
			}
			
			if ($('#nicknameCheckOk').hasClass('d-none')) {
				alert('아이디 중복확인을 다시 해주세요.');
				return false;
			}
			
			let url = $(this).attr('action');
			let params = $(this).serialize();
			console.log(url);
			console.log(params);
			
			$.post(url,params)
			.done(function(data) {
				if (data.code == 1) {
					alert("회원가입을 축하드립니다!");
					//location.href="/user/sign_in_view";
				} else {
					alert(data.errorMessage);
				}
			});
		});
	});
</script>