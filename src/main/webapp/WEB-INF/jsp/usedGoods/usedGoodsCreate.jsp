<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center pt-3 pb-5">
	<div class="col-7 pb-5">
		<div class="d-flex justify-content-center mt-4 mb-4">
			<h4 class="font-weight-bold">내 물건 팔기</h4>
		</div>
		<form id="usedGoodsCreateForm" method="post" action="/used_goods/used_goods_create">
			<div class="pb-3">
				<div class="d-flex justify-content-between">
					<div class="col-9 p-0 pr-2">
						<input type="text" id="title" name="title" class="form-control" placeholder="제목을 입력해주세요">
					</div>
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
			
			<div class="pb-3">
				<div>
					<input type="text" id="price" name="price" class="form-control" placeholder="가격" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				</div>
			</div>
			
			<div class="pb-3">
				<textarea class="form-control" id="content" name="content" placeholder="내용을 입력해주세요" rows="8" cols="10"></textarea>
			</div>
			
			<div class="pb-2">
				<div>
					<input type="text" class="form-control" id="place" name="place" placeholder="장소를 입력해주세요">
				</div>
			</div>
			
			<div class="file-upload d-flex pb-2">
				<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
				<a href="#" id="fileUploadBtn"><img src="https://cdn-icons-png.flaticon.com/512/45/45010.png" alt="이미지 업로드" width="50px"></a>
				<div id="fileName" class="ml-2"></div>
			</div>
			
			<button type="submit" class="btn btn-orange text-light w-100 font-weight-bold">작성완료</button>
		</form>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('#usedGoodsCreateForm').on('submit', function(e) {
			//alert("111");
			e.preventDefault();
			
			let title = $('#title').val();
			let category = $('#category').val();
			//console.log(category); // 문자
			let price = $('#price').val();
			let content = $('#content').val();
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
		});
	});
</script>