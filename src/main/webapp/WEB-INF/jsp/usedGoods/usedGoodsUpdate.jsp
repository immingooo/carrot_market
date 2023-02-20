<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="d-flex justify-content-center pt-3 pb-5">
	<div class="col-7 pb-5">
		<div class="d-flex justify-content-center mt-4 mb-4">
			<h4 class="font-weight-bold">내 물건 팔기</h4>
		</div>

		<div class="pb-3">
			<div class="d-flex justify-content-between">
				<%-- 제목 --%>
				<div class="col-9 p-0 pr-2">
					<input type="text" id="title" name="title" class="form-control"
						value="${usedGoods.title}">
				</div>
				
				<%-- 카테고리 --%>
				<div class="d-flex justify-content-between">
					<select class="form-control" id="category" name="category">
						<option>카테고리</option>
						<option ${usedGoods.category == "디지털기기" ? 'selected="selected"' : '' }>디지털기기</option>
						<option ${usedGoods.category == "생활가전" ? 'selected="selected"' : '' }>생활가전</option>
						<option ${usedGoods.category == "가구/인테리어" ? 'selected="selected"' : '' }>가구/인테리어</option>
						<option ${usedGoods.category == "생활/주방" ? 'selected="selected"' : '' }>생활/주방</option>
						<option ${usedGoods.category == "유아동" ? 'selected="selected"' : '' }>유아동</option>
						<option ${usedGoods.category == "유아도서" ? 'selected="selected"' : '' }>유아도서</option>
						<option ${usedGoods.category == "여성잡화" ? 'selected="selected"' : '' }>여성잡화</option>
						<option ${usedGoods.category == "여성잡화" ? 'selected="selected"' : '' }>여성잡화</option>
						<option ${usedGoods.category == "남성패션/잡화" ? 'selected="selected"' : '' }>남성패션/잡화</option>
						<option ${usedGoods.category == "뷰티/미용" ? 'selected="selected"' : '' }>뷰티/미용</option>
						<option ${usedGoods.category == "스포츠/레저" ? 'selected="selected"' : '' }>스포츠/레저</option>
						<option ${usedGoods.category == "취미/게임/음반" ? 'selected="selected"' : '' }>취미/게임/음반</option>
						<option ${usedGoods.category == "도서" ? 'selected="selected"' : '' }>도서</option>
						<option ${usedGoods.category == "티켓/교환권" ? 'selected="selected"' : '' }>티켓/교환권</option>
						<option ${usedGoods.category == "가공식품" ? 'selected="selected"' : '' }>가공식품</option>
						<option ${usedGoods.category == "반려동물용품" ? 'selected="selected"' : '' }>반려동물용품</option>
						<option ${usedGoods.category == "식물" ? 'selected="selected"' : '' }>식물</option>
						<option ${usedGoods.category == "기타 중고물품" ? 'selected="selected"' : '' }>기타 중고물품</option>
						<option ${usedGoods.category == "삽니다" ? 'selected="selected"' : '' }>삽니다</option>
					</select>
				</div>
			</div>
		</div>

		<%-- 가격 --%>
		<div class="pb-3">
			<div>
				<input type="text" id="price" name="price" class="form-control"
					value="${usedGoods.price}"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			</div>
		</div>

		<%-- 내용 --%>
		<div class="pb-3">
			<textarea class="form-control" id="content" name="content" rows="8" cols="10">${usedGoods.content}</textarea>
		</div>

		<%-- 장소 --%>
		<div class="pb-2">
			<div>
				<c:if test="${not empty usedGoods.place}">
				<input type="text" class="form-control" id="place" name="place"
					value="${usedGoods.place}">
				</c:if>
				<c:if test="${empty usedGoods.place}">
				<input type="text" class="form-control" id="place" name="place"
					placeholder="장소를 입력해주세요">
				</c:if>
			</div>
		</div>

		<%-- 이미지 --%>
		<div class="file-upload d-flex pb-2">
			<input type="file" id="file" name="file" class="d-none" multiple="multiple" accept=".gif, .jpg, .png, .jpeg">
			<a href="#" id="fileUploadBtn"><img src="https://cdn-icons-png.flaticon.com/512/875/875068.png" alt="이미지 업로드" width="100px"></a>
			<div id="fileName" class="ml-2 d-none"></div>
			<c:if test="${not empty usedGoodsImageList}">
				<c:forEach var="usedGoodsImage" items="${usedGoodsImageList}">
					<img alt="업로드 이미지" src="${usedGoodsImage.imageUrl}" width="100px" height="100px" class="ml-2 beforeImage">
				</c:forEach>
			</c:if>
			<div id="preview"></div>
		</div>

		<button type="button" data-used-goods-id="${usedGoods.id}" id="updateBtn" class="btn btn-orange text-light w-100 font-weight-bold">수정완료</button>
	</div>
</div>

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
			
			// 기존 이미지 숨기기
			$(".beforeImage").hide();
			
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
		        var str = '<div style="display: inline-flex;"><li class="pl-2">';
		        
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
		
		$('#updateBtn').on("click", function() {
			//alert('111');
			let usedGoodsId = $(this).data('used-goods-id');
			console.log("usedGoodsId: " + usedGoodsId);
			let title = $('#title').val();
			let category = $('#category').val().trim();
			let price = $('#price').val().trim();
			let content = $('#content').val();
			//content = content.replaceAll(/(\n|\r\n)/g, "<br>");
			let place = $('#place').val().trim();
			
			if (title == '') {
				alert("제목을 입력해주세요");
				return;
			}
			if (category == "카테고리") {
				alert("카테고리를 선택해주세요");
				return;
			}
			if (content == '') {
				alert("내용을 입력해주세요");
				return;
			}
			
			console.log("inputFileList: " + inputFileList);
			let formData = new FormData(); 
			formData.append("usedGoodsId", usedGoodsId);
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
			　　　　type:'put'
			　　　　, url: '/used_goods/update'
			　　　　, data: formData
			　　　　, enctype:"multipart/form-data"  // 업로드를 위한 필수 파라미터
			　　　　, processData: false   // 업로드를 위한 필수 파라미터
			　　　　, contentType: false   // 업로드를 위한 필수 파라미터
			    
			　　　　, success: function(data) {
			　　　　　　if (data.code == 1) {
							alert("글이 수정되었습니다.");
							//location.reload();
							location.href="/used_goods/used_goods_detail_view?usedGoodsId=" + usedGoodsId;
			　　　　　　} else if (data.code == 500){
							alert(data.errorMessage);
							location.href="/user/sign_in_view";
			　　　　　　}
			　　　　}
			　　　　, error: function(e) {
			　　　　　　alert("글 수정에 실패했습니다. 관리자에게 문의해주세요.");
			　　　　}
			});
		});
	});
</script>