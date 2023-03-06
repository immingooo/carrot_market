package com.carrotMarket.chatRoom.model;

import com.carrotMarket.chatMessage.model.ChatMessage;
import com.carrotMarket.usedGoods.model.UsedGoods;

public class ChatRoomView {

	// 채팅방 1개
	private ChatRoom chatRoom;
	
	// 최근 채팅내용 1개
	private ChatMessage chatMessage;

	public ChatRoom getChatRoom() {
		return chatRoom;
	}

	public void setChatRoom(ChatRoom chatRoom) {
		this.chatRoom = chatRoom;
	}

	public ChatMessage getChatMessage() {
		return chatMessage;
	}

	public void setChatMessage(ChatMessage chatMessage) {
		this.chatMessage = chatMessage;
	}	
}
