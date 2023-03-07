package com.carrotMarket.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carrotMarket.user.bo.UserBO;
import com.carrotMarket.user.model.User;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserBO userBO;

	@GetMapping("/sign_up_view")
	public String signUpView(Model model) {
		model.addAttribute("viewName", "user/signUp");
		return "template/layout";
	}
	
	@GetMapping("/sign_in_view")
	public String signInView(Model model) {
		model.addAttribute("viewName", "user/signIn");
		return "template/layout";
	}
	
	@GetMapping("/sign_out")
	public String signOut(HttpSession session) {
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userNickname");
		
		return "redirect:/main/main_view";
	}
	
	@GetMapping("/user_info_view")
	public String userInfoView(
			Model model,
			HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		String loginId = (String)session.getAttribute("userLoginId");
		User user = userBO.getUserByLoginId(loginId);
		
		model.addAttribute("user", user);
		model.addAttribute("viewName", "user/userInfo");
		return "template/layout";
	}
	
	@GetMapping("/user_profile_view")
	public String userProfileView(
			Model model
			, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		String loginId = (String)session.getAttribute("userLoginId");
		User user = userBO.getUserByLoginId(loginId);
		
		model.addAttribute("user", user);
		model.addAttribute("viewName", "user/userProfile");
		return "template/layout";
	}
	
	@GetMapping("/user_profile_update_view")
	public String userProfileUpdateView(
			Model model
			, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/user/sign_in_view";
		}
		
		String loginId = (String)session.getAttribute("userLoginId");
		User user = userBO.getUserByLoginId(loginId);
		
		model.addAttribute("user", user);
		model.addAttribute("viewName", "user/userProfileUpdate");
		return "template/layout";
	}
}
