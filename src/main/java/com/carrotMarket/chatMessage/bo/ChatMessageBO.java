package com.carrotMarket.chatMessage.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrotMarket.chatMessage.dao.ChatMessageDAO;
import com.carrotMarket.chatMessage.model.ChatMessage;

@Service
public class ChatMessageBO {
	
	@Autowired
	private ChatMessageDAO chatMessageDAO;

	public int addChatMessage(ChatMessage chatMessage) {
		return chatMessageDAO.insertChatMessage(chatMessage);
	}
}
