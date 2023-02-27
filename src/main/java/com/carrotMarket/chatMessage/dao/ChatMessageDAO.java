package com.carrotMarket.chatMessage.dao;

import org.springframework.stereotype.Repository;

import com.carrotMarket.chatMessage.model.ChatMessage;

@Repository
public interface ChatMessageDAO {

	public int insertChatMessage(ChatMessage chatMessage);
}
