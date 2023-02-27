package com.carrotMarket.chatMessage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class ChatMessageController {

	@GetMapping("/chat/chat_message_view")
	public String chatMessageView(
			Model model,
			HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		model.addAttribute("userId", userId);
		model.addAttribute("viewName", "chat/chatMessage");
		return "template/layout";
	}
}
