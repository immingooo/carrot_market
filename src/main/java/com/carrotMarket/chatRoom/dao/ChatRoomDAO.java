package com.carrotMarket.chatRoom.dao;

import org.springframework.stereotype.Repository;

import com.carrotMarket.chatRoom.model.ChatRoom;

@Repository
public interface ChatRoomDAO {

	public ChatRoom selectChatRoom(int chatRoomId);
}
