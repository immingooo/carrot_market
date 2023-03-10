<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center pt-3 pb-5">
	<div class="col-7 pb-5">
		<div class="d-flex justify-content-center mt-4 mb-4">
			<h4 class="font-weight-bold">내 물건 팔기</h4>
		</div>
		
		<form id="usedGoodsCreateForm" method="post"
			action="/used_goods/used_goods_create">
			<div class="pb-3">
				<div class="d-flex justify-content-between">
				
					<%-- 제목 --%>
					<div class="col-9 p-0 pr-2">
						<input type="text" id="title" name="title" class="form-control" placeholder="제목을 입력해주세요">
					</div>
					
					<%-- 카테고리 --%>
					<div class="d-flex justify-content-between">
						<select class="form-control" id="category" name="category">
							<option>카테고리</option>
							<option>디지털기기</option>
							<option>생활가전</option>
							<option>가구/인테리어</option>
							<option>생활/주방</option>
							<option>유아동</option>
							<option>유아도서</option>
							<option>여성의류</option>
							<option>여성잡화</option>
							<option>남성패션/잡화</option>
							<option>뷰티/미용</option>
							<option>스포츠/레저</option>
							<option>취미/게임/음반</option>
							<option>도서</option>
							<option>티켓/교환권</option>
							<option>가공식품</option>
							<option>반려동물용품</option>
							<option>식물</option>
							<option>기타 중고물품</option>
							<option>삽니다</option>
						</select>
					</div>
				</div>
			</div>

			<%-- 가격 --%>
			<div class="pb-3">
				<div>
					<input type="text" id="price" name="price" class="form-control"
						placeholder="가격"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				</div>
			</div>

			<%-- 내용 --%>
			<div class="pb-3">
				<textarea class="form-control" id="content" name="content"
					placeholder="내용을 입력해주세요" rows="8" cols="10"></textarea>
			</div>

			<%-- 장소 --%>
			<div class="pb-2">
				<div>
					<input type="text" class="form-control" id="place" name="place"
						placeholder="장소를 입력해주세요" readonly>
				</div>
			</div>

			<%-- 이미지들 --%>
			<!-- <div class="file-upload d-flex pb-2">
				<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
				<a href="#" id="fileUploadBtn"><img src="https://cdn-icons-png.flaticon.com/512/45/45010.png" alt="이미지 업로드" width="50px"></a>
				<div id="fileName" class="ml-2"></div>
			</div> -->
			<div class="file-upload d-flex pb-2">
				<input type="file" id="file" name="file" class="d-none" multiple="multiple" accept=".gif, .jpg, .png, .jpeg">
				<a href="#" id="fileUploadBtn"><img src="https://cdn-icons-png.flaticon.com/512/875/875068.png" alt="이미지 업로드" width="100px"></a>
				<div id="fileName" class="ml-2 d-none"></div>
				<div id="preview"></div>
			</div>

			<button type="submit" id="uploadBtn"
				class="btn btn-orange text-light w-100 font-weight-bold">작성완료</button>
		</form>
	</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		var inputFileList = new Array();     // 이미지 파일을 담아놓을 배열 (업로드 버튼 누를 때 서버에 전송할 데이터)
		
		// 파일업로드 이미지 클릭(숨겨둔 file태그 동작시킴)
		$("#fileUploadBtn").on('click', function(e) {
			e.preventDefault();
			$('#file').click();
		});

		// 파일 선택 이벤트
		$('input[name=file]').on('change', function(e) {
			
			//이미지 미리보기 내용 비워주기
			$('#preview').empty();
			
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			// 업로드 된 파일 유효성 체크
			if (filesArr.length > 5) {
				alert("이미지는 최대 5개까지 업로드 가능합니다.");
				$('input[name=file]').val("");
				return false;
			}
		
			// 확장자 유효성 확인 - 파일이 여러개여서 반복문 돌려야 함
			for (let i = 0; i < filesArr.length; i++) {
				//console.log(filesArr[i].name);
				let ext = filesArr[i].name.split(".").pop().toLowerCase()
				if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1) { 
					alert("이미지 파일만 업로드 할 수 있습니다.");
					$('#file').val(""); // 잘못된 파일을 비운다.
					return;
				}
			}
			
			preview(filesArr);
	      
			filesArr.forEach(function(f) { 
				inputFileList.push(f);    // 이미지 파일을 배열에 담는다.
			});
		});
		
		// 사진 미리보기
		function preview(arr){
		      arr.forEach(function(f){
		        
		        //div에 이미지 추가
		        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
		        
		        //이미지 파일 미리보기
		        if(f.type.match('image.*')){
		          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
		          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
		            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
		            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
		            str += '</li></div>';
		            $(str).appendTo('#preview');
		          } 
		          reader.readAsDataURL(f);
		        }else{
		          /* str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
		          $(str).appendTo('#preview'); */
		        }
		      });//arr.forEach
		    }
		
		// 주소 API
	    $('#place').on("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("place").value = data.address; // 주소 넣기
	            }
	        }).open();
	    });
		
		// 글 작성 버튼클릭
		$('#usedGoodsCreateForm').on('submit', function(e) {
			//alert("111");
			e.preventDefault();
			
			let title = $('#title').val();
			let category = $('#category').val();
			//console.log(category); // 문자
			let price = $('#price').val();
			let content = $('#content').val();
			//content = content.replaceAll(/(\n|\r\n)/g, "<br>");
			let place = $('#place').val();
			
			
			if (title == '') {
				alert("제목을 입력해주세요");
				return false;
			}
			if (category == "카테고리") {
				alert("카테고리를 선택해주세요");
				return false;
			}
			if (content == '') {
				alert("내용을 입력해주세요");
				return false;
			}
			
			console.log("inputFileList: " + inputFileList); // inputFileList: [object File],[object File],[object File]
			let formData = new FormData();  // 폼 객체 $('#usedGoodsCreateForm')[0]
			formData.append("title", title);
			formData.append("category", category);
			formData.append("price", price);
			formData.append("content", content);
			formData.append("place", place);
			
			if (inputFileList != null) { // 이미지 파일이 선택된 경우에만 담기
				for (let i = 0; i < inputFileList.length; i++) {
				　　　　formData.append("images", inputFileList[i]);  // 배열에서 이미지들을 꺼내 폼 객체에 담는다.
				　　}
			}
			
			$.ajax({
			　　　　type:'post'
			　　　　, url: '/used_goods/create'
			　　　　, data: formData
			　　　　, enctype:"multipart/form-data"  // 업로드를 위한 필수 파라미터
			　　　　, processData: false   // 업로드를 위한 필수 파라미터
			　　　　, contentType: false   // 업로드를 위한 필수 파라미터
			    
			　　　　, success: function(data) {
			　　　　　　if (data.code == 1) {
							//alert("글 업로드 성공!!");
							//location.reload();
							location.href="/main/main_view";
							// 상세화면으로 가거나
			　　　　　　} else if (data.code == 500){
							alert(data.errorMessage);
							location.href="/user/sign_in_view";
			　　　　　　}
			　　　　}
			　　　　, error: function(e) {
			　　　　　　alert("글 업로드에 실패했습니다. 관리자에게 문의해주세요.");
			　　　　}
			});
		});
	});
</script>