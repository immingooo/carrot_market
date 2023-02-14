<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center pt-5 pb-5">
	<div class="col-3 p-0 pb-5">
		<%-- 이전페이지로 --%>
		<%-- <div>
			<a href="/user/user_profile_view"><img alt="<" src="/static/img/back.png" width="25px"></a>
		</div> --%>
		<!-- <form action="/user/update" method="put"> -->
			<div class="d-flex justify-content-center p-1">
				<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
				<a href="#" id="fileUpload"><img alt="프로필 이미지" id="preview" src="${user.profileImageUrl}" onerror="this.src='/static/img/user.png'" width="100px" height="100px" style="border-radius: 50%;"></a>
			</div>
			<div class="font-weight-bold pt-2 pb-2">닉네임</div>
			<input type="text" id="nickname" class="form-control" value="${user.nickname}">
			<div id="nicknameCheckLength" class="small text-danger pt-1 d-none">닉네임을 2자 이상 입력해주세요.</div>
			<div id="nicknameCheckDuplicated" class="small text-danger pt-1 d-none">사용중인 닉네임입니다.</div>
			<div id="nicknameCheckType" class="small text-danger pt-1 d-none">닉네임은 띄어쓰기 없이 한글, 영문, 숫자만 가능해요.</div>
			
			<button type="button" id="updateBtn" class="btn btn-orange text-light font-weight-bold w-100 mt-3">수정 완료</button>
		<!-- </form> -->
	</div>
</div>

<script>
	$(document).ready(function() {
		// 닉네임 입력할 때 (2자 이상인지 정규식확인)
		$('#nickname').keyup(function() {
			$('#nicknameCheckDuplicated').addClass('d-none');
			$('#nicknameCheckLength').addClass('d-none');
			$('#nicknameCheckType').addClass('d-none');
			
			var content = $(this).val();
			if (content.length > 1) { // 2자 이상일 때
				//let pattern = /^[a-zA-Zㄱ-힣][a-zA-Zㄱ-힣]*$/; // 한글, 영문
				let pattern = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/; // 한글, 영문, 숫자
				if (!(pattern.test(content))) { // 정규식에 맞지않는다면
					$('#nicknameCheckType').removeClass('d-none');
					$('#updateBtn').attr('disabled', 'disabled');
				} else { // 정규식에 맞을 때
					$('#updateBtn').removeAttr("disabled");
				}
			} else {
				$('#updateBtn').attr('disabled', 'disabled');
				$('#nicknameCheckLength').removeClass('d-none');
			}
		});
		
		// 프로필 이미지 클릭
	    $('#fileUpload').on('click', function(e){
			//alert("1111");
			e.preventDefault(); // a태그의 스크롤이 저절로 올라가는 현상 방지(a태그의 성질)
			$('#file').click(); // input file을 사용자가 클릭한 것과 같은 효과
		});
		
	 	// 사용자가 이미지를 선택했을 때 유효성 확인(file에 변경이 일어났을 때로 이벤트를 잡아야 함)
		$('#file').on('change', function(e) { // e에 파일이름도 들고 있음
			//alert("파일 선택");
			let fileName = e.target.files[0].name; // target은 this랑 같은 역할. 파일명만 가져옴 dog-4372036_960_720.jpg
			//alert(fileName);
			
			// 확장자 유효성 확인
			let ext = fileName.split(".").pop().toLowerCase(); // jpg
			if (ext != 'jpg' && ext != 'jpeg' && ext != 'gif' && ext != 'png') {
				alert("이미지 파일만 업로드 할 수 있습니다.");
				$('#file').val(''); // 파일 태그의 실제 파일 제거(중요)
				return;
			}
			
			let file = e.target.files[0];
			
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#preview").attr("src", e.target.result);
			}
			
			reader.readAsDataURL(file);
			console.log("미리보기 이미지 파일: " + $('#file').val());
		});
		
		// 수정 버튼 클릭(닉네임 중복확인, 닉네임 validation 체크, 이미지 전송)
		$('#updateBtn').on('click', function() {
			//alert("1111");
			
			let nickname = $('#nickname').val().trim();
			if (nickname == '') {
				alert("닉네임을 입력해주세요.");
				return;
			}
			
			let file = $('#file').val(); 
			console.log(file);
			
			// 파일이 새로 업로드 된 경우에 확장자 체크
			if (file != '') {
				let ext = file.split(".").pop().toLowerCase(); // 확장자
				if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1) { // $.inArray(): 이 배열에 있는지. 없으면 -1리턴
					alert("이미지 파일만 업로드 할 수 있습니다.");
					$('#file').val(""); // 잘못된 파일을 비운다.
					return;
				}
			}
			
			let formData = new FormData();
			formData.append("nickname", nickname);
			formData.append("file", $('#file')[0].files[0]);
			
			$.ajax({
				type:"PUT"
				, url:"/user/update"
				, data:formData
				, enctype:"multipart/form-data" // 파일 업로드를 위한 필수 설정
				, processData:false // 파일 업로드를 위한 필수 설정
				, contentType:false // 파일 업로드를 위한 필수 설정
				
				, success:function(data) {
					if (data.code == 1) { // 회원정보수정 성공
						alert("회원 정보가 수정되었습니다.");
						location.reload();
					} else if (data.code == 500) { // 닉네임이 중복일 때
						$("#nicknameCheckDuplicated").removeClass('d-none');
						$('#updateBtn').attr('disabled', 'disabled');
					} else { // 로그인이 풀렸을 때
						alert(data.errorMessage);
						location.href="/user/sign_in_view";
					}
				}
				, error:function(e) {
					alert("정보 수정에 실패했습니다. 관리자에게 문의해주세요.");
				}
			});
		});
	});
</script>