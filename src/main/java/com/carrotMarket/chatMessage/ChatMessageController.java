package com.carrotMarket.chatMessage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carrotMarket.chatMessage.bo.ChatMessageBO;
import com.carrotMarket.chatMessage.model.ChatMessage;
import com.carrotMarket.chatRoom.bo.ChatRoomBO;
import com.carrotMarket.chatRoom.model.ChatRoom;
import com.carrotMarket.review.bo.ReviewBO;
import com.carrotMarket.usedGoods.bo.UsedGoodsBO;
import com.carrotMarket.usedGoods.model.UsedGoods;
import com.carrotMarket.usedGoods.model.UsedGoodsDone;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/chat")
public class ChatMessageController {

	@Autowired
	private ChatRoomBO chatRoomBO;
	
	@Autowired
	private UsedGoodsBO usedGoodsBO;
	
	@Autowired
	private ChatMessageBO chatMessageBO;
	
	@Autowired
	private ReviewBO reviewBO;
	
	// 채팅창으로 들어가는 로직
	@GetMapping("/chat_message_view/{chatRoomId}")
	public String chatMessageView(
			@PathVariable int chatRoomId,
			Model model,
			HttpSession session) {
		
		// 채팅방 가져오기
		ChatRoom chatRoom = chatRoomBO.getChatRoomByChatRoomId(chatRoomId);
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		// 채팅방에 해당하는 글 가져오기(대화창에서 글정보를 뿌려야돼서)
		UsedGoods usedGoods = usedGoodsBO.getUsedGoodsByUsedGoodsId(chatRoom.getUsedGoodsId());
		// 거래완료된 게시물인지 아닌지
		UsedGoodsDone usedGoodsDone = usedGoodsBO.getUsedGoodsDoneByUsedGoodsId(usedGoods.getId());
		// 후기작성된 게시물인지 아닌지
		int rowCount = reviewBO.getReviewByUsedGoodsId(usedGoods.getId());
		
		model.addAttribute("chatRoom", chatRoom);
		model.addAttribute("usedGoods", usedGoods);
		model.addAttribute("usedGoodsDone", usedGoodsDone);
		model.addAttribute("existReview", rowCount);
		model.addAttribute("viewName", "chat/chatMessage");
		return "template/layout";
	}
	
	@PostMapping("/chat_list_result_view")
	public String chatListResult(
			@RequestParam("chatRoomId") int chatRoomId,
			@RequestParam(value="sellerId", required=false) Integer sellerId,
			@RequestParam(value="buyerId", required=false) Integer buyerId, 
			@RequestParam(value="userNickname", required=false) String userNickname,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl,
			@RequestParam(value="chatContent", required=false) String chatContent,
			Model model) {
		
		// 메세지를 보냈을 때 DB insert
		if (sellerId != null && buyerId != null && userNickname != null && chatContent != null) {
			chatMessageBO.addChatMessage(chatRoomId, sellerId, buyerId, userNickname, profileImageUrl, chatContent);
		}
		
		// DB select - 채팅방에 대한 전체 메세지 가져오기
		List<ChatMessage> chatMessageList = chatMessageBO.getChatMessageListByChatRoomId(chatRoomId);
		
		// model에 리스트담아서 리턴
		model.addAttribute("chatMessageList", chatMessageList);
		return "chat/chatListResult";
	}
}
