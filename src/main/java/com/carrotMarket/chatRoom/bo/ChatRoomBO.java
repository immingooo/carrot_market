package com.carrotMarket.chatRoom.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrotMarket.chatRoom.dao.ChatRoomDAO;
import com.carrotMarket.chatRoom.model.ChatRoom;

@Service
public class ChatRoomBO {
	
	@Autowired
	private ChatRoomDAO chatRoomDAO;

	public ChatRoom getChatRoom(int chatRoomId) {
		return chatRoomDAO.selectChatRoom(chatRoomId);
	}
}
