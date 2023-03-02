package com.carrotMarket.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carrotMarket.chatRoom.bo.ChatRoomBO;
import com.carrotMarket.chatRoom.model.ChatRoom;
import com.carrotMarket.usedGoods.bo.UsedGoodsBO;
import com.carrotMarket.usedGoods.model.UsedGoods;
import com.carrotMarket.usedGoods.model.UsedGoodsImage;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private UsedGoodsBO usedGoodsBO;
	
	@Autowired
	private ChatRoomBO chatRoomBO;

	@GetMapping("/review_create_view")
	public String reviewCreateView(Model model, 
			@RequestParam("chatRoomId") int chatRoomId,
			@RequestParam("usedGoodsId") int usedGoodsId) {
		
		// 채팅방번호에 해당하는 usedGoodsId를 가져와야 함
		// usedGoodsId를 가져오면 usedGoodsId에 대한 채팅방은 여러개가 있기때문에..?
		// usedGoodsId로 채팅방을 가져올려면,,, 왜가지고와.?? => 나중에 실제로 거래한 한 사람만 후기작성을 할 수 있기때문에??
		// => 우선 둘 다 가져옴
		// DB select
		UsedGoods usedGoods = usedGoodsBO.getUsedGoodsByUsedGoodsId(usedGoodsId);
		UsedGoodsImage usedGoodsImage = usedGoodsBO.getUsedGoodsImageByUsedGoodsId(usedGoodsId);
		ChatRoom chatRoom = chatRoomBO.getChatRoomByChatRoomId(chatRoomId);
		
		model.addAttribute("usedGoods", usedGoods);
		model.addAttribute("usedGoodsImage", usedGoodsImage.getImageUrl());
		model.addAttribute("sellerNickname", chatRoom.getSellerNickname());
		model.addAttribute("viewName", "review/reviewCreate");
		return "template/layout";
	}
}
