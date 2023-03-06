<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="tap-box d-flex justify-content-center align-items-center">
	<div class="d-flex col-5">
		<img src="${usedGoodsImage}" onerror="this.src='/static/img/used_goods.jpg'" alt="상품사진" width="60px" height="60px" style="border-radius:20%">
		<div class="ml-3 mt-2 ">
			<div class="text-secondary small font-weight-bold">거래한 상품</div>
			<div class="font-weight-bold">${usedGoods.title}</div>
		</div>
	</div>
</div>
<div class="d-flex justify-content-center pt-3 pb-5">
	<div class="col-4 p-0 pb-5">
			<h5 class="font-weight-bold w-100 text-center">${sellerNickname}님과의 거래가 어떠셨나요?</h5>
			<div class="p-3 pl-5 pr-5">
				<div>
					<input type="radio" id="best" name="rating" value="best">
					<label for="best">최고예요!</label>
				</div>
				<div>
					<input type="radio" id="good" name="rating" value="good">
					<label for="good">좋아요!</label>
				</div>
				<div>
					<input type="radio" id="bad" name="rating" value="bad">
					<label for="bad">별로예요!</label>
				</div>
			</div>
			<hr class="m-0" style="background:black; heigth:3px;">
			<h5 class="font-weight-bold w-100 text-center pt-4">거래하며 좋았던 점을 선택해 주세요.</h5>
			<div class="p-3 pl-5 pr-5">
				<div>
					<input type="checkbox" id="1" value="manner1" name="manner">
					<label for="1">제가 있는 곳까지 와서 거래했어요.</label>
				</div>
				<div>
					<input type="checkbox" id="2" value="manner2" name="manner">
					<label for="2">친절하고 매너가 좋아요.</label>
				</div>
				<div>
					<input type="checkbox" id="3" value="manner3" name="manner">
					<label for="3">시간 약속을 잘 지켜요</label>
				</div>
				<div>
					<input type="checkbox" id="4" value="manner4" name="manner">
					<label for="4">응답이 빨라요</label>
				</div>
			</div>
			<hr class="m-0" style="background:black; heigth:3px;">
			<div class="mt-4">
				<h5 class="font-weight-bold w-100 text-center">${sellerNickname}님에게 감사 인사를 남겨보세요.</h5>
				<div class="small w-100 text-center text-secondary">작성한 내용은 상대방 프로필에 공개됩니다.</div>
				<textarea  id="reviewContent" rows="5" cols="50" placeholder="내용을 입력해주세요" class="form-control mt-3 mb-3"></textarea>
			</div>
			
			<button type="button" id="reviewDoneBtn" class="btn btn-orange text-light w-100 font-weight-bold">거래 후기 작성 완료</button>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">경고</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
        <div>제출하면 수정할 수 없습니다.</div>
        <div>제출하시겠습니까?</div>
      </div>
      <div class="modal-footer d-flex justify-content-between">
        <button type="button" class="btn btn-secondary col-6" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-success col-6" id="reviewDoneModalBtn">제출하기</button>
      </div>
    </div>
  </div>
</div>


<script>
	$(document).ready(function() {		
		// 리뷰작성 버튼을 클릭했을 때 => 유효성 검사 => 모달창 띄우기
		$("#reviewDoneBtn").on('click', function() {
			//alert('1111');
			let rating = $('input[name=rating]:checked').val();
			
			// 유효성 검사
			if (rating == undefined) {
				alert("거래가 어떠셨는지 선택해주세요.")
				return;
			}
			
			// 유효성 검사 통과하면 모달창 띄우기
			$('#exampleModal').modal('show');
		});
		
		// 최종 후기작성제출 모달버튼을 클릭했을 때
		$('#reviewDoneModalBtn').on('click', function() {
			var chkArray = new Array();
			
			let usedGoodsId = ${usedGoods.id}
			let rating = $('input[name=rating]:checked').val();
			let reviewContent = $('#reviewContent').val();
			
		    $("input[name=manner]:checked").each(function() { 
		      var manner = $(this).val(); 
		      chkArray.push(manner);
		    });
			
			console.log("rating: " + rating);
			console.log("chkArray: " + chkArray);
			console.log("reviewContent: " + reviewContent);
			
			$.ajax({
				type:"post"
				, url:"/review/create"
				, data:{"usedGoodsId":usedGoodsId, "rating":rating, "chkArray":chkArray, "reviewContent":reviewContent}
			
				, success:function(data) {
					if (data.code == 1) {
						alert("리뷰작성 완료!")
						location.href="/main/main_view"
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("리뷰를 저장할 수 없습니다. 관리자에게 문의해주세요.");
				}
			});
		});
	});
</script>