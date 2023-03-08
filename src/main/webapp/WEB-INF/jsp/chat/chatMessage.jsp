<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex justify-content-center pt-3 pb-5">
<%-- 글이 존재할 때 --%>
<c:if test="${!empty usedGoods}">
	<div class="message-box col-5 p-0" style="height:600px;">
		<div class="d-flex m-3">
			<h5 class="font-weight-bold text-center col-11 p-0 m-0">
				<%-- 판매자일 때 --%>
				<c:if test="${chatRoom.sellerId eq userId}">
				${chatRoom.buyerNickname}
				</c:if>
				<%-- 구매자일 때 --%>
				<c:if test="${chatRoom.buyerId eq userId}">
				${chatRoom.sellerNickname}
				</c:if>
			</h5>
			<a href="#" class="col-1 p-0 m-0"><img alt="menu" src="https://cdn-icons-png.flaticon.com/512/2311/2311524.png" height="30px"></a>
		</div>
		<hr>
		<div class="d-flex justify-content-between m-3">
			<div class="d-flex">
				<c:if test="${!empty chatRoom.usedGoodsImageUrl}">
				<div>
					<img alt="상품사진" src="${chatRoom.usedGoodsImageUrl}" style="border-radius:5px" width="50px" height="50px">
				</div>
				</c:if>
				<c:if test="${empty chatRoom.usedGoodsImageUrl}">
				<div>
					<img alt="상품사진" src="/static/img/used_goods.jpg" style="border: 2px solid #C2C2C2; border-radius:5px" width="50px" height="50px">
				</div>
				</c:if>
				<div class="pl-2">
					
					<div class="small font-weight-bold">${usedGoods.title}</div>
					<fmt:formatNumber var="price" value="${usedGoods.price}" type="number" />
					<div class="font-weight-bold">${price}원</div>
					
				</div>
			</div>
			
			<%-- 판매자일 때 --%>
			<c:if test="${chatRoom.sellerId eq userId}">
				<c:if test="${empty usedGoodsDone}">
				<div class="pt-2">
					<button type="button" id="doneBtn" class="btn btn-outline-success">거래완료</button>
				</div>
				</c:if>
				<c:if test="${!empty usedGoodsDone}">
				<div class="pt-2">
					<button type="button" style="pointer-events: none;" class="btn btn-success">거래완료</button>
				</div>
				</c:if>
			</c:if>
			<%-- 구매자일 때 --%>
			<c:if test="${chatRoom.sellerId ne userId}">
				<%-- 해당 구매자에게만 후기작성 버튼 보이기 --%>
				<c:if test="${usedGoodsDone.buyerId eq userId && existReview eq 0}">
				<div class="pt-2">
					<a href="/review/review_create_view?chatRoomId=${chatRoom.id}&usedGoodsId=${usedGoods.id}" id="reviewBtn" class="btn btn-outline-primary">후기작성</a>
				</div>
				</c:if>
				<c:if test="${usedGoodsDone.buyerId eq userId && existReview eq 1}">
				<div class="pt-2">
					<a href="#" style="pointer-events: none;" id="reviewBtn" class="btn btn-primary">후기작성완료</a>
				</div>
				</c:if>
			</c:if>
		</div>
		<hr>
		<div id="chatBox" style="height:400px;" class="scrollbar">
			<%-- 대화내용 --%>
		</div>
		<div class="d-flex send-box" style="width:500px">
			<div class="d-flex w-100">
				<input type="text" class="form-control" id="chatContent">
				<button type="button" id="chatSendBtn" class="btn btn-orange text-light">보내기</button>
			</div>
		</div>
	</div>
</c:if>

<%-- 글이 삭제됐을 때 --%>
<c:if test="${empty usedGoods}">
	<div class="message-box col-5 p-0" style="height:600px;">
		<div class="d-flex m-3">
			<h5 class="font-weight-bold text-center col-11 p-0 m-0">
				<%-- 판매자일 때 --%>
				<c:if test="${chatRoom.sellerId eq userId}">
				${chatRoom.buyerNickname}
				</c:if>
				<%-- 구매자일 때 --%>
				<c:if test="${chatRoom.buyerId eq userId}">
				${chatRoom.sellerNickname}
				</c:if>
			</h5>
			<a href="#" class="col-1 p-0 m-0"><img alt="menu" src="https://cdn-icons-png.flaticon.com/512/2311/2311524.png" height="30px"></a>
		</div>
		<hr>
		<div class="d-flex justify-content-between m-3" style="pointer-events: none; filter: blur(5px); -webkit-filter: blur(5px);">
			<div class="d-flex">
				<c:if test="${!empty chatRoom.usedGoodsImageUrl}">
				<div>
					<img alt="상품사진" src="${chatRoom.usedGoodsImageUrl}" style="border-radius:5px" width="50px" height="50px">
				</div>
				</c:if>
				<c:if test="${empty chatRoom.usedGoodsImageUrl}">
				<div>
					<img alt="상품사진" src="/static/img/used_goods.jpg" style="border: 2px solid #C2C2C2; border-radius:5px" width="50px" height="50px">
				</div>
				</c:if>
				<div class="pl-2">
					<div class="small font-weight-bold">${usedGoods.title}</div>
					<fmt:formatNumber var="price" value="${usedGoods.price}" type="number" />
					<div class="font-weight-bold">${price}원</div>
				</div>
			</div>
			
			<%-- 판매자일 때 --%>
			<c:if test="${chatRoom.sellerId eq userId}">
				<c:if test="${empty usedGoodsDone}">
				<div class="pt-2">
					<button type="button" id="doneBtn" class="btn btn-outline-success">거래완료</button>
				</div>
				</c:if>
				<c:if test="${!empty usedGoodsDone}">
				<div class="pt-2">
					<button type="button" style="pointer-events: none;" class="btn btn-success">거래완료</button>
				</div>
				</c:if>
			</c:if>
			<%-- 구매자일 때 --%>
			<c:if test="${chatRoom.sellerId ne userId}">
				<!-- 해당 구매자에게만 후기작성 버튼 보이기 -->
				<c:if test="${usedGoodsDone.buyerId eq userId && existReview eq 0}">
				<div class="pt-2">
					<a href="/review/review_create_view?chatRoomId=${chatRoom.id}&usedGoodsId=${usedGoods.id}" id="reviewBtn" class="btn btn-outline-primary">후기작성</a>
				</div>
				</c:if>
				<c:if test="${usedGoodsDone.buyerId eq userId && existReview eq 1}">
				<div class="pt-2">
					<a href="#" style="pointer-events: none;" id="reviewBtn" class="btn btn-primary">후기작성완료</a>
				</div>
				</c:if>
			</c:if>
		</div>
		<hr>
		<div id="chatBox" style="pointer-events: none; height:400px; filter: blur(5px); -webkit-filter: blur(5px);" class="scrollbar">
			<%-- 대화내용 --%>
		</div>
		<div class="d-flex send-box" style="width:500px; pointer-events: none; height:400px filter: blur(5px); -webkit-filter: blur(5px);">
			<div class="d-flex w-100">
				<input type="text" class="form-control" id="chatContent">
				<button type="button" id="chatSendBtn" class="btn btn-orange text-light">보내기</button>
			</div>
		</div>
	</div>
</c:if>
</div>

<script>
	$(document).ready(function() {
		// 처음 대화창에 들어오면 이전에 있던 메세지들이 보여야 함!!!!
		// 그 이후에 새로고침하거나 자동으로 새로고침되도록해야함...
		/* function autoRefresh_div() {
			$("#chatBox").load(window.location.href + ' #chatBox');
		}setInterval('autoRefresh_div()', 3000); */
/* 		$("#chatBox").load(window.location.href + ' #chatBox'); */
		
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
		
		setInterval(function() {
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
		}, 3000);
		
		
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
		
		// 판매자가 거래완료버튼을 클릭했을 때
		$("#doneBtn").on('click', function() {
			//alert("1111");
			let usedGoodsId = ${chatRoom.usedGoodsId} // usedGoods.id
			let buyerId = ${chatRoom.buyerId}
			
			$.ajax({
				type:"post"
				, url:"/used_goods/done"
				, data:{"usedGoodsId":usedGoodsId, "buyerId":buyerId}
			
				, success:function(data) {
					if(data.code == 1) {
						// 거래완료버튼 사라졌나 확인하기
						location.reload(); 
					} else {
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("거래완료버튼 클릭에 실패했습니다. 관리자에게 문의해주세요.");
				}
			});
		});
	});
</script>