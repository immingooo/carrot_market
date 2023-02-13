<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="w-100 tap-box d-flex justify-content-center align-items-center">
	<div class="d-flex col-5">
		<img src="" onerror="this.src='/static/img/used_goods.jpg'" alt="상품사진" width="65px" height="65px" style="border: 2px solid gray; border-radius:20%">
		<div class="ml-3 mt-2">
			<div class="text-secondary small font-weight-bold">거래한 상품</div>
			<div class="font-weight-bold">글 제목</div>
		</div>
	</div>
</div>
<div class="d-flex justify-content-center pt-5 pb-5">
	<div class="col-4 p-0 pb-5">
		<form method="post" action="/review/create">
			<h5 class="font-weight-bold w-100 text-center">ㅇㅇ님과의 거래가 어떠셨나요?</h5>
			<div class="p-3 pl-5 pr-5">
				<div>
					<input type="radio" id="best" name="estimate" value="best">
					<label for="best">최고예요!</label>
				</div>
				<div>
					<input type="radio" id="good" name="estimate" value="good">
					<label for="good">좋아요!</label>
				</div>
				<div>
					<input type="radio" id="bad" name="estimate" value="bad">
					<label for="bad">별로예요!</label>
				</div>
			</div>
			<hr class="m-0" style="background:black; heigth:3px;">
			<h5 class="font-weight-bold w-100 text-center pt-4">거래하며 좋았던 점을 선택해 주세요.</h5>
			<div class="p-3 pl-5 pr-5">
				<div>
					<input type="checkbox" id="1" value="1" name="manner">
					<label for="1">제가 있는 곳까지 와서 거래했어요.</label>
				</div>
				<div>
					<input type="checkbox" id="2" value="2" name="manner">
					<label for="2">친절하고 매너가 좋아요.</label>
				</div>
				<div>
					<input type="checkbox" id="3" value="3" name="manner">
					<label for="3">시간 약속을 잘 지켜요</label>
				</div>
				<div>
					<input type="checkbox" id="4" value="4" name="manner">
					<label for="4">응답이 빨라요</label>
				</div>
			</div>
			<hr class="m-0" style="background:black; heigth:3px;">
			<div class="mt-4">
				<h5 class="font-weight-bold w-100 text-center">ㅇㅇ님에게 감사 인사를 남겨보세요.</h5>
				<div class="small w-100 text-center text-secondary">작성한 내용은 상대방 프로필에 공개됩니다.</div>
				<textarea rows="5" cols="50" placeholder="내용을 입력해주세요" class="form-control mt-3 mb-3"></textarea>
			</div>
			
			<button type="submit" class="btn btn-orange text-light w-100 font-weight-bold">거래 후기 작성 완료</button>
		</form>
	</div>
</div>