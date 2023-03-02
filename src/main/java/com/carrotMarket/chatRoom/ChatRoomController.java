package com.carrotMarket.chatRoom;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.carrotMarket.chatMessage.bo.ChatMessageBO;
import com.carrotMarket.chatMessage.model.ChatMessage;
import com.carrotMarket.chatRoom.bo.ChatRoomBO;
import com.carrotMarket.chatRoom.model.ChatRoom;

import jakarta.servlet.http.HttpSession;

@Controller
public class ChatRoomController {
	
	@Autowired
	private ChatRoomBO chatRoomBO;
	
	@Autowired
	private ChatMessageBO chatMessageBO;

	@GetMapping("/chat_room_view")
	public String chatRoomView(Model model, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		// 가공필요할듯..??
		// DB select(사용자번호에 해당하는 채팅방 리스트들 가져오기)
		List<ChatRoom> chatRoomList = chatRoomBO.getChatRoomListByUserId(userId);
		
		// DB select(chatDB - 마지막 채팅내용, 시간 가져오기)
//		for (ChatRoom chatRoom : chatRoomList) {
//			ChatMessage chatMessage = chatMessageBO.getLastChatMessageByChatRoomId(chatRoom.getId());
//			
//		}
		
		model.addAttribute("chatRoomList", chatRoomList);
		model.addAttribute("viewName", "chat/chatRoom");
		return "template/layout";
	}
}
