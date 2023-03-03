package com.carrotMarket.chatRoom.bo;

import java.util.ArrayList;
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
	
	public void updateChatRoom(int userId, String nickname, String ImageUrl) {
		
		// 더 간단한 로직 없나 생각해보기
		List<ChatRoom> chatRoomList = chatRoomDAO.selectChatRoomListByUserId(userId);
		if (!chatRoomList.isEmpty()) { // 채팅방이 존재할 때
			for(ChatRoom chatRoom : chatRoomList) {
				if (chatRoom.getSellerId() == userId) { // 판매자일 때 => 판매자 이름, 프로필이미지 변경
					// 채팅방번호를 리스트로 받아와서 
//					List<Integer> chatRoomIdList = new ArrayList<>();
//					chatRoomIdList.add(chatRoom.getId());
					chatRoomDAO.updateChatRoomBySellerId(userId, nickname, ImageUrl);
				} else if (chatRoom.getBuyerId() == userId) { // 구매자일 때 => 구매자 이름, 프로필이미지 변경
					chatRoomDAO.updateChatRoomByBuyerId(userId, nickname, ImageUrl);
				}
			}
		}
	}
}
