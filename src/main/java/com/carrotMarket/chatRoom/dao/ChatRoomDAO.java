package com.carrotMarket.chatRoom.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.carrotMarket.chatRoom.model.ChatRoom;

@Repository
public interface ChatRoomDAO {

	public ChatRoom selectChatRoomByChatRoomId(int chatRoomId);
	
	public ChatRoom selectChatRoomByUsedGoodsIdSellerIdBuyerId(
			@Param("usedGoodsId") int usedGoodsId, 
			@Param("sellerId") int sellerId, 
			@Param("buyerId") int buyerId);
	
	public List<ChatRoom> selectChatRoomListByUserId(int userId);
	
	public void insertChatRoom(Map<String, Object> map);
	
}
