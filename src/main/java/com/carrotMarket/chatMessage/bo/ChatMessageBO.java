package com.carrotMarket.chatMessage.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrotMarket.chatMessage.dao.ChatMessageDAO;
import com.carrotMarket.chatMessage.model.ChatMessage;
import com.carrotMarket.chatRoom.bo.ChatRoomBO;

@Service
public class ChatMessageBO {
	
	@Autowired
	private ChatMessageDAO chatMessageDAO;

	public void addChatMessage(int chatRoomId, int sellerId, int buyerId, String userNickname, 
			String profileImageUrl, String chatContent) {
		chatMessageDAO.insertChatMessage(chatRoomId, sellerId, buyerId, userNickname, profileImageUrl, chatContent);
	}
	
	public List<ChatMessage> getChatMessageListByChatRoomId(int chatRoomId) {
		return chatMessageDAO.selectChatMessageListByChatRoomId(chatRoomId);
	}
	
	public ChatMessage getLastChatMessageByChatRoomId(int chatRoomId) {
		return chatMessageDAO.selectLastChatMessageByChatRoomId(chatRoomId);
	}
	
	public void updateChatMessage(int userId, String oldNickname, String nickname, String ImageUrl) {
		chatMessageDAO.updateChatMessage(oldNickname, nickname, ImageUrl);
//		List<ChatRoom> chatRoomList = chatRoomBO.getChatRoomListByUserId(userId);
//		if (!chatRoomList.isEmpty()) {
//		}
	}
	
}
