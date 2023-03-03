package com.carrotMarket.chatMessage.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrotMarket.chatMessage.dao.ChatMessageDAO;
import com.carrotMarket.chatMessage.model.ChatMessage;
import com.carrotMarket.chatRoom.bo.ChatRoomBO;
import com.carrotMarket.chatRoom.model.ChatRoom;

@Service
public class ChatMessageBO {
	
	@Autowired
	private ChatMessageDAO chatMessageDAO;
	
	@Autowired
	private ChatRoomBO chatRoomBO;

	public void addChatMessage(int chatRoomId, int sellerId, int buyerId, String userNickname, 
			String profileImageUrl, String chatContent) {
		chatMessageDAO.insertChatMessage(chatRoomId, sellerId, buyerId, userNickname, profileImageUrl, chatContent);
	}
	
	public List<ChatMessage> getChatMessageByChatRoomId(int chatRoomId) {
		return chatMessageDAO.selectChatMessageByChatRoomId(chatRoomId);
	}
	
	public void updateChatMessage(int userId, String oldNickname, String nickname, String ImageUrl) {
		
		List<ChatRoom> chatRoomList = chatRoomBO.getChatRoomListByUserId(userId);
		if (!chatRoomList.isEmpty()) {
			chatMessageDAO.updateChatMessage(oldNickname, nickname, ImageUrl);
		}
	}
}
