<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex justify-content-center pt-3 pb-5">
	<div class="message-list-box col-5 p-0 box bg-light" style="height:600px">
		<c:forEach var="chatRoom" items="${chatRoomList}">
		<a href="/chat/chat_message_view/${chatRoom.id}" style="text-decoration:none; color:black">
		<div class="d-flex justify-content-between m-3">
			<div class="d-flex">
				<div class="pr-3">
					<c:if test="${chatRoom.sellerNickname eq userNickname}">
					<img alt="상대방 프로필 이미지" src="${chatRoom.buyerProfileImageUrl}" onerror="this.src='/static/img/user.png'" width="50px" height="50px" style="border-radius:50%">
					</c:if>
					<c:if test="${chatRoom.buyerNickname eq userNickname}">
					<img alt="상대방 프로필 이미지" src="${chatRoom.sellerProfileImageUrl}" onerror="this.src='/static/img/user.png'" width="50px" height="50px" style="border-radius:50%">
					</c:if>
				</div>
				<div>
					<div>
						<c:if test="${chatRoom.sellerNickname eq userNickname}">
						<span class="font-weight-bold">${chatRoom.buyerNickname}</span>
						</c:if>
						<c:if test="${chatRoom.buyerNickname eq userNickname}">
						<span class="font-weight-bold">${chatRoom.sellerNickname}</span>
						</c:if>
						<span class="small text-dark">거래장소 ∙ 마지막채팅시간</span>
					</div>
					<div>마지막으로 보낸 채팅메세지</div>
				</div>
			</div>
			<div>
				<img alt="상품 사진" src="${chatRoom.usedGoodsImageUrl}" onerror="this.src='/static/img/used_goods.jpg'" width="50px" height="50px" style="border-radius:10%">
			</div>
		</div>
		</a>
		<hr>
		</c:forEach>
	</div>
</div>