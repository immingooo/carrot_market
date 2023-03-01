package com.carrotMarket.chatMessage.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrotMarket.chatMessage.dao.ChatMessageDAO;
import com.carrotMarket.chatMessage.model.ChatMessage;

@Service
public class ChatMessageBO {
	
	@Autowired
	private ChatMessageDAO chatMessageDAO;

	public void addChatMessage(int chatRoomId, int sellerId, int buyerId, String userNickname, 
			String profileImageUrl, String chatContent) {
		chatMessageDAO.insertChatMessage(chatRoomId, sellerId, buyerId, userNickname, profileImageUrl, chatContent);
	}
	
	public List<ChatMessage> getChatMessageByChatRoomId(int chatRoomId) {
		return chatMessageDAO.selectChatMessageByChatRoomId(chatRoomId);
	}
}
