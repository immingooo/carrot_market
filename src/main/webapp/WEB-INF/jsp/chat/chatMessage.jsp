<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex justify-content-center pt-3 pb-5">
	<div class="message-box col-5 p-0" style="height:600px;">
		<h5 class="m-3 font-weight-bold text-center">
			<%-- 판매자일 때 --%>
			<c:if test="${chatRoom.sellerId eq userId}">
			${chatRoom.buyerNickname}
			</c:if>
			<%-- 구매자일 때 --%>
			<c:if test="${chatRoom.buyerId eq userId}">
			${chatRoom.sellerNickname}
			</c:if>
		</h5>
		<hr>
		<div class="d-flex justify-content-between m-3">
			<div class="d-flex">
				<div>
					<img alt="상품사진" src="${chatRoom.usedGoodsImageUrl}" onerror="this.src='/static/img/used_goods.jpg'" width="50px" height="50px">
				</div>
				<div class="pl-2">
					<div class="small font-weight-bold">${usedGoods.title}</div>
					<fmt:formatNumber var="price" value="${usedGoods.price}" type="number" />
					<div class="font-weight-bold">${price}</div>
				</div>
			</div>
			<c:if test="${chatRoom.sellerId eq userId}">
			<div class="pt-2">
				<button type="button" id="doneBtn" class="btn btn-outline-success">거래완료</button>
			</div>
			</c:if>
			<c:if test="${chatRoom.sellerId ne userId}">
			<div class="pt-2">
				<button type="button" id="reviewBtn" class="btn btn-outline-primary">후기작성</button>
			</div>
			</c:if>
		</div>
		<hr>
		<div id="chatBox" style="height:400px">
			<%-- 대화내용 --%>
		</div>
		<div class="d-flex send-box" style="width:500px">
			<div class="d-flex w-100">
				<input type="text" class="form-control" id="chatContent">
				<button type="button" id="chatSendBtn" class="btn btn-orange text-light">보내기</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		// 처음 대화창에 들어오면 이전에 있던 메세지들이 보여야 함!!!!
		// 그 이후에 새로고침하거나 자동으로 새로고침되도록해야함...
		let chatRoomId = ${chatRoom.id}
		
		$.ajax({
			type:"post"
			, url:"/chat/chat_list_result_view"
			, data:{"chatRoomId":chatRoomId}
		
			, success:function(data) { // data에 html 통째로 들어가는지 확인하기
				// ajax 바꿔끼기 - 채팅내용 리스트
				//console.log(data);
				$("#chatBox").html(data);
				
				// 스크롤을 맨아래로 가게하기
			}
			, error:function(e) {
				alert("채팅내역을 불러올 수 없습니다. 관리자에게 문의해주세요.");
			}
		});
		
		$('#chatSendBtn').on('click', function() {
			//alert("1111");
			let chatRoomId = ${chatRoom.id};
			let sellerId = ${chatRoom.sellerId}
			let buyerId = ${chatRoom.buyerId}
			let userNickname = "${userNickname}"
			let profileImageUrl = "${userProfileImageUrl}"
			let chatContent = $('#chatContent').val();
			/* console.log("chatRoomId: " + chatRoomId)
			console.log("sellerId: " + sellerId)
			console.log("buyerId: " + buyerId)
			console.log("userNickname: " + userNickname)
			console.log("profileImageUrl: " + profileImageUrl)
			console.log("chatContent: " + chatContent) */
			
			if (chatContent == "") {
				alert("대화내용을 입력해주세요");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/chat/chat_list_result_view"
				, data:{"chatRoomId":chatRoomId, "sellerId":sellerId, "buyerId":buyerId, "userNickname":userNickname, "profileImageUrl":profileImageUrl, "chatContent":chatContent}
			
				, success:function(data) { // data에 html 통째로 들어가는지 확인하기
					// 메세지 입력칸 비우기
					$("#chatContent").val("");
					
					// ajax 바꿔끼기 - 채팅내용 리스트
					//console.log(data);
					$("#chatBox").html(data);
					
					// 스크롤을 맨아래로 가게하기
				}
				, error:function(e) {
					alert("채팅메세지를 보낼 수 없습니다. 관리자에게 문의해주세요.");
				}
			});
		});
		
		// 판매자가 거래완료버튼을 클릭했을 때 -> (구매자알림) -> 구매자 채팅창에 후기작성 버튼 보이기
		$("#doneBtn").on('click', function() {
			//alert("1111");
			
		});
	});
</script>