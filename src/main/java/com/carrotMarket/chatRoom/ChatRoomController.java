package com.carrotMarket.chatRoom;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.carrotMarket.chatRoom.bo.ChatRoomBO;
import com.carrotMarket.chatRoom.model.ChatRoomView;

import jakarta.servlet.http.HttpSession;

@Controller
public class ChatRoomController {
	
	@Autowired
	private ChatRoomBO chatRoomBO;

	@GetMapping("/chat_room_view")
	public String chatRoomView(Model model, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		String userNickname = (String)session.getAttribute("userNickname");
		String userProfileImageUrl = (String)session.getAttribute("userProfileImageUrl");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		List<ChatRoomView> chatRoomViewList = chatRoomBO.generateChatRoomView(userId);
		
		model.addAttribute("chatRoomViewList", chatRoomViewList);
		model.addAttribute("viewName", "chat/chatRoom");
		return "template/layout";
	}
}
