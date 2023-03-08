package com.carrotMarket.chatRoom;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.carrotMarket.chatRoom.bo.ChatRoomBO;
import com.carrotMarket.chatRoom.model.ChatRoom;
import com.carrotMarket.usedGoods.bo.UsedGoodsBO;
import com.carrotMarket.usedGoods.model.UsedGoodsImage;

import javax.servlet.http.HttpSession;

@RestController
public class ChatRoomRestContoller {
	
	@Autowired
	private ChatRoomBO chatRoomBO;
	
	@Autowired
	private UsedGoodsBO usedGoodsBO;

	/**
	 * 채팅방 생성 API
	 * @param usedGoodsId
	 * @param sellerId
	 * @param sellerNickname
	 * @param sellerProfileImageUrl
	 * @param session
	 * @return
	 */
	@PostMapping("/chat_room/create") 
	public Map<String, Object> chatRoomCreate (
			@RequestParam("usedGoodsId") int usedGoodsId,
			@RequestParam("sellerId") int sellerId,
			@RequestParam("sellerNickname") String sellerNickname,
			@RequestParam(value="sellerProfileImageUrl", required=false) String sellerProfileImageUrl,
			HttpSession session) {
		
		// 이미지들은 null일수도 있음
		Map<String, Object> result = new HashMap<>();
		
		Integer buyerId = (Integer)session.getAttribute("userId");
		if (buyerId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인해주세요.");
			return result;
		}
		if (buyerId == sellerId) {
			result.put("code", 501);
			result.put("errorMessage", "자기자신과는 채팅할 수 없습니다.");
			return result;
		}
		String buyerNickname = (String)session.getAttribute("userNickname");
		String buyerProfileImageUrl = (String)session.getAttribute("userProfileImageUrl");
		
		UsedGoodsImage usedGoodsImage = usedGoodsBO.getUsedGoodsImageByUsedGoodsId(usedGoodsId);
		String usedGoodsImageUrl = null;
		if (usedGoodsImage != null) { // 글에 대한 사진이 있을 때만 이미지주소를 가져온다.
			usedGoodsImageUrl = usedGoodsImage.getImageUrl();
		}
		
		// int반환으로 BO에 로직 옮겨도 될 듯.?
		// DB insert - 글에 대한 채팅생성(!!!이미 생성된 방(같은 글 번호 + 판매자 번호 + 구매자 번호)이라면 기존에 생성했던 방으로 이동해야 함!!!)
		int chatRoomId = 0;
		ChatRoom chatRoom = chatRoomBO.getChatRoomByUsedGoodsIdSellerIdBuyerId(usedGoodsId, sellerId, buyerId);
		if (chatRoom != null) { // 이미 방이 존재하면 이미 존재하는 방 번호
			chatRoomId = chatRoom.getId();
		} else if (chatRoom == null) { // 방이 없으면 새로 방 만들어진 방 번호
			chatRoomId = chatRoomBO.addChatRoom(usedGoodsId, sellerId, buyerId, sellerNickname, sellerProfileImageUrl, buyerNickname, buyerProfileImageUrl, usedGoodsImageUrl);
		}
		
		result.put("chatRoomId", chatRoomId);
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
}
