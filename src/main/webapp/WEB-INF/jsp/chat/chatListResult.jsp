<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="chatMessage" items="${chatMessageList}">
	<%-- 현재 로그인되어있는 사람이랑 메세지 보낸 사람이랑 같을 때 => 내가 보낸 메세지 --%>
	<c:if test="${userNickname eq chatMessage.nickname}">
		<div class="d-flex justify-content-end p-2" style="width:500px">
			<fmt:formatDate var="createdAt" value="${chatMessage.createdAt}" pattern="a h:mm"/>
			<div class="small pt-4 pr-2">${createdAt}</div>
			<div class="chat-message p-2">${chatMessage.chatContent}</div>
		</div>
	</c:if>
	<%-- 현재 로그인되어있는 사람이랑 메세지 보낸 사람이 다를 때 => 상대방이 보낸 메세지 --%>
	<c:if test="${userNickname ne chatMessage.nickname}">
		<div class="d-flex justify-content-start p-2" style="width:500px">
			<%-- 상대방 프로필이미지 --%>
			<div><img alt="프로필 이미지" src="${chatMessage.profileImageUrl}" onerror="this.src='/static/img/user.png'" width="35px" height="35px" style="border-radius: 50%"> </div>
			<div class="other-chat-message p-2 ml-2">${chatMessage.chatContent}</div>
			<fmt:formatDate var="createdAt" value="${chatMessage.createdAt}" pattern="a h:mm"/>
			<div class="small pt-4 pl-2">${createdAt}</div>
		</div>
	</c:if>
</c:forEach>