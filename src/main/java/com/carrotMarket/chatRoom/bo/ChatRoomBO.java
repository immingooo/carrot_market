package com.carrotMarket.chatRoom.bo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carrotMarket.chatRoom.dao.ChatRoomDAO;
import com.carrotMarket.chatRoom.model.ChatRoom;

@Service
public class ChatRoomBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ChatRoomDAO chatRoomDAO;

	public ChatRoom getChatRoomByChatRoomId(int chatRoomId) {
		return chatRoomDAO.selectChatRoomByChatRoomId(chatRoomId);
	}
	
	public ChatRoom getChatRoomByUsedGoodsIdSellerIdBuyerId(int usedGoodsId, int sellerId, int buyerId) {
		return chatRoomDAO.selectChatRoomByUsedGoodsIdSellerIdBuyerId(usedGoodsId, sellerId, buyerId);
	}
	
	public List<ChatRoom> getChatRoomListByUserId(int userId) {
		return chatRoomDAO.selectChatRoomListByUserId(userId);
	}
	
	public int addChatRoom(int usedGoodsId, int sellerId, int buyerId, String sellerNickname, 
			String sellerProfileImageUrl, String buyerNickname, String buyerProfileImageUrl, String usedGoodsImageUrl) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("usedGoodsId", usedGoodsId);
		map.put("sellerId", sellerId);
		map.put("buyerId", buyerId);
		map.put("sellerNickname", sellerNickname);
		map.put("sellerProfileImageUrl", sellerProfileImageUrl);
		map.put("buyerNickname", buyerNickname);
		map.put("buyerProfileImageUrl", buyerProfileImageUrl);
		map.put("usedGoodsImageUrl", usedGoodsImageUrl);
		
		chatRoomDAO.insertChatRoom(map);
		int id = (int)map.get("id");
		logger.info("####방금 추가된 id#### id:{}", id);
		
		return id;
	}
}
