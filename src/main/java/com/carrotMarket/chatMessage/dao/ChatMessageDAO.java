package com.carrotMarket.chatMessage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.carrotMarket.chatMessage.model.ChatMessage;

@Repository
public interface ChatMessageDAO {

	public void insertChatMessage(
			@Param("chatRoomId") int chatRoomId, 
			@Param("sellerId") int sellerId, 
			@Param("buyerId") int buyerId, 
			@Param("userNickname") String userNickname, 
			@Param("profileImageUrl") String profileImageUrl, 
			@Param("chatContent") String chatContent);
	
	public List<ChatMessage> selectChatMessageListByChatRoomId(int chatRoomId);
	
	public ChatMessage selectLastChatMessageByChatRoomId(int chatRoomId);
	
	public void updateChatMessage(
			@Param("oldNickname") String oldNickname, 
			@Param("nickname") String nickname, 
			@Param("ImageUrl") String ImageUrl);
}
